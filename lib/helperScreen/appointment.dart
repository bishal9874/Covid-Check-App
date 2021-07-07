import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:covidcheck/models/appointmentModel.dart';
import 'package:covidcheck/services/ser.dart';
import 'package:covidcheck/videocall/pages/index.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:velocity_x/velocity_x.dart';

class AppointmentBooking extends StatefulWidget {
  const AppointmentBooking({Key key}) : super(key: key);

  @override
  _AppointmentBookingState createState() => _AppointmentBookingState();
}

class _AppointmentBookingState extends State<AppointmentBooking> {
  bool payVirtualAppoint = false;
  @override
  Widget build(BuildContext context) {
    // var height = MediaQuery.of(context).size.height;
    // var width = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: _buildAppBar(context),
        body: StreamBuilder<QuerySnapshot>(
          stream: CovidCheckApp.firestore
              .collection(CovidCheckApp.collectionUser)
              .doc(CovidCheckApp.sharedPreferences
                  .getString(CovidCheckApp.userUID))
              .collection(CovidCheckApp.appointmentcollection)
              .orderBy("submit_time", descending: true)
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
                    child: Text("Your Appointment Booking is Empty"),
                  ),
                );
              } else {
                return ListView.builder(
                  itemCount: dataShot.data.docs.length,
                  itemBuilder: (context, index) {
                    AppointModel model =
                        AppointModel.fromJson(dataShot.data.docs[index].data());

                    return uservaccineinfo(
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
          Text("Appointment Booking",
              style: GoogleFonts.comfortaa(fontSize: 18.0)),
          IconButton(onPressed: () {}, icon: Icon(Icons.more_vert_rounded)),
        ],
      ),
    );
  }

  Widget uservaccineinfo(AppointModel model, BuildContext context,
      {Color background, removeCartFunction}) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return InkWell(
        splashColor: Colors.grey,
        child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              padding: const EdgeInsets.all(10.0),
              height: model.adminApproval ? height * 0.33 : height * 0.40,
              width: width * 0.95,
              decoration: BoxDecoration(
                  color: model.adminApproval
                      ? Color(0xff405b6e)
                      : Colors.blueGrey[700],
                  borderRadius: BorderRadius.circular(10.0)),
              child: VStack([
                // Text(model.useremail),

                RichText(
                  text: TextSpan(
                    style: TextStyle(fontSize: 15.0),
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
                    style: TextStyle(fontSize: 15.0),
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
                    style: TextStyle(fontSize: 15.0),
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
                    style: TextStyle(fontSize: 15.0),
                    children: <TextSpan>[
                      TextSpan(
                          text: 'Age : ',
                          style: GoogleFonts.comfortaa(
                              fontWeight: FontWeight.w700,
                              color: Colors.white)),
                      TextSpan(
                          text: model.age,
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
                    style: TextStyle(fontSize: 15.0),
                    children: <TextSpan>[
                      TextSpan(
                          text: 'Phone No: ',
                          style: GoogleFonts.comfortaa(
                              fontWeight: FontWeight.w700,
                              color: Colors.white)),
                      TextSpan(
                          text: model.phoneNumber.toString(),
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
                    style: TextStyle(fontSize: 15.0),
                    children: <TextSpan>[
                      TextSpan(
                          text: 'Time Schedule: ',
                          style: GoogleFonts.comfortaa(
                              fontWeight: FontWeight.w700,
                              color: Colors.white)),
                      TextSpan(
                          text: model.daySchedule,
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
                    style: TextStyle(fontSize: 15.0),
                    children: <TextSpan>[
                      TextSpan(
                          text: 'Date : ',
                          style: GoogleFonts.comfortaa(
                              fontWeight: FontWeight.w700,
                              color: Colors.white)),
                      TextSpan(
                          text: model.dayselected,
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
                    style: TextStyle(fontSize: 15.0),
                    children: <TextSpan>[
                      TextSpan(
                          text: 'Doctor Name : ',
                          style: GoogleFonts.comfortaa(
                              fontWeight: FontWeight.w700,
                              color: Colors.white)),
                      TextSpan(
                          text: model.doctorName,
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
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      child: RichText(
                        text: TextSpan(
                          style: TextStyle(fontSize: 15.0),
                          children: <TextSpan>[
                            TextSpan(
                                text: 'Doctor Fee : ',
                                style: GoogleFonts.comfortaa(
                                    fontWeight: FontWeight.w700,
                                    color: Colors.white)),
                            TextSpan(
                                text: "₹ " + model.doctorFee,
                                style: GoogleFonts.comfortaa(
                                    fontWeight: FontWeight.w600,
                                    color: Colors.orange[200])),
                          ],
                        ),
                      ),
                    ),
                    model.adminApproval
                        ? Container(
                            height: height * 0.03,
                            width: width * 0.45,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                                color: Colors.blueGrey[800]),
                            child: Text("Check Up Complete",
                                    style: GoogleFonts.comfortaa(
                                        fontSize: 12.0,
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
                            child: Text("Check Up Not Complete",
                                    style: GoogleFonts.comfortaa(
                                        fontSize: 12.0,
                                        fontWeight: FontWeight.w600,
                                        color: Color(0xfffc0000)))
                                .centered(),
                          )
                  ],
                ),
                SizedBox(
                  height: height * 0.01,
                ),
                model.adminApproval
                    ? SizedBox(height: height * .01)
                    : Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            onTap: () {
                              showDialog(
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
                                                  "Are Your Sure !! You want to cancel your Dr. ${model.doctorName} Appointment",
                                                  style: GoogleFonts.comfortaa(
                                                      fontSize: 17.0),
                                                ),
                                              ).centered(),
                                              SizedBox(
                                                height: height * 0.03,
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  GestureDetector(
                                                    onTap: () {
                                                      Navigator.of(context)
                                                          .pop();
                                                    },
                                                    child: Container(
                                                        height: height * 0.06,
                                                        width: width * 0.31,
                                                        child: Material(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5.0),
                                                            color: Color(
                                                                0xFF2877ed),
                                                            elevation: 0.0,
                                                            child: Center(
                                                                child: Text(
                                                                    'No',
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
                                                      removecart(
                                                        model.refaranceID,
                                                        model.nameofpatient,
                                                      );
                                                      Navigator.of(context)
                                                          .pop();
                                                    },
                                                    child: Container(
                                                        height: height * 0.06,
                                                        width: width * 0.31,
                                                        child: Material(
                                                            borderRadius:
                                                                BorderRadius.circular(
                                                                    5.0),
                                                            color: Colors.red,
                                                            elevation: 0.0,
                                                            child: Center(
                                                                child: Text(
                                                                    'Yes',
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
                                  });
                            },
                            child: Container(
                                height: height * 0.06,
                                width: width * 0.43,
                                child: Material(
                                    borderRadius: BorderRadius.circular(5.0),
                                    color: Colors.red,
                                    elevation: 0.0,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
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
                              showDialog(
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
                                              model.payvirtualAppoint
                                                  ? model.virtualAppoint
                                                      ? Container(
                                                          height: height * 0.10,
                                                          width: width * 0.48,
                                                          child: Text(
                                                            "Approval Complete join Covidcheck Agora Video Call",
                                                            style: GoogleFonts
                                                                .comfortaa(
                                                                    fontSize:
                                                                        17.0),
                                                          ),
                                                        ).centered()
                                                      : Container(
                                                          height: height * 0.10,
                                                          width: width * 0.48,
                                                          child: Text(
                                                            "Wait For Admin Approval and try between ${model.daySchedule} on ${model.dayselected}",
                                                            style: GoogleFonts
                                                                .comfortaa(
                                                                    fontSize:
                                                                        17.0),
                                                          ),
                                                        ).centered()
                                                  : Container(
                                                      height: height * 0.10,
                                                      width: width * 0.48,
                                                      child: Text(
                                                        "If you want virtual Appointment So you just pay ₹ ${model.doctorFee} For Doctor Fee",
                                                        style: GoogleFonts
                                                            .comfortaa(
                                                                fontSize: 17.0),
                                                      ),
                                                    ).centered(),
                                              SizedBox(
                                                height: height * 0.02,
                                              ),
                                              model.payvirtualAppoint
                                                  ? model.virtualAppoint
                                                      ? GestureDetector(
                                                          onTap: () {
                                                            Get.to(IndexPage(
                                                              doctorName: model
                                                                  .doctorName,
                                                            ));
                                                            // Navigator.pop(
                                                            //     context);
                                                          },
                                                          child: Container(
                                                              height:
                                                                  height * 0.06,
                                                              width:
                                                                  width * 0.31,
                                                              child: Material(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              5.0),
                                                                  color: Color(
                                                                      0xff0d98de),
                                                                  elevation:
                                                                      0.0,
                                                                  child: Center(
                                                                      child: Text(
                                                                          'join',
                                                                          style: GoogleFonts.comfortaa(
                                                                              color: Colors.white,
                                                                              fontWeight: FontWeight.w600,
                                                                              fontSize: 18.0))))),
                                                        )
                                                      : Container(
                                                          height: height * 0.06,
                                                          width: width * 0.31,
                                                          child: Material(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          5.0),
                                                              color: Color(
                                                                  0xffd43f00),
                                                              elevation: 0.0,
                                                              child: Center(
                                                                  child: Text(
                                                                      'Waiting.....',
                                                                      style: GoogleFonts.comfortaa(
                                                                          color: Colors
                                                                              .white,
                                                                          fontWeight: FontWeight
                                                                              .w600,
                                                                          fontSize:
                                                                              18.0)))))
                                                  : Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        GestureDetector(
                                                          onTap: () {
                                                            Navigator.of(
                                                                    context)
                                                                .pop();
                                                          },
                                                          child: Container(
                                                              height:
                                                                  height * 0.06,
                                                              width:
                                                                  width * 0.31,
                                                              child: Material(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              5.0),
                                                                  color: Color(
                                                                      0xFF7228c7),
                                                                  elevation:
                                                                      0.0,
                                                                  child: Center(
                                                                      child: Text(
                                                                          'No',
                                                                          style: GoogleFonts.comfortaa(
                                                                              color: Colors.white,
                                                                              fontWeight: FontWeight.w600,
                                                                              fontSize: 18.0))))),
                                                        ),
                                                        GestureDetector(
                                                          onTap: () {
                                                            setState(() {
                                                              model.payvirtualAppoint =
                                                                  !model
                                                                      .payvirtualAppoint;
                                                              CovidCheckApp
                                                                  .firestore
                                                                  .collection(
                                                                      CovidCheckApp
                                                                          .collectionUser)
                                                                  .doc(model
                                                                      .userUid)
                                                                  .collection(
                                                                      CovidCheckApp
                                                                          .appointmentcollection)
                                                                  .doc(model
                                                                          .refaranceID +
                                                                      model
                                                                          .nameofpatient)
                                                                  .update({
                                                                "payvirtualAppoint":
                                                                    model
                                                                        .payvirtualAppoint
                                                              });
                                                              CovidCheckApp
                                                                  .firestore
                                                                  .collection(
                                                                      "apppointment")
                                                                  .doc(model
                                                                          .userUid +
                                                                      model
                                                                          .refaranceID)
                                                                  .update({
                                                                "payvirtualAppoint":
                                                                    model
                                                                        .payvirtualAppoint
                                                              });
                                                              CovidCheckApp
                                                                  .firestore
                                                                  .collection(
                                                                      "virtualAppointment")
                                                                  .doc(model
                                                                          .userUid +
                                                                      model
                                                                          .refaranceID)
                                                                  .set({
                                                                "doctorAppointCentre":
                                                                    model
                                                                        .organization,
                                                                "phone_number":
                                                                    model
                                                                        .phoneNumber,
                                                                "userUI": CovidCheckApp
                                                                    .sharedPreferences
                                                                    .getString(
                                                                        CovidCheckApp
                                                                            .userUID),
                                                                "username": CovidCheckApp
                                                                    .sharedPreferences
                                                                    .getString(
                                                                        CovidCheckApp
                                                                            .userName),
                                                                "useremail": CovidCheckApp
                                                                    .sharedPreferences
                                                                    .getString(
                                                                        CovidCheckApp
                                                                            .userEmail),
                                                                "name": model
                                                                    .nameofpatient,
                                                                "age":
                                                                    model.age,
                                                                "seasonChoice":
                                                                    model
                                                                        .daySchedule,
                                                                "gender": model
                                                                    .genderChoice,
                                                                "dateSelection":
                                                                    model
                                                                        .dayselected,
                                                                "doctorName": model
                                                                    .doctorName,
                                                                "doctorFee": model
                                                                    .doctorFee,
                                                                "submit_time": model
                                                                    .refaranceID,
                                                                "docnumber": model
                                                                    .docnumber,
                                                                "adminApproval":
                                                                    model
                                                                        .adminApproval,
                                                                "virtualAppoint":
                                                                    model
                                                                        .virtualAppoint,
                                                                "payvirtualAppoint":
                                                                    model
                                                                        .payvirtualAppoint
                                                              });
                                                              Navigator.pop(
                                                                  context);
                                                              print(model
                                                                  .payvirtualAppoint);
                                                            });
                                                          },
                                                          child: Container(
                                                              height:
                                                                  height * 0.06,
                                                              width:
                                                                  width * 0.31,
                                                              child: Material(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              5.0),
                                                                  color: Color(
                                                                      0xff0d98de),
                                                                  elevation:
                                                                      0.0,
                                                                  child: Center(
                                                                      child: Text(
                                                                          'Pay',
                                                                          style: GoogleFonts.comfortaa(
                                                                              color: Colors.white,
                                                                              fontWeight: FontWeight.w600,
                                                                              fontSize: 18.0))))),
                                                        ),
                                                      ],
                                                    )
                                            ],
                                          )),
                                    );
                                  });
                            },
                            child: Container(
                                height: height * 0.06,
                                width: width * 0.43,
                                child: Material(
                                    borderRadius: BorderRadius.circular(5.0),
                                    color:
                                        //model.approve
                                        //?
                                        Colors.lightGreen,
                                    //:
                                    // Colors.red[300],
                                    elevation: 0.0,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                            // model.approve
                                            //? "Certificate"
                                            //:
                                            "Virtual Appointment",
                                            style: GoogleFonts.comfortaa(
                                                fontSize: 12.0,
                                                fontWeight: FontWeight.w600)),
                                        SizedBox(
                                          width: width * 0.02,
                                        ),
                                        Icon(
                                          //model.approve
                                          //?
                                          //ontAwesomeIcons.userCheck
                                          // :
                                          FontAwesomeIcons.user,
                                          size: 12.0,
                                        ),
                                      ],
                                    ))),
                          )
                        ],
                      )
              ]),
            ).centered()));
  }

  removecart(String docID, String docname) {
    CovidCheckApp.firestore
        .collection(CovidCheckApp.collectionUser)
        .doc(CovidCheckApp.sharedPreferences.getString(CovidCheckApp.userUID))
        .collection(CovidCheckApp.appointmentcollection)
        .doc(docID + docname)
        .delete()
        .then((value) => VxToast.show(
              context,
              msg: "Your Appointment Booking is Cancelled Successfully",
              showTime: 4000,
              bgColor: Colors.redAccent,
              textColor: Colors.white,
              position: VxToastPosition.bottom,
            ));
    CovidCheckApp.firestore
        .collection("apppointment")
        .doc(CovidCheckApp.sharedPreferences.getString(CovidCheckApp.userUID) +
            docID)
        .delete();
  }
}
