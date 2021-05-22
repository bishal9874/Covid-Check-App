import 'package:covidcheck/Screen/Auth/login.dart';
import 'package:covidcheck/services/ser.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class MainDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          child: Padding(
            padding: EdgeInsets.only(top: 50.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 50.0,
                  backgroundImage: NetworkImage(CovidCheckApp.sharedPreferences
                      .getString(CovidCheckApp.userAvatarUrl)),
                ),
                SizedBox(
                  height: 5.0,
                ),
                Text(
                  CovidCheckApp.sharedPreferences
                      .getString(CovidCheckApp.userName),
                  style: GoogleFonts.raleway(fontSize: 25.0),
                ),
                SizedBox(
                  height: 5.0,
                ),
                Text(
                  CovidCheckApp.sharedPreferences
                      .getString(CovidCheckApp.userEmail),
                  style: GoogleFonts.raleway(fontSize: 18.0),
                ),
              ],
            ),
          ),
        ),
        SizedBox(
          height: 20.0,
        ),
        ListTile(
          onTap: () {},
          leading: Icon(FontAwesomeIcons.user),
          title: Text(
            "Your Profile",
            style: GoogleFonts.raleway(fontSize: 18.0),
          ),
        ),
        ListTile(
          onTap: () {},
          leading: Icon(FontAwesomeIcons.bookMedical),
          title: Text(
            "Your Booking",
            style: GoogleFonts.raleway(fontSize: 18.0),
          ),
        ),
        ListTile(
          onTap: () {},
          leading: Icon(FontAwesomeIcons.ambulance),
          title: Text(
            "Ambilance",
            style: GoogleFonts.raleway(fontSize: 18.0),
          ),
        ),
        ListTile(
          onTap: () {
            CovidCheckApp.auth.signOut().then((value) {
              Route route = MaterialPageRoute(builder: (c) => LoginScreen());
              Navigator.pushReplacement(context, route);
            });
          },
          leading: Icon(Icons.logout),
          title: Text(
            "Log Out",
            style: GoogleFonts.raleway(fontSize: 18.0),
          ),
        ),
      ],
    );
  }
}
