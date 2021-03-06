import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:covidcheck/models/bloodmodel.dart';
import 'package:covidcheck/services/ser.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:velocity_x/velocity_x.dart';

class BloodBooking extends StatefulWidget {
  @override
  _BloodBookingState createState() => _BloodBookingState();
}

class _BloodBookingState extends State<BloodBooking> {
  @override
  Widget build(BuildContext context) {
    // var height = MediaQuery.of(context).size.height;
    // var width = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: _buildAppBar(context),
        body: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance
              .collection(CovidCheckApp.collectionUser)
              .doc(CovidCheckApp.sharedPreferences
                  .getString(CovidCheckApp.userUID))
              .collection(CovidCheckApp.bloodbankcollection)
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
                    child: Text("Your Blood Booking is Empty"),
                  ),
                );
              } else {
                return ListView.builder(
                  itemCount: dataShot.data.docs.length,
                  itemBuilder: (context, index) {
                    BloodModel model =
                        BloodModel.fromJson(dataShot.data.docs[index].data());

                    return bloodinfo(model, context);
                  },
                );
              }
            }
          },
        ));
  }

  _buildAppBar(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.blueGrey[700],
      automaticallyImplyLeading: false,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          IconButton(
              onPressed: () {
                Get.back();
              },
              icon: Icon(FontAwesomeIcons.chevronLeft)),
          Text("Blood Booking", style: GoogleFonts.comfortaa(fontSize: 18.0)),
          IconButton(onPressed: () {}, icon: Icon(Icons.more_vert_rounded)),
        ],
      ),
    );
  }

  beginbuildCart() {}

  Widget bloodinfo(BloodModel model, BuildContext context,
      {Color background, removeCartFunction}) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return InkWell(
        splashColor: Colors.grey,
        child: Padding(
          padding: EdgeInsets.all(10.0),
          child: Container(
            padding: const EdgeInsets.all(10.0),
            height: model.adminApproval ? height * 0.30 : height * 0.35,
            width: width * 0.95,
            decoration: BoxDecoration(
                color: Colors.blueGrey[700],
                borderRadius: BorderRadius.circular(10.0)),
            child: VStack([
              // Text(model.useremail),
              // Text(model.username),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  VStack([
                    RichText(
                      text: TextSpan(
                        style: TextStyle(fontSize: 14.0),
                        children: <TextSpan>[
                          TextSpan(
                              text: 'Heath-Org : ',
                              style: GoogleFonts.comfortaa(
                                  fontWeight: FontWeight.w700,
                                  color: Colors.white)),
                          TextSpan(
                              text: model.organization,
                              style: GoogleFonts.comfortaa(
                                  fontWeight: FontWeight.w600,
                                  color: Colors.orange[200])),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: height * 0.01,
                    ),
                    RichText(
                      text: TextSpan(
                        style: TextStyle(fontSize: 14.0),
                        children: <TextSpan>[
                          TextSpan(
                              text: 'Patient : ',
                              style: GoogleFonts.comfortaa(
                                  fontWeight: FontWeight.w700,
                                  color: Colors.white)),
                          TextSpan(
                              text: model.nameofpatient,
                              style: GoogleFonts.comfortaa(
                                  fontWeight: FontWeight.w600,
                                  color: Colors.orange[200])),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: height * 0.01,
                    ),
                    RichText(
                      text: TextSpan(
                        style: TextStyle(fontSize: 14.0),
                        children: <TextSpan>[
                          TextSpan(
                              text: 'Gender: ',
                              style: GoogleFonts.comfortaa(
                                  fontWeight: FontWeight.w700,
                                  color: Colors.white)),
                          TextSpan(
                              text: model.genderChoice,
                              style: GoogleFonts.comfortaa(
                                  fontWeight: FontWeight.w600,
                                  color: Colors.orange[200])),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: height * 0.01,
                    ),
                    RichText(
                      text: TextSpan(
                        style: TextStyle(fontSize: 14.0),
                        children: <TextSpan>[
                          TextSpan(
                              text: 'Phone Number : ',
                              style: GoogleFonts.comfortaa(
                                  fontWeight: FontWeight.w700,
                                  color: Colors.white)),
                          TextSpan(
                              text: model.phonenumber.toString(),
                              style: GoogleFonts.comfortaa(
                                  fontWeight: FontWeight.w600,
                                  color: Colors.orange[200])),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: height * 0.01,
                    ),
                    RichText(
                      text: TextSpan(
                        style: TextStyle(fontSize: 14.0),
                        children: <TextSpan>[
                          TextSpan(
                              text: 'Aadhar No: ',
                              style: GoogleFonts.comfortaa(
                                  fontWeight: FontWeight.w700,
                                  color: Colors.white)),
                          TextSpan(
                              text: model.aadherNumber.toString(),
                              style: GoogleFonts.comfortaa(
                                  fontWeight: FontWeight.w600,
                                  color: Colors.orange[200])),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: height * 0.01,
                    ),
                    RichText(
                      text: TextSpan(
                        style: TextStyle(fontSize: 14.0),
                        children: <TextSpan>[
                          TextSpan(
                              text: 'Booking Date : ',
                              style: GoogleFonts.comfortaa(
                                  fontWeight: FontWeight.w700,
                                  color: Colors.white)),
                          TextSpan(
                              text: model.dateTime.toDate().toString(),
                              style: GoogleFonts.comfortaa(
                                  fontWeight: FontWeight.w600,
                                  color: Colors.orange[200])),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: height * 0.01,
                    ),
                    RichText(
                      text: TextSpan(
                        style: TextStyle(fontSize: 14.0),
                        children: <TextSpan>[
                          TextSpan(
                              text: 'Blood Group : ',
                              style: GoogleFonts.comfortaa(
                                  fontWeight: FontWeight.w700,
                                  color: Colors.white)),
                          TextSpan(
                              text: model.bloodChoice,
                              style: GoogleFonts.comfortaa(
                                  fontWeight: FontWeight.w600,
                                  color: Colors.orange[200])),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: height * 0.01,
                    ),
                    model.adminApproval
                        ? Container(
                            height: height * 0.03,
                            width: width * 0.45,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                                color: Colors.blueGrey[800]),
                            child: Text("Received",
                                    style: GoogleFonts.comfortaa(
                                        fontSize: 14.0,
                                        fontWeight: FontWeight.w600,
                                        color: Color(0xff5dfc00)))
                                .centered(),
                          )
                        : Container(
                            height: height * 0.03,
                            width: width * 0.48,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                                color: Colors.blueGrey[300]),
                            child: Text("Not Received",
                                    style: GoogleFonts.comfortaa(
                                        fontSize: 12.0,
                                        fontWeight: FontWeight.w600,
                                        color: Color(0xfffc0000)))
                                .centered(),
                          )
                  ]),
                  VStack([
                    Text("Prescription",
                        style: GoogleFonts.comfortaa(
                            fontWeight: FontWeight.w600,
                            fontSize: 13.0,
                            color: Colors.white)),
                    SizedBox(
                      height: height * .01,
                    ),
                    Container(
                      height: height * 0.10,
                      width: width * .20,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5.0),
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(model.prescriptionProve))),
                    ),
                  ]).centered(),
                ],
              ),

              SizedBox(
                height: height * 0.01,
              ),
              model.adminApproval
                  ? SizedBox(height: height * 0.01)
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () => showDialog(
                              context: context,
                              builder: (c) {
                                return AlertDialog(
                                  backgroundColor: Colors.blueGrey[700],
                                  contentPadding: EdgeInsets.all(8.0),
                                  content: Container(
                                      height: height * 0.25,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Container(
                                            height: height * 0.10,
                                            width: width * 0.45,
                                            child: Text(
                                              "Are Your Sure !! You want to cancel your ${model.bloodChoice} group BloodBooking",
                                              style: GoogleFonts.comfortaa(
                                                  fontSize: 17.0),
                                            ),
                                          ).centered(),
                                          SizedBox(
                                            height: height * 0.03,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              GestureDetector(
                                                onTap: () {
                                                  Navigator.of(context).pop();
                                                },
                                                child: Container(
                                                    height: height * 0.06,
                                                    width: width * 0.31,
                                                    child: Material(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(5.0),
                                                        color:
                                                            Color(0xFF2877ed),
                                                        elevation: 0.0,
                                                        child: Center(
                                                            child: Text('No',
                                                                style: GoogleFonts.comfortaa(
                                                                    color: Colors
                                                                        .white,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600,
                                                                    fontSize:
                                                                        18.0))))),
                                              ),
                                              GestureDetector(
                                                onTap: () {
                                                  removecart(model.aadherNumber
                                                      .toString());
                                                  Navigator.of(context).pop();
                                                },
                                                child: Container(
                                                    height: height * 0.06,
                                                    width: width * 0.31,
                                                    child: Material(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(5.0),
                                                        color: Colors.red,
                                                        elevation: 0.0,
                                                        child: Center(
                                                            child: Text('Yes',
                                                                style: GoogleFonts.comfortaa(
                                                                    color: Colors
                                                                        .white,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600,
                                                                    fontSize:
                                                                        18.0))))),
                                              ),
                                            ],
                                          )
                                        ],
                                      )),
                                );
                              }),
                          child: Container(
                              height: height * 0.06,
                              width: width * 0.43,
                              child: Material(
                                  borderRadius: BorderRadius.circular(5.0),
                                  color: Colors.red,
                                  elevation: 0.0,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text("Cancel",
                                          style: GoogleFonts.comfortaa(
                                              fontSize: 16.0,
                                              fontWeight: FontWeight.w600)),
                                      SizedBox(
                                        width: width * 0.02,
                                      ),
                                      Icon(
                                        FontAwesomeIcons.trashAlt,
                                        size: 18.0,
                                      ),
                                    ],
                                  ))),
                        ),
                      ],
                    )
            ]),

            //   IconButton(
            //       onPressed: () {
            //         removecart(model.aadherNumber.toString());
            //       },
            //       icon: Icon(Icons.remove_shopping_cart))
            // ]),
          ).centered(),
        ));
  }

  removecart(String mod) {
    CovidCheckApp.firestore
        .collection(CovidCheckApp.collectionUser)
        .doc(CovidCheckApp.sharedPreferences.getString(CovidCheckApp.userUID))
        .collection(CovidCheckApp.bloodbankcollection)
        .doc(CovidCheckApp.sharedPreferences.getString(CovidCheckApp.userUID) +
            mod)
        .delete()
        .then((value) {
      VxToast.show(
        context,
        msg: "Your Blood Booking Cancel Successfully",
        showTime: 6000,
        position: VxToastPosition.bottom,
      );
    });
    CovidCheckApp.firestore
        .collection("BloodBank")
        .doc(CovidCheckApp.sharedPreferences.getString(CovidCheckApp.userUID) +
            mod)
        .delete();
  }
}
