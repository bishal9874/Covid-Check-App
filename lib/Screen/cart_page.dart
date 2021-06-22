import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:covidcheck/Screen/addressPage.dart';
import 'package:covidcheck/counter/booking_counter.dart';
import 'package:covidcheck/counter/totalamount.dart';
import 'package:covidcheck/models/orgServiecs.dart';
import 'package:covidcheck/services/ser.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CartPage extends StatefulWidget {
  const CartPage({Key key}) : super(key: key);

  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  double docfees1;
  double docfees2;
  double docfees3;

  double totalAmount;

  @override
  void initState() {
    super.initState();
    totalAmount = 0;
    Provider.of<TotalAmount>(context, listen: false).display(0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          if (CovidCheckApp.sharedPreferences
                  .getStringList(CovidCheckApp.userCartList)
                  .length ==
              1) {
            Fluttertoast.showToast(msg: "Cart is empty");
          } else {
            Get.to(AddresssPage());
          }
        },
        label: Text("Check out"),
        backgroundColor: Colors.blue[800],
        icon: Icon(Icons.navigate_next),
      ),
      appBar: AppBar(),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Consumer2<TotalAmount, BookItemCounter>(
              builder: (context, amountProvider, cartProvider, c) {
                return Padding(
                  padding: EdgeInsets.all(8.0),
                  child: cartProvider.count == 0
                      ? Container()
                      : Text(
                          "Totat Price : ₹ ${amountProvider.totalAmount.toString()}",
                          style: GoogleFonts.notoSans(
                              color: Colors.black,
                              fontSize: 20.0,
                              fontWeight: FontWeight.w500)),
                );
              },
            ),
          ),
          StreamBuilder<QuerySnapshot>(
            stream: CovidCheckApp.firestore
                .collection("DoctorAppoint")
                .where("AppointBooking",
                    whereIn: CovidCheckApp.sharedPreferences
                        .getStringList(CovidCheckApp.userCartList))
                .snapshots(),
            builder: (context, snapshot) {
              return !snapshot.hasData
                  ? SliverToBoxAdapter(
                      child: Center(
                        child: CircularProgressIndicator(),
                      ),
                    )
                  : snapshot.data.docs.length == 0
                      ? beginbuildCart()
                      : SliverList(
                          delegate: SliverChildBuilderDelegate(
                              (context, index) {
                          OrgModel model = OrgModel.fromJson(
                              snapshot.data.docs[index].data());
                          if (index == 0) {
                            totalAmount = 0;
                            totalAmount = docfees1 + docfees2 + docfees3;
                            docfees1 = model.doc1fees + totalAmount;
                            docfees2 = model.doc2fees + totalAmount;
                            docfees3 = model.doc3fees + totalAmount;
                          } else {
                            totalAmount = docfees1 + docfees2 + docfees3;
                          }
                          if (snapshot.data.docs.length - 1 == index) {
                            WidgetsBinding.instance
                                .addPostFrameCallback((timeStamp) {
                              Provider.of<TotalAmount>(context, listen: false)
                                  .display(totalAmount);
                            });
                          }
                        },
                              childCount: snapshot.hasData
                                  ? snapshot.data.docs.length
                                  : 0));
            },
          )
        ],
      ),
    );
  }

  beginbuildCart() {}
}
