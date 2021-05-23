import 'package:covidcheck/admin/adminBody.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AdminHome extends StatelessWidget {
  final String name;

  const AdminHome({Key key, this.name}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: RichText(
          text: TextSpan(
            style: TextStyle(fontSize: 20.0),
            children: <TextSpan>[
              TextSpan(
                  text: 'Admin:  ',
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
        elevation: 0.0,
        backgroundColor: Colors.transparent,
      ),
      // body: Center(
      //   child: Text(),
      // ),
      body: AdminHomeBody(),
    );
  }
}
