import 'package:covidcheck/Screen/Auth/login.dart';
import 'package:covidcheck/services/authservices.dart';
import 'package:covidcheck/services/ser.dart';
import 'package:covidcheck/widgets/provider_widgets.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:velocity_x/velocity_x.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          child: VStack([
        Container(
          height: 160.0,
          width: 160.0,
          child: CircleAvatar(
            backgroundImage: NetworkImage(CovidCheckApp.sharedPreferences
                .getString(CovidCheckApp.userAvatarUrl)),
          ),
        ),
        Text(
          CovidCheckApp.sharedPreferences.getString(CovidCheckApp.userName),
          style: GoogleFonts.raleway(fontSize: 25.0),
        ),
        ElevatedButton(
          onPressed: () {
            CovidCheckApp.auth.signOut().then((value) {
              Route route = MaterialPageRoute(builder: (c) => LoginScreen());
              Navigator.pushReplacement(context, route);
            });
          },
          child: Text("log Out"),
        ),
      ])).centered(),
    );
  }
}
