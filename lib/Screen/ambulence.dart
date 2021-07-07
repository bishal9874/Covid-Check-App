import 'package:covidcheck/models/orgServiecs.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:velocity_x/velocity_x.dart';

// ignore: must_be_immutable
class AmbulanceBooking extends StatefulWidget {
  OrgModel ambulance;
  AmbulanceBooking({Key key, this.ambulance}) : super(key: key);

  @override
  _AmbulanceBookingState createState() => _AmbulanceBookingState();
}

class _AmbulanceBookingState extends State<AmbulanceBooking> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[800],
      appBar: _buildAppBar(context),
      body: _buildContactInfo(context),
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
          IconButton(
              onPressed: () {
                Get.back();
              },
              icon: Icon(FontAwesomeIcons.chevronLeft)),
          Text("Ambulance Serices",
              style: GoogleFonts.comfortaa(fontSize: 18.0)),
          IconButton(onPressed: () {}, icon: Icon(Icons.more_vert_rounded)),
        ],
      ),
    );
  }

  _buildContactInfo(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Container(
      padding: EdgeInsets.all(5.0),
      child: VStack([
        Container(
          height: height * 0.20,
          width: width * 0.97,
          decoration: BoxDecoration(
              color: Colors.blueGrey, borderRadius: BorderRadius.circular(5.0)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              RichText(
                text: TextSpan(
                  style: TextStyle(fontSize: 30.0),
                  children: <TextSpan>[
                    TextSpan(
                        text: '+91 ',
                        style: GoogleFonts.comfortaa(
                            fontWeight: FontWeight.w600, color: Colors.white)),
                    TextSpan(
                        text: widget.ambulance.ambulanceNumber.toString(),
                        style: GoogleFonts.comfortaa(
                            fontWeight: FontWeight.w600, color: Colors.orange)),
                  ],
                ),
              ),
              IconButton(
                onPressed: () {
                  customLaunch('tel:${widget.ambulance.toString()}');
                },
                icon: Icon(
                  FontAwesomeIcons.phoneAlt,
                  color: Colors.red,
                ),
              ),
            ],
          ),
        ),
      ]),
    );
  }

  void customLaunch(comand) async {
    if (await canLaunch(comand)) {
      await launch(comand);
    } else {
      VxToast.show(context, msg: "could not Launch $comand");
    }
  }
}
