import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:covidcheck/Screen/Auth/login.dart';
import 'package:covidcheck/Screen/home.dart';
import 'package:covidcheck/blocs/application_bloc.dart';
import 'package:covidcheck/counter/Addresschanger.dart';
import 'package:covidcheck/counter/BookQuantity.dart';
import 'package:covidcheck/counter/booking_counter.dart';
import 'package:covidcheck/counter/totalamount.dart';
import 'package:covidcheck/services/ser.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  CovidCheckApp.sharedPreferences = await SharedPreferences.getInstance();
  CovidCheckApp.firestore = FirebaseFirestore.instance;
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (c) => BookItemCounter()),
        ChangeNotifierProvider(create: (c) => BookQuantity()),
        ChangeNotifierProvider(create: (c) => AddressChanger()),
        ChangeNotifierProvider(create: (c) => TotalAmount()),
        ChangeNotifierProvider(create: (c) => ApplicationBlocs())
      ],
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'CovidCheck',
        theme: ThemeData.dark(),
        home: SplashScreen(),
      ),
    );
  }
}

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    diplaySplash();
  }

  diplaySplash() {
    Timer(Duration(seconds: 5), () async {
      if (await CovidCheckApp.auth.currentUser != null) {
        Route route = MaterialPageRoute(builder: (_) => HomePage());
        Navigator.pushReplacement(context, route);
      } else {
        Route route = MaterialPageRoute(builder: (_) => LoginScreen());
        Navigator.pushReplacement(context, route);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Material(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        RichText(
          text: TextSpan(
            style: TextStyle(fontSize: 40.0),
            children: <TextSpan>[
              TextSpan(
                  text: 'Covid',
                  style: GoogleFonts.raleway(
                      fontWeight: FontWeight.w700, color: Colors.white)),
              TextSpan(
                  text: 'Check!',
                  style: GoogleFonts.raleway(
                      fontWeight: FontWeight.w700, color: Colors.blue)),
            ],
          ),
        ),
        SizedBox(
          height: 15.0,
        ),
        CircularProgressIndicator()
      ],
    ));
  }
}
