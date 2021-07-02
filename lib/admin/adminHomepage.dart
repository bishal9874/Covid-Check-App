import 'package:covidcheck/admin/organization.dart';
import 'package:covidcheck/admin/vaccinationDetailsinAdmin.dart';
import 'package:covidcheck/main.dart';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:velocity_x/velocity_x.dart';

class AdminHome extends StatelessWidget {
  final String name;

  const AdminHome({Key key, this.name}) : super(key: key);
  @override
  Widget build(BuildContext context) {
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
              height: 199,
              width: 344,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(28),
                  color: Color(0xFF2877ed)),
              child: "Add Organization and Details"
                  .text
                  .textStyle(GoogleFonts.raleway(fontSize: 20.0))
                  .makeCentered(),
            ).centered(),
          ),
          SizedBox(
            height: 20.0,
          ),
          InkWell(
            onTap: () {
              Get.to(Vaccineadmin());
            },
            child: Container(
              height: 199,
              width: 344,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(28),
                  color: Color(0xFF2877ed)),
              child: "vaccine Details"
                  .text
                  .textStyle(GoogleFonts.raleway(fontSize: 20.0))
                  .makeCentered(),
            ).centered(),
          ),
        ]),
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
