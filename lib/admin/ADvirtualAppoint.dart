import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:covidcheck/models/appointmentModel.dart';
import 'package:covidcheck/models/virtualAppointModel.dart';
import 'package:covidcheck/services/ser.dart';
import 'package:covidcheck/videocall/pages/index.dart';

import 'package:flutter/material.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:velocity_x/velocity_x.dart';

class VirtualAppointmentadmin extends StatefulWidget {
  @override
  _VirtualAppointmentadminState createState() =>
      _VirtualAppointmentadminState();
}

class _VirtualAppointmentadminState extends State<VirtualAppointmentadmin> {
  @override
  Widget build(BuildContext context) {
    // var height = MediaQuery.of(context).size.height;
    // var width = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: _buildAppBar(context),
        body: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance
              .collection("virtualAppointment")
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
                    child: Text("Your Vaccine Booking is Empty"),
                  ),
                );
              } else {
                return ListView.builder(
                  itemCount: dataShot.data.docs.length,
                  itemBuilder: (context, index) {
                    VirtualAppointModel model = VirtualAppointModel.fromJson(
                        dataShot.data.docs[index].data());

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
          Text("Admin Virtual Appointment Booking",
              style: GoogleFonts.comfortaa(fontSize: 12.0)),
          IconButton(onPressed: () {}, icon: Icon(Icons.more_vert_rounded)),
        ],
      ),
    );
  }

  beginbuildCart() {}

  Widget vaccineinfo(VirtualAppointModel model, BuildContext context,
      {Color background, removeCartFunction}) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return InkWell(
        splashColor: Colors.grey,
        child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              padding: const EdgeInsets.all(10.0),
              height: height * 0.80,
              width: width * 0.95,
              decoration: BoxDecoration(
                  color: model.virtualAppoint
                      ? Colors.white
                      : Colors.blueGrey[700],
                  borderRadius: BorderRadius.circular(10.0)),
              child: VStack([
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: height * 0.04,
                      width: width * 0.65,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          color: Colors.blueGrey[800]),
                      child: Text(model.nameofpatient,
                              style: GoogleFonts.comfortaa(
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xff5dfc00)))
                          .centered(),
                    ),
                    model.virtualAppoint
                        ? InkWell(
                            onTap: () {
                              CovidCheckApp.firestore
                                  .collection("virtualAppointment")
                                  .doc(model.userUid + model.refaranceID)
                                  .delete()
                                  .then((value) => VxToast.show(
                                        context,
                                        msg:
                                            "Patient ${model.nameofpatient} Check Up completed and deleted from the database",
                                        showTime: 4000,
                                        bgColor: Colors.redAccent,
                                        textColor: Colors.white,
                                        position: VxToastPosition.bottom,
                                      ));
                            },
                            child: Container(
                              height: height * 0.04,
                              width: width * 0.20,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5.0),
                                  color: Colors.red),
                              child: Text("Delete",
                                      style: GoogleFonts.comfortaa(
                                          fontSize: 14.0,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.white))
                                  .centered(),
                            ),
                          )
                        : Container(
                            height: height * 0.04,
                            width: width * 0.20,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                            child: Text("Delete",
                                    style: GoogleFonts.comfortaa(
                                        fontSize: 14.0,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.white))
                                .centered(),
                          )
                  ],
                ),
                SizedBox(
                  height: height * 0.01,
                ),
                RichText(
                  text: TextSpan(
                    style: TextStyle(fontSize: 16.0),
                    children: <TextSpan>[
                      TextSpan(
                          text: 'User UI : ',
                          style: GoogleFonts.comfortaa(
                              fontWeight: FontWeight.w700,
                              color: model.virtualAppoint
                                  ? Colors.black
                                  : Colors.white)),
                      TextSpan(
                          text: model.userUid,
                          style: GoogleFonts.comfortaa(
                              fontWeight: FontWeight.w600,
                              color: model.virtualAppoint
                                  ? Colors.blue[800]
                                  : Colors.orange[200])),
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
                              color: model.virtualAppoint
                                  ? Colors.black
                                  : Colors.white)),
                      TextSpan(
                          text: model.docnumber,
                          style: GoogleFonts.comfortaa(
                              fontWeight: FontWeight.w600,
                              color: model.virtualAppoint
                                  ? Colors.blue[800]
                                  : Colors.orange[200])),
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
                              color: model.virtualAppoint
                                  ? Colors.black
                                  : Colors.white)),
                      TextSpan(
                          text: model.useremail,
                          style: GoogleFonts.comfortaa(
                              fontWeight: FontWeight.w600,
                              color: model.virtualAppoint
                                  ? Colors.blue[800]
                                  : Colors.orange[200])),
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
                              color: model.virtualAppoint
                                  ? Colors.black
                                  : Colors.white)),
                      TextSpan(
                          text: model.refaranceID,
                          style: GoogleFonts.comfortaa(
                              fontWeight: FontWeight.w600,
                              color: model.virtualAppoint
                                  ? Colors.blue[800]
                                  : Colors.orange[200])),
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
                              color: model.virtualAppoint
                                  ? Colors.black
                                  : Colors.white)),
                      TextSpan(
                          text: model.username,
                          style: GoogleFonts.comfortaa(
                              fontWeight: FontWeight.w600,
                              color: model.virtualAppoint
                                  ? Colors.blue[800]
                                  : Colors.orange[200])),
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
                              color: model.virtualAppoint
                                  ? Colors.black
                                  : Colors.white)),
                      TextSpan(
                          text: model.organization,
                          style: GoogleFonts.comfortaa(
                              fontWeight: FontWeight.w600,
                              color: model.virtualAppoint
                                  ? Colors.blue[800]
                                  : Colors.orange[200])),
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
                              color: model.virtualAppoint
                                  ? Colors.black
                                  : Colors.white)),
                      TextSpan(
                          text: model.nameofpatient,
                          style: GoogleFonts.comfortaa(
                              fontWeight: FontWeight.w600,
                              color: model.virtualAppoint
                                  ? Colors.blue[800]
                                  : Colors.orange[200])),
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
                              color: model.virtualAppoint
                                  ? Colors.black
                                  : Colors.white)),
                      TextSpan(
                          text: model.genderChoice,
                          style: GoogleFonts.comfortaa(
                              fontWeight: FontWeight.w600,
                              color: model.virtualAppoint
                                  ? Colors.blue[800]
                                  : Colors.orange[200])),
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
                          text: 'Age : ',
                          style: GoogleFonts.comfortaa(
                              fontWeight: FontWeight.w700,
                              color: model.virtualAppoint
                                  ? Colors.black
                                  : Colors.white)),
                      TextSpan(
                          text: model.age,
                          style: GoogleFonts.comfortaa(
                              fontWeight: FontWeight.w600,
                              color: model.virtualAppoint
                                  ? Colors.blue[800]
                                  : Colors.orange[200])),
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
                          text: 'Phone No: ',
                          style: GoogleFonts.comfortaa(
                              fontWeight: FontWeight.w700,
                              color: model.virtualAppoint
                                  ? Colors.black
                                  : Colors.white)),
                      TextSpan(
                          text: model.phoneNumber,
                          style: GoogleFonts.comfortaa(
                              fontWeight: FontWeight.w600,
                              color: model.virtualAppoint
                                  ? Colors.blue[800]
                                  : Colors.orange[200])),
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
                          text: 'Doctor Name: ',
                          style: GoogleFonts.comfortaa(
                              fontWeight: FontWeight.w700,
                              color: model.virtualAppoint
                                  ? Colors.black
                                  : Colors.white)),
                      TextSpan(
                          text: model.doctorName,
                          style: GoogleFonts.comfortaa(
                              fontWeight: FontWeight.w600,
                              color: model.virtualAppoint
                                  ? Colors.blue[800]
                                  : Colors.orange[200])),
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
                          text: 'Appointment Date : ',
                          style: GoogleFonts.comfortaa(
                              fontWeight: FontWeight.w700,
                              color: model.virtualAppoint
                                  ? Colors.black
                                  : Colors.white)),
                      TextSpan(
                          text: model.dayselected,
                          style: GoogleFonts.comfortaa(
                              fontWeight: FontWeight.w600,
                              color: model.virtualAppoint
                                  ? Colors.blue[800]
                                  : Colors.orange[200])),
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
                          text: 'Time : ',
                          style: GoogleFonts.comfortaa(
                              fontWeight: FontWeight.w700,
                              color: model.virtualAppoint
                                  ? Colors.black
                                  : Colors.white)),
                      TextSpan(
                          text: model.daySchedule,
                          // text: model.docNo,
                          style: GoogleFonts.comfortaa(
                              fontWeight: FontWeight.w600,
                              color: model.virtualAppoint
                                  ? Colors.blue[800]
                                  : Colors.orange[200])),
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
                          text: 'Doctor Fee : ',
                          style: GoogleFonts.comfortaa(
                              fontWeight: FontWeight.w700,
                              color: model.virtualAppoint
                                  ? Colors.black
                                  : Colors.white)),
                      TextSpan(
                          text: model.doctorFee,
                          // text: model.docNo,
                          style: GoogleFonts.comfortaa(
                              fontWeight: FontWeight.w600,
                              color: model.virtualAppoint
                                  ? Colors.blue[800]
                                  : Colors.orange[200])),
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
                          text: 'Pay for Virtual Appointment : ',
                          style: GoogleFonts.comfortaa(
                              fontWeight: FontWeight.w700,
                              color: model.virtualAppoint
                                  ? Colors.black
                                  : Colors.white)),
                      TextSpan(
                          text: model.payvirtualAppoint.toString(),
                          style: GoogleFonts.comfortaa(
                              fontWeight: FontWeight.w600,
                              color: model.virtualAppoint
                                  ? Colors.blue[800]
                                  : Colors.greenAccent)),
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
                          text: 'Virtual Appointment Approval: ',
                          style: GoogleFonts.comfortaa(
                              fontWeight: FontWeight.w700,
                              color: model.virtualAppoint
                                  ? Colors.black
                                  : Colors.white)),
                      TextSpan(
                          text: model.virtualAppoint.toString(),
                          style: GoogleFonts.comfortaa(
                              fontWeight: FontWeight.w600,
                              color: model.virtualAppoint
                                  ? Colors.blue[800]
                                  : Colors.orange[200])),
                    ],
                  ),
                ),
                SizedBox(
                  height: height * 0.01,
                ),
                model.adminApproval
                    ? Text(
                        "Appointment Completed",
                        style: GoogleFonts.comfortaa(
                            color: model.virtualAppoint
                                ? Colors.deepPurple
                                : Color(0xffeeff00),
                            fontSize: 15.0,
                            fontWeight: FontWeight.w600),
                      ).centered()
                    : Row(
                        mainAxisAlignment: model.virtualAppoint
                            ? MainAxisAlignment.spaceBetween
                            : MainAxisAlignment.center,
                        children: [
                          GestureDetector(
                              onTap: () {
                                setState(() {
                                  model.virtualAppoint = !model.virtualAppoint;
                                  CovidCheckApp.firestore
                                      .collection(CovidCheckApp.collectionUser)
                                      .doc(model.userUid)
                                      .collection(
                                          CovidCheckApp.appointmentcollection)
                                      .doc(model.refaranceID +
                                          model.nameofpatient)
                                      .update({
                                    "virtualAppoint": model.virtualAppoint
                                  });
                                  CovidCheckApp.firestore
                                      .collection("apppointment")
                                      .doc(model.userUid + model.refaranceID)
                                      .update({
                                    "virtualAppoint": model.virtualAppoint
                                  });
                                  CovidCheckApp.firestore
                                      .collection("virtualAppointment")
                                      .doc(model.userUid + model.refaranceID)
                                      .update({
                                    "virtualAppoint": model.virtualAppoint
                                  });
                                  print(model.virtualAppoint);
                                });
                              },
                              child: Container(
                                  height: height * 0.06,
                                  width: width * 0.50,
                                  child: Material(
                                      borderRadius: BorderRadius.circular(5.0),
                                      color: model.virtualAppoint
                                          ? Colors.lightGreen
                                          : Colors.red,
                                      elevation: 0.0,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text("Approved Call",
                                              style: GoogleFonts.comfortaa(
                                                  fontSize: 16.0,
                                                  fontWeight: FontWeight.w600)),
                                          SizedBox(
                                            width: width * 0.02,
                                          ),
                                          Icon(
                                            model.virtualAppoint
                                                ? FontAwesomeIcons.userCheck
                                                : FontAwesomeIcons.user,
                                            size: 18.0,
                                          ),
                                        ],
                                      )))),
                          if (model.virtualAppoint)
                            GestureDetector(
                                onTap: () {
                                  Get.to(IndexPage(
                                    doctorName: model.doctorName,
                                  ));
                                },
                                child: Container(
                                    height: height * 0.04,
                                    width: width * 0.25,
                                    child: Material(
                                      borderRadius: BorderRadius.circular(5.0),
                                      color: Colors.blue,
                                      elevation: 0.0,
                                      child: Center(
                                        child: Text("Join",
                                            style: GoogleFonts.comfortaa(
                                                fontSize: 15.0,
                                                fontWeight: FontWeight.w600)),
                                      ),
                                    )))
                        ],
                      )
              ]),
            ).centered()));
  }
}
