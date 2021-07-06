import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:covidcheck/models/vaccinationModel.dart';
import 'package:covidcheck/services/ser.dart';

import 'package:flutter/material.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:velocity_x/velocity_x.dart';

class Vaccineadmin extends StatefulWidget {
  @override
  _VaccineadminState createState() => _VaccineadminState();
}

class _VaccineadminState extends State<Vaccineadmin> {
  bool approval = false;
  @override
  Widget build(BuildContext context) {
    // var height = MediaQuery.of(context).size.height;
    // var width = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: _buildAppBar(context),
        body: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance
              .collection("vaccine")
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
                    child: Text("Your Vaccine Booking is Empty"),
                  ),
                );
              } else {
                return ListView.builder(
                  itemCount: dataShot.data.docs.length,
                  itemBuilder: (context, index) {
                    VaccineModel model =
                        VaccineModel.fromJson(dataShot.data.docs[index].data());

                    return vaccineinfo(
                      model,
                      context,
                    );
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
          Text("Admin Vaccine Booking",
              style: GoogleFonts.comfortaa(fontSize: 18.0)),
          IconButton(onPressed: () {}, icon: Icon(Icons.more_vert_rounded)),
        ],
      ),
    );
  }

  beginbuildCart() {}

  Widget vaccineinfo(VaccineModel model, BuildContext context,
      {Color background, removeCartFunction}) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return InkWell(
        splashColor: Colors.grey,
        child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              padding: const EdgeInsets.all(10.0),
              height: height * 0.60,
              width: width * 0.95,
              decoration: BoxDecoration(
                  color: Colors.blueGrey[700],
                  borderRadius: BorderRadius.circular(10.0)),
              child: VStack([
                RichText(
                  text: TextSpan(
                    style: TextStyle(fontSize: 16.0),
                    children: <TextSpan>[
                      TextSpan(
                          text: 'User UI : ',
                          style: GoogleFonts.comfortaa(
                              fontWeight: FontWeight.w700,
                              color: Colors.white)),
                      TextSpan(
                          text: model.userUid,
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
                    style: TextStyle(fontSize: 16.0),
                    children: <TextSpan>[
                      TextSpan(
                          text: 'Doc ID : ',
                          style: GoogleFonts.comfortaa(
                              fontWeight: FontWeight.w700,
                              color: Colors.white)),
                      TextSpan(
                          text: model.docNo,
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
                    style: TextStyle(fontSize: 16.0),
                    children: <TextSpan>[
                      TextSpan(
                          text: 'User Email: ',
                          style: GoogleFonts.comfortaa(
                              fontWeight: FontWeight.w700,
                              color: Colors.white)),
                      TextSpan(
                          text: model.useremail,
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
                    style: TextStyle(fontSize: 16.0),
                    children: <TextSpan>[
                      TextSpan(
                          text: 'Referance Id: ',
                          style: GoogleFonts.comfortaa(
                              fontWeight: FontWeight.w700,
                              color: Colors.white)),
                      TextSpan(
                          text: model.publishedDate.millisecondsSinceEpoch
                              .toString(),
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
                    style: TextStyle(fontSize: 16.0),
                    children: <TextSpan>[
                      TextSpan(
                          text: 'User Name : ',
                          style: GoogleFonts.comfortaa(
                              fontWeight: FontWeight.w700,
                              color: Colors.white)),
                      TextSpan(
                          text: model.username,
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
                    style: TextStyle(fontSize: 16.0),
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
                    style: TextStyle(fontSize: 16.0),
                    children: <TextSpan>[
                      TextSpan(
                          text: 'Patient : ',
                          style: GoogleFonts.comfortaa(
                              fontWeight: FontWeight.w700,
                              color: Colors.white)),
                      TextSpan(
                          text: model.nameofvacciner,
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
                    style: TextStyle(fontSize: 16.0),
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
                    style: TextStyle(fontSize: 16.0),
                    children: <TextSpan>[
                      TextSpan(
                          text: 'DOB year : ',
                          style: GoogleFonts.comfortaa(
                              fontWeight: FontWeight.w700,
                              color: Colors.white)),
                      TextSpan(
                          text: model.birthyr.toString(),
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
                    style: TextStyle(fontSize: 16.0),
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
                    style: TextStyle(fontSize: 16.0),
                    children: <TextSpan>[
                      TextSpan(
                          text: 'Vaccine: ',
                          style: GoogleFonts.comfortaa(
                              fontWeight: FontWeight.w700,
                              color: Colors.white)),
                      TextSpan(
                          text: model.vacineChoice,
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
                    style: TextStyle(fontSize: 16.0),
                    children: <TextSpan>[
                      TextSpan(
                          text: 'Booking Date : ',
                          style: GoogleFonts.comfortaa(
                              fontWeight: FontWeight.w700,
                              color: Colors.white)),
                      TextSpan(
                          text: model.dateTime,
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
                    style: TextStyle(fontSize: 16.0),
                    children: <TextSpan>[
                      TextSpan(
                          text: 'Season : ',
                          style: GoogleFonts.comfortaa(
                              fontWeight: FontWeight.w700,
                              color: Colors.white)),
                      TextSpan(
                          text: model.season,
                          // text: model.docNo,
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
                    style: TextStyle(fontSize: 16.0),
                    children: <TextSpan>[
                      TextSpan(
                          text: 'Approval : ',
                          style: GoogleFonts.comfortaa(
                              fontWeight: FontWeight.w700,
                              color: Colors.white)),
                      TextSpan(
                          text: model.approve.toString(),
                          // text: model.docNo,
                          style: GoogleFonts.comfortaa(
                              fontWeight: FontWeight.w600,
                              color: Colors.orange[200])),
                    ],
                  ),
                ),
                SizedBox(
                  height: height * 0.01,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Container(
                                        height: height * 0.10,
                                        width: width * 0.45,
                                        child: Text(
                                          "Are Your Sure !! You want to cancel your vaccination",
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
                                                    borderRadius: BorderRadius
                                                        .circular(5.0),
                                                    color: Color(0xFF2877ed),
                                                    elevation: 0.0,
                                                    child: Center(
                                                        child: Text('No',
                                                            style: GoogleFonts
                                                                .comfortaa(
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
                                              // removecart(
                                              //     model.aadherNumber.toString(),
                                              //     model.organization,
                                              //     model.vacineChoice,
                                              //     model.vaccAvailable,
                                              //     model.dateTime,
                                              //     model.docNo);
                                              Navigator.of(context).pop();
                                            },
                                            child: Container(
                                                height: height * 0.06,
                                                width: width * 0.31,
                                                child: Material(
                                                    borderRadius: BorderRadius
                                                        .circular(5.0),
                                                    color: Colors.red,
                                                    elevation: 0.0,
                                                    child: Center(
                                                        child: Text('Yes',
                                                            style: GoogleFonts
                                                                .comfortaa(
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
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          approval = !approval;
                          CovidCheckApp.firestore
                              .collection(CovidCheckApp.collectionUser)
                              .doc(model.userUid)
                              .collection(CovidCheckApp.vaccinecollection)
                              .doc(
                                  model.userUid + model.aadherNumber.toString())
                              .update({"approval": approval});
                          CovidCheckApp.firestore
                              .collection("vaccine")
                              .doc(
                                  model.userUid + model.aadherNumber.toString())
                              .update({"approval": approval});
                          print(approval);
                        });
                      },
                      child: Container(
                          height: height * 0.06,
                          width: width * 0.43,
                          child: Material(
                              borderRadius: BorderRadius.circular(5.0),
                              color: model.approve
                                  ? Colors.lightGreen
                                  : Colors.red,
                              elevation: 0.0,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(model.approve ? "Approved" : "Approval",
                                      style: GoogleFonts.comfortaa(
                                          fontSize: 16.0,
                                          fontWeight: FontWeight.w600)),
                                  SizedBox(
                                    width: width * 0.02,
                                  ),
                                  Icon(
                                    model.approve
                                        ? FontAwesomeIcons.userCheck
                                        : FontAwesomeIcons.user,
                                    size: 18.0,
                                  ),
                                ],
                              ))),
                    )
                  ],
                )
              ]),
            ).centered()));
  }
}
