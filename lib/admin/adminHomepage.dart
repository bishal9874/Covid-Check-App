import 'package:covidcheck/admin/ADvirtualAppoint.dart';
import 'package:covidcheck/admin/Adminappointment.dart';
import 'package:covidcheck/admin/admin%20organization/organixationView.dart';
import 'package:covidcheck/admin/adminBlood.dart';
import 'package:covidcheck/admin/adminoxygen.dart';
import 'package:covidcheck/admin/organization.dart';
import 'package:covidcheck/admin/vaccinationDetailsinAdmin.dart';
import 'package:covidcheck/main.dart';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:velocity_x/velocity_x.dart';

class AdminHome extends StatelessWidget {
  final String name;

  const AdminHome({Key key, this.name}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: _buildAppBar(context),
      // body: Center(
      //   child: Text(),
      // ),
      body: Container(
        height: double.infinity,
        child: VStack([
          Center(
            child: RichText(
              text: TextSpan(
                style: TextStyle(fontSize: 20.0),
                children: <TextSpan>[
                  TextSpan(
                      text: 'Hey ',
                      style: GoogleFonts.raleway(
                          fontWeight: FontWeight.w700, color: Colors.white)),
                  TextSpan(
                      text: name,
                      style: GoogleFonts.raleway(
                          fontWeight: FontWeight.w700,
                          color: Colors.blueAccent[200])),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
          InkWell(
            onTap: () {
              Get.to(Organization());
            },
            child: Container(
              height: height * 0.20,
              width: width * .90,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(28),
                  color: Color(0xFF2877ed)),
              child: "Add Organization and Details"
                  .text
                  .textStyle(GoogleFonts.raleway(
                      fontSize: 20.0, fontWeight: FontWeight.w600))
                  .makeCentered(),
            ).centered(),
          ),
          SizedBox(
            height: height * 0.01,
          ),
          InkWell(
            onTap: () {
              Get.to(AdminOrg());
            },
            child: Container(
              height: height * 0.10,
              width: width * .90,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.blueGrey[800]),
              child: "Organization View"
                  .text
                  .textStyle(GoogleFonts.comfortaa(
                      fontSize: 16.0, fontWeight: FontWeight.w600))
                  .makeCentered(),
            ).centered(),
          ),
          SizedBox(
            height: height * 0.01,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: () {
                  Get.to(Vaccineadmin());
                },
                child: Container(
                  height: height * 0.25,
                  width: width * .45,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(28),
                      color: Color(0xFF7a3acf)),
                  child: "vaccine Details"
                      .text
                      .textStyle(GoogleFonts.comfortaa(
                          fontSize: 15.0, fontWeight: FontWeight.w600))
                      .makeCentered(),
                ).centered(),
              ),
              InkWell(
                onTap: () {
                  Get.to(Appointmentadmin());
                },
                child: Container(
                  height: height * 0.25,
                  width: width * .45,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(28),
                      color: Color(0xFF0e20c7)),
                  child: "Appointment Details"
                      .text
                      .textStyle(GoogleFonts.comfortaa(
                          fontSize: 12.0, fontWeight: FontWeight.w600))
                      .makeCentered()
                      .centered(),
                ).centered(),
              ),
            ],
          ),
          SizedBox(
            height: height * 0.01,
          ),
          InkWell(
            onTap: () {
              Get.to(VirtualAppointmentadmin());
            },
            child: Container(
              height: height * 0.15,
              width: width * .90,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(28),
                  color: Color(0xFF18b581)),
              child: "Virtual Appointment"
                  .text
                  .textStyle(GoogleFonts.comfortaa(
                      fontSize: 20.0, fontWeight: FontWeight.w600))
                  .makeCentered(),
            ).centered(),
          ),
          SizedBox(
            height: height * 0.01,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: () {
                  Get.to(AdminBloodBooking());
                },
                child: Container(
                  height: height * 0.10,
                  width: width * .46,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Color(0xFFf22929)),
                  child: "Blood Booking Details"
                      .text
                      .textStyle(GoogleFonts.comfortaa(
                          fontSize: 13.0, fontWeight: FontWeight.w600))
                      .makeCentered(),
                ).centered(),
              ),
              InkWell(
                onTap: () {
                  Get.to(AdminoxygenBooking());
                },
                child: Container(
                  height: height * 0.10,
                  width: width * .46,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Color(0xFF0f964c)),
                  child: "Oxygen Servies Details"
                      .text
                      .textStyle(GoogleFonts.comfortaa(
                          fontSize: 13.0, fontWeight: FontWeight.w600))
                      .makeCentered()
                      .centered(),
                ).centered(),
              ),
            ],
          ),
        ]).scrollVertical(),
      ).p(10),
    );
  }

  _buildAppBar(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.blueGrey[700],
      automaticallyImplyLeading: false,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text("Covidcheck! Admin Panel",
              style: GoogleFonts.comfortaa(fontSize: 18.0)),
          IconButton(
              onPressed: () {
                Get.to(SplashScreen());
              },
              icon: Icon(Icons.logout_sharp)),
        ],
      ),
    );
  }
}
