import 'package:covidcheck/admin/organization.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:velocity_x/velocity_x.dart';

class AdminHome extends StatelessWidget {
  final String name;

  const AdminHome({Key key, this.name}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: () {}, icon: Icon(Icons.menu)),
        title: Text('Covidcheck! Admin Panel',
                style: GoogleFonts.raleway(
                    fontWeight: FontWeight.w700, color: Colors.white))
            .pOnly(left: 25.0),
        elevation: 0.0,
        backgroundColor: Colors.transparent,
      ),
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
        ]),
      ).p(10),
    );
  }
}
