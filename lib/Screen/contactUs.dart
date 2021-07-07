import 'package:covidcheck/blocs/application_bloc.dart';
import 'package:covidcheck/models/orgServiecs.dart';
import 'package:flutter/material.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import 'package:velocity_x/velocity_x.dart';

import 'package:url_launcher/url_launcher.dart';

// ignore: must_be_immutable
class ContactUS extends StatefulWidget {
  OrgModel contact;
  ContactUS({this.contact});
  @override
  _ContactUSState createState() => _ContactUSState();
}

class _ContactUSState extends State<ContactUS> {
  @override
  Widget build(BuildContext context) {
    final applicationBloc = Provider.of<ApplicationBlocs>(context);
    return Scaffold(
      // backgroundColor: Colors.blueGrey[600],
      appBar: _buildAppBar(context),
      body: (applicationBloc.currentLoaction == null)
          ? Center(
              child: CircularProgressIndicator(),
            )
          : VStack([
              _contactStatement(
                  context,
                  widget.contact.orgaddress,
                  widget.contact.orgCity,
                  widget.contact.orgDistrict,
                  widget.contact.email,
                  widget.contact.contact,
                  widget.contact.pinNumber,
                  widget.contact.organization),
              Container(
                padding: EdgeInsets.all(8.0),
                height: 300.0,
                child: GoogleMap(
                  mapType: MapType.normal,
                  myLocationEnabled: true,
                  initialCameraPosition: CameraPosition(
                      target: LatLng(
                        applicationBloc.currentLoaction.latitude,
                        applicationBloc.currentLoaction.longitude,
                      ),
                      zoom: 14),
                ),
              )
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

  _buildAppBar(BuildContext context) {
    return AppBar(
      elevation: 0.0,
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
          Text(
            "Contact Us",
            style: GoogleFonts.raleway(),
          ),
          IconButton(onPressed: () {}, icon: Icon(Icons.more_vert_rounded)),
        ],
      ),
    );
  }

  _contactStatement(
      BuildContext context,
      String address,
      String city,
      String district,
      String email,
      int contactNumber,
      String pinCode,
      String orgaName) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Container(
      padding: EdgeInsets.all(10.0),
      child: VStack([
        Container(
          width: width * 0.70,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Icon(
                FontAwesomeIcons.mapMarkedAlt,
                color: Colors.blue[100],
              ),
              Container(
                child: VStack([
                  Text(address,
                      style: GoogleFonts.raleway(
                          fontWeight: FontWeight.w500, fontSize: 20.0)),
                  Text(
                    city,
                    style: GoogleFonts.raleway(
                        fontWeight: FontWeight.w500, fontSize: 20.0),
                  ),
                  Text(
                    district,
                    style: GoogleFonts.raleway(
                        fontWeight: FontWeight.w500, fontSize: 20.0),
                  ),
                  Text(
                    pinCode.toString(),
                    style: GoogleFonts.notoSans(
                        fontWeight: FontWeight.w500, fontSize: 20.0),
                  )
                ]),
              ),
            ],
          ),
        ),
        SizedBox(height: height * 0.02),
        Container(
          width: width * 0.70,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              IconButton(
                onPressed: () {
                  customLaunch('tel:${contactNumber.toString()}');
                },
                icon: Icon(
                  FontAwesomeIcons.phoneAlt,
                  color: Colors.red,
                ),
              ),
              Text(
                '+91 ' + contactNumber.toString(),
                style: GoogleFonts.notoSans(
                    fontWeight: FontWeight.w500, fontSize: 20.0),
              ),
            ],
          ),
        ),
        SizedBox(height: height * 0.02),
        Container(
          width: width * 0.70,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              IconButton(
                onPressed: () {
                  customLaunch(
                      'mailto:$email?subject=test%20subject&body=test%20body');
                },
                icon: Icon(
                  FontAwesomeIcons.envelope,
                  color: Colors.blueGrey,
                ),
              ),
              Text(
                email,
                style: GoogleFonts.raleway(
                    fontWeight: FontWeight.w500, fontSize: 20.0),
              ),
            ],
          ),
        )
      ]),
    );
  }
}
