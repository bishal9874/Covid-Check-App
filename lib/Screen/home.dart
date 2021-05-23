import 'package:covidcheck/Screen/Auth/login.dart';
import 'package:covidcheck/counter/booking_counter.dart';
import 'package:covidcheck/services/authservices.dart';
import 'package:covidcheck/services/ser.dart';
import 'package:covidcheck/widgets/drawer.dart';
import 'package:covidcheck/widgets/provider_widgets.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:velocity_x/velocity_x.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: RichText(
          text: TextSpan(
            style: TextStyle(fontSize: 30.0),
            children: <TextSpan>[
              TextSpan(
                  text: 'Covid',
                  style: GoogleFonts.raleway(
                      fontWeight: FontWeight.w700, color: Colors.white)),
              TextSpan(
                  text: 'Check!',
                  style: GoogleFonts.raleway(
                      fontWeight: FontWeight.w700, color: Colors.orange)),
            ],
          ),
        ).pOnly(left: 35.0),
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        leading: Builder(
            builder: (context) => IconButton(
                  onPressed: () {
                    Scaffold.of(context).openDrawer();
                  },
                  icon: Icon(FontAwesomeIcons.bars, color: Colors.white),
                )),
        actions: [
          Stack(
            children: [
              Positioned(
                top: 1.0,
                right: 4.0,
                child: Container(
                  height: 15.0,
                  width: 15.0,
                  decoration: BoxDecoration(
                      color: Colors.white, shape: BoxShape.circle),
                  // child:
                  //     Consumer<BookItemCounter>(builder: (context, counter, _) {
                  //   return Text(counter.count.toString(),
                  //       style: GoogleFonts.raleway(
                  //           fontSize: 12.0, color: Colors.black));
                  // }),
                ),
              ),
              IconButton(
                icon: Icon(Icons.shopping_cart_outlined, color: Colors.white),
                onPressed: () {
                  //Get.to(CartPage());
                },
              ),
            ],
          ),
        ],
      ),
      drawer: Drawer(
        child: MainDrawer(),
      ),
      // body: Container(
      //     child: VStack([
      //   Container(
      //     height: 160.0,
      //     width: 160.0,
      //     child: CircleAvatar(
      //       backgroundImage: NetworkImage(CovidCheckApp.sharedPreferences
      //           .getString(CovidCheckApp.userAvatarUrl)),
      //     ),
      //   ),
      //   Text(
      //     CovidCheckApp.sharedPreferences.getString(CovidCheckApp.userName),
      //     style: GoogleFonts.raleway(fontSize: 25.0),
      //   ),
      //   ElevatedButton(
      //     onPressed: () {
      //       CovidCheckApp.auth.signOut().then((value) {
      //         Route route = MaterialPageRoute(builder: (c) => LoginScreen());
      //         Navigator.pushReplacement(context, route);
      //       });
      //     },
      //     child: Text("log Out"),
      //   ),
      // ])).centered(),
    );
  }
}
