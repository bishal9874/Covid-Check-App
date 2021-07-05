import 'package:covidcheck/Screen/Auth/login.dart';
import 'package:covidcheck/helperScreen/BloodBooking.dart';
import 'package:covidcheck/helperScreen/appointment.dart';
import 'package:covidcheck/helperScreen/vaccineBook.dart';
import 'package:covidcheck/services/ser.dart';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:velocity_x/velocity_x.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[800],
      appBar: _buildAppBar(context),
      body: _build(context),
    );
  }

  _buildAppBar(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.blueGrey[900],
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
            "Profile",
            style: GoogleFonts.comfortaa(),
          ),
          IconButton(onPressed: () {}, icon: Icon(Icons.more_vert_rounded)),
        ],
      ),
    );
  }

  _build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return VStack([
      Container(
        height: height * 0.15,
        width: width * 0.25,
        child: CircleAvatar(
          radius: 25.0,
          backgroundImage: (CovidCheckApp.userAvatarUrl != null)
              ? NetworkImage(CovidCheckApp.sharedPreferences
                  .getString(CovidCheckApp.userAvatarUrl))
              : AssetImage("assets/av.jpg"),
        ),
      ).centered(),
      SizedBox(
        height: height * 0.01,
      ),
      Container(
        child: Center(
          child: Text(
            CovidCheckApp.sharedPreferences.getString(CovidCheckApp.userName),
            style: GoogleFonts.comfortaa(fontSize: 20.0),
          ),
        ),
      ),
      SizedBox(
        height: height * 0.01,
      ),
      Container(
        child: Center(
          child: Text(
            CovidCheckApp.sharedPreferences.getString(CovidCheckApp.userEmail),
            style: GoogleFonts.comfortaa(fontSize: 15.0),
          ),
        ),
      ),
      SizedBox(
        height: height * 0.01,
      ),
      Container(
        child: Center(
          child: Text(
            CovidCheckApp.sharedPreferences
                .getString(CovidCheckApp.phoneNumber),
            style: GoogleFonts.comfortaa(fontSize: 15.0),
          ),
        ),
      ),
      SizedBox(
        height: height * 0.01,
      ),
      Container(
          child: VStack([
        GestureDetector(
          onTap: () {},
          child: Text(
            "Update Profile",
            style: GoogleFonts.comfortaa(
              color: Colors.yellowAccent,
              fontWeight: FontWeight.w600,
            ),
          ),
        ).centered(),
      ])).centered(),
      SizedBox(
        height: height * 0.01,
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          GestureDetector(
            onTap: () {
              Get.to(VaccineBook());
            },
            child: Container(
                height: height * 0.06,
                width: width * 0.40,
                child: Material(
                    borderRadius: BorderRadius.circular(5.0),
                    color: Color(0xFF9608a1),
                    elevation: 0.0,
                    child: Center(
                        child: Text('Vaccine Booking',
                            style: GoogleFonts.comfortaa(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                                fontSize: 15.0))))),
          ),
          GestureDetector(
              onTap: () {
                Get.to(AppointmentBooking());
              },
              child: Container(
                  height: height * 0.06,
                  width: width * 0.40,
                  child: Material(
                      borderRadius: BorderRadius.circular(5.0),
                      color: Color(0xFF0838c7),
                      elevation: 0.0,
                      child: Center(
                          child: Text('Appointment Booking',
                              style: GoogleFonts.comfortaa(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 13.0)))))),
        ],
      ),
      SizedBox(
        height: height * 0.02,
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          GestureDetector(
            onTap: () {
              Get.to(BloodBooking());
            },
            child: Container(
                height: height * 0.06,
                width: width * 0.40,
                child: Material(
                    borderRadius: BorderRadius.circular(5.0),
                    color: Color(0xFFf51414),
                    elevation: 0.0,
                    child: Center(
                        child: Text('Blood Booking',
                            style: GoogleFonts.comfortaa(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                                fontSize: 15.0))))),
          ),
          GestureDetector(
              onTap: () {},
              child: Container(
                  height: height * 0.06,
                  width: width * 0.40,
                  child: Material(
                      borderRadius: BorderRadius.circular(5.0),
                      color: Color(0xFF0db542),
                      elevation: 0.0,
                      child: Center(
                          child: Text('Oxyzen Booking',
                              style: GoogleFonts.comfortaa(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14.0)))))),
        ],
      ),
      SizedBox(
        height: height * 0.02,
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          GestureDetector(
            onTap: () {},
            child: Container(
                height: height * 0.06,
                width: width * 0.40,
                child: Material(
                    borderRadius: BorderRadius.circular(5.0),
                    color: Color(0xFFd49f0d),
                    elevation: 0.0,
                    child: Center(
                        child: Text('Bed Booking',
                            style: GoogleFonts.comfortaa(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                                fontSize: 15.0))))),
          ),
          GestureDetector(
              onTap: () {},
              child: Container(
                  height: height * 0.06,
                  width: width * 0.40,
                  child: Material(
                      borderRadius: BorderRadius.circular(5.0),
                      color: Color(0xFFd90b2d),
                      elevation: 0.0,
                      child: Center(
                          child: Text('Ambulance Booking',
                              style: GoogleFonts.comfortaa(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14.0)))))),
        ],
      ),
      SizedBox(
        height: height * 0.01,
      ),
      InkWell(
        onTap: () {
          /// Get.to(VaccineBook());
        },
        child:
            _contents("assets/qst.png", "FAQ'S", "Frequently asked questions"),
      ),
      InkWell(
        onTap: () {
          _showMyDialog(context);
        },
        child: _contents("assets/support.jpg", "Support", "Contact details"),
      ),
      InkWell(
        onTap: () {},
        child: _contents("assets/Terms-and-conditions.png",
            "Term and Condition", "while using our app"),
      ),
      SizedBox(
        height: height * 0.01,
      ),
      GestureDetector(
        onTap: () {
          CovidCheckApp.auth.signOut().then((value) {
            Route route = MaterialPageRoute(builder: (c) => LoginScreen());
            Navigator.pushReplacement(context, route);
          });
        },
        child: Container(
                height: height * 0.06,
                width: width * 0.40,
                child: Material(
                    borderRadius: BorderRadius.circular(5.0),
                    color: Color(0xFF2877ed),
                    elevation: 0.0,
                    child: Center(
                        child: Text('Log out',
                            style: GoogleFonts.comfortaa(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                                fontSize: 18.0)))))
            .centered(),
      ),
    ]).scrollVertical();
  }

  Future<void> _showMyDialog(BuildContext context) async {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return showDialog<void>(
      context: context,
      barrierDismissible: true, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
            title: Text(
              'Contact Details',
              style: GoogleFonts.raleway(
                  fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            content: Container(
              height: height * 0.12,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Mobile Number",
                            style: GoogleFonts.comfortaa(
                                fontSize: 15.0, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "75554228474",
                            style: GoogleFonts.comfortaa(
                              fontSize: 13.0,
                            ),
                          )
                        ],
                      ),
                      Icon(FontAwesomeIcons.phone)
                    ],
                  ),
                  SizedBox(
                    height: height * 0.02,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Email",
                            style: GoogleFonts.comfortaa(
                                fontSize: 15.0, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "example@gmail.com",
                            style: GoogleFonts.comfortaa(
                              fontSize: 13.0,
                            ),
                          )
                        ],
                      ),
                      Icon(FontAwesomeIcons.envelope)
                    ],
                  ),
                ],
              ),
            ));
      },
    );
  }

  _contents(String imgurl, String faqSupportTerm, String description) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Container(
      height: height * 0.08,
      width: width * 1.0,
      margin: EdgeInsets.all(5.0),
      decoration: BoxDecoration(
        color: Colors.blueGrey[700],
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(5.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  //  color: Colors.amber,
                  height: 40.0,
                  width: 40.0,
                  margin: EdgeInsets.only(left: 10.0),
                  decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(10.0)),
                  child: Container(
                    padding: EdgeInsets.all(3.0),
                    child: Center(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(40.0),
                        child: Image(
                          image: AssetImage(imgurl),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ).centered(),
                SizedBox(
                  width: 10.0,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      faqSupportTerm,
                      style: GoogleFonts.comfortaa(
                          fontSize: 15.0, fontWeight: FontWeight.w600),
                    ),
                    Row(
                      children: <Widget>[
                        Text(
                          description,
                          style: GoogleFonts.comfortaa(
                              fontSize: 13.0,
                              fontWeight: FontWeight.w400,
                              textStyle: TextStyle(
                                color: Colors.white,
                              )),
                        ),
                      ],
                    )
                  ],
                )
              ],
            ),
          ),
          Container(
              padding: EdgeInsets.all(10.0),
              child: Icon(Icons.arrow_forward_ios))
        ],
      ),
    );
  }

  // updateProfile() {
  //   var height = MediaQuery.of(context).size.height;
  //   var width = MediaQuery.of(context).size.width;
  //   return showDialog(
  //       context: context,
  //       builder: (c) {
  //         return AlertDialog(
  //           backgroundColor: Colors.blueGrey[700],
  //           contentPadding: EdgeInsets.all(8.0),
  //           content: Container(
  //               height: height * 0.25,
  //               child: Column(
  //                 mainAxisAlignment: MainAxisAlignment.center,
  //                 crossAxisAlignment: CrossAxisAlignment.center,
  //                 children: [
  //                   TextFormField(
  //             controller: ,
  //             decoration: InputDecoration(
  //               filled: true,
  //               fillColor: Colors.blue[80],
  //               hintText: "Name",
  //               hintStyle: GoogleFonts.comfortaa(
  //                 fontSize: 13.0,
  //               ),
  //               errorBorder: OutlineInputBorder(
  //                   borderRadius: BorderRadius.all(Radius.circular(10)),
  //                   borderSide: BorderSide(width: 1, color: Colors.red)),
  //               focusedErrorBorder: OutlineInputBorder(
  //                 borderRadius: BorderRadius.all(Radius.circular(10)),
  //               ),
  //               border: OutlineInputBorder(
  //                 borderSide: BorderSide(color: Colors.white),
  //                 borderRadius: const BorderRadius.all(
  //                   const Radius.circular(10.0),
  //                 ),
  //               ),
  //             ),
  //             onChanged: (value) {
  //               this.name = value;
  //             },
  //             validator: (value) => value.isEmpty ? 'Name is required' : null),],
  //               )),
  //         );
  //       });
  // }
}
