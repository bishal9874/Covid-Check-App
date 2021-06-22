import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:covidcheck/counter/booking_counter.dart';
import 'package:covidcheck/models/orgServiecs.dart';
import 'package:covidcheck/models/vaccinationModel.dart';
import 'package:covidcheck/services/ser.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:velocity_x/velocity_x.dart';

class VaccineBook extends StatefulWidget {
  @override
  _VaccineBookState createState() => _VaccineBookState();
}

class _VaccineBookState extends State<VaccineBook> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance
              .collection("vaccine")
              .where("aadharnumber",
                  whereIn: CovidCheckApp.sharedPreferences
                      .getStringList(CovidCheckApp.userCartList))
              .orderBy("publishDate", descending: true)
              .snapshots(),
          builder: (context, dataShot) {
            if (!dataShot.hasData) {
              return Container(
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              );
            } else {
              if (dataShot.data.docs.length == 0) {
                return Container(
                  child: Center(
                    child: Text("Cart is Empty"),
                  ),
                );
              } else {
                return ListView.builder(
                  itemCount: dataShot.data.docs.length,
                  itemBuilder: (context, index) {
                    VaccineModel model =
                        VaccineModel.fromJson(dataShot.data.docs[index].data());

                    return vaccineinfo(model, context);
                  },
                );
              }
            }
          },
        ));
  }

  beginbuildCart() {}

  Widget vaccineinfo(VaccineModel model, BuildContext context,
      {Color background, removeCartFunction}) {
    return InkWell(
        onTap: () {
          //Get.to(OrgDetailPage(orgModel: model));
        },
        splashColor: Colors.grey,
        child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              child: HStack([
                VStack([
                  Text(model.useremail),
                  Text(model.username),
                  Text(model.organization),
                  Text(model.nameofvacciner),
                  Text(model.season),
                  Text(model.dateTime.toDate().toString()),
                  Text(model.aadherNumber.toString()),
                  Text(model.birthyr.toString()),
                ]),
                IconButton(
                    onPressed: () {
                      removecart();
                    },
                    icon: Icon(Icons.remove_shopping_cart))
              ]),
            )));
  }

  removecart() {
    // CovidCheckApp.firestore
    //     .collection(CovidCheckApp.vaccinecollection)
    //     .doc(CovidCheckApp.sharedPreferences.getString(CovidCheckApp.vaccineUI))
    //     .delete();
  }
}
