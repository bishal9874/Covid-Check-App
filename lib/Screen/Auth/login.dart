import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:covidcheck/DialogBox/loadignDialog.dart';
import 'package:covidcheck/Screen/Auth/reset.dart';
import 'package:covidcheck/Screen/Auth/signUp.dart';
import 'package:covidcheck/Screen/home.dart';
import 'package:covidcheck/admin/adminscreen.dart';

import 'package:covidcheck/services/error_handler.dart';
import 'package:covidcheck/services/ser.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:velocity_x/velocity_x.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool ishidePassword = true;
  FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final formKey = new GlobalKey<FormState>();
  String email, password, name;
  final TextEditingController _emailController = new TextEditingController();
  final TextEditingController _passwordController = new TextEditingController();

  Color greenColor = Color(0xFF00AF19);

  //To check fields during submit
  checkFields() {
    final form = formKey.currentState;
    if (form.validate()) {
      form.save();
      return true;
    }
    return false;
  }

  //To Validate email
  String validateEmail(String value) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern);
    if (!regex.hasMatch(value))
      return 'Enter Valid Email';
    else
      return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Form(key: formKey, child: _buildLoginForm(context))));
  }

  _buildLoginForm(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Container(
        color: Colors.blueGrey[800],
        padding: const EdgeInsets.only(left: 25.0, right: 25.0),
        child: VStack([
          SizedBox(height: 75.0),
          Container(
              height: height * 0.19,
              child: Center(
                  child: RichText(
                text: TextSpan(
                  style: TextStyle(fontSize: 40.0),
                  children: <TextSpan>[
                    TextSpan(
                        text: 'Covid',
                        style: GoogleFonts.comfortaa(
                            fontWeight: FontWeight.w700, color: Colors.white)),
                    TextSpan(
                        text: 'Check!',
                        style: GoogleFonts.comfortaa(
                            fontWeight: FontWeight.bold,
                            color: Colors.blueAccent[200])),
                  ],
                ),
              ))),
          SizedBox(height: height * 0.10),
          TextFormField(
              controller: _emailController,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.blue[80],
                hintText: "Email",
                hintStyle: GoogleFonts.comfortaa(
                  fontSize: 13.0,
                ),
                errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    borderSide: BorderSide(width: 1, color: Colors.red)),
                focusedErrorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                  borderRadius: const BorderRadius.all(
                    const Radius.circular(10.0),
                  ),
                ),
                // labelText: 'EMAIL',
                // labelStyle: TextStyle(
                //     fontFamily: 'Trueno',
                //     fontSize: 12.0,
                //     color: Colors.white),
                // focusedBorder: UnderlineInputBorder(
                //   borderSide: BorderSide(color: greenColor),
                // )
              ),
              onChanged: (value) {
                this.email = value;
              },
              validator: (value) =>
                  value.isEmpty ? 'Email is required' : validateEmail(value)),
          SizedBox(height: height * 0.01),
          TextFormField(
              controller: _passwordController,
              decoration: InputDecoration(
                suffixIcon: IconButton(
                  icon: Icon(Icons.visibility),
                  onPressed: () {
                    _togglepassword();
                  },
                ),
                filled: true,
                fillColor: Colors.blue[80],
                hintText: "Password",
                hintStyle: GoogleFonts.comfortaa(
                  fontSize: 13.0,
                ),
                errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    borderSide: BorderSide(width: 1, color: Colors.red)),
                focusedErrorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                  borderRadius: const BorderRadius.all(
                    const Radius.circular(10.0),
                  ),
                ),
              ),
              obscureText: ishidePassword,
              onChanged: (value) {
                this.password = value;
              },
              validator: (value) =>
                  value.isEmpty ? 'Password is required' : null),
          SizedBox(height: 5.0),
          GestureDetector(
              onTap: () {
                Get.to(ResetPassword());
              },
              child: Container(
                  alignment: Alignment(1.0, 0.0),
                  padding: EdgeInsets.only(top: 15.0, left: 20.0),
                  child: InkWell(
                      child: Text('Forgot Password',
                          style: GoogleFonts.comfortaa(
                              color: Colors.white,
                              fontSize: 11.0,
                              decoration: TextDecoration.underline))))),
          SizedBox(height: 50.0),
          GestureDetector(
            onTap: () {
              if (checkFields()) loginUser();
            },
            child: Container(
                height: height * 0.06,
                width: width * 0.80,
                child: Material(
                    borderRadius: BorderRadius.circular(10.0),
                    color: Color(0xFF2877ed),
                    elevation: 0.0,
                    child: Center(
                        child: Text('Login',
                            style: GoogleFonts.comfortaa(
                                color: Colors.white, fontSize: 18.0))))),
          ).centered(),
          SizedBox(height: 20.0),
          // InkWell(
          //     onTap: () {
          //       // AuthService().fbSignIn();
          //     },
          //     child: Container(
          //       height: height * 0.06,
          //       width: width * 0.58,
          //       decoration: BoxDecoration(
          //           color: Colors.grey[600],
          //           borderRadius: BorderRadius.circular(30.0)),
          //       child: Row(
          //         crossAxisAlignment: CrossAxisAlignment.center,
          //         mainAxisAlignment: MainAxisAlignment.center,
          //         children: [
          //           Icon(Icons.phone),
          //           SizedBox(
          //             width: width * 0.03,
          //           ),
          //           Text("Login with Phone Number",
          //               style: GoogleFonts.comfortaa(
          //                   color: Color(0xFFFFFFFF), fontSize: 15.0))
          //         ],
          //       ),
          //     )),
          SizedBox(height: 25.0),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Text("Don’t have an Account ? ",
                style: GoogleFonts.comfortaa(
                  fontWeight: FontWeight.w400,
                  color: Colors.white,
                )),
            SizedBox(width: 5.0),
            InkWell(
                onTap: () {
                  Get.to(SignupPage());
                },
                child: Text('Register',
                    style: GoogleFonts.comfortaa(
                        color: Colors.blue,
                        decoration: TextDecoration.underline))),
          ]),
          SizedBox(height: 25.0),
          Divider(),
          SizedBox(height: 18.0),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Text("If You are ",
                style: GoogleFonts.comfortaa(
                  fontWeight: FontWeight.w400,
                  color: Colors.white,
                )),
            SizedBox(width: 5.0),
            InkWell(
                onTap: () {
                  Get.to(Adminauth());
                },
                child: Text('Admin',
                    style: GoogleFonts.comfortaa(
                        fontWeight: FontWeight.w600,
                        color: Colors.blue,
                        decoration: TextDecoration.underline))),
          ]),
        ]).scrollVertical());
  }

  void loginUser() async {
    showDialog(
        context: context,
        builder: (c) {
          return LoadingAlertDialog(
            message: "Authenticating, Please wait......",
          );
        });
    User user;
    await _firebaseAuth
        .signInWithEmailAndPassword(
            email: _emailController.text.trim(),
            password: _passwordController.text.trim())
        .then((value) {
      user = value.user;
    }).catchError((e) {
      ErrorHandler().errorDialog(context, e);
    });
    if (user != null) {
      readData(user).then((s) {
        Navigator.pop(context);
        Route route = MaterialPageRoute(builder: (c) => HomePage());
        Navigator.pushReplacement(context, route);
      });
    }
  }

  Future readData(User fuser) async {
    FirebaseFirestore.instance
        .collection("users")
        .doc(fuser.uid)
        .get()
        .then((dataSnapshot) async {
      await CovidCheckApp.sharedPreferences
          .setString("uid", dataSnapshot.data()[CovidCheckApp.userUID]);

      await CovidCheckApp.sharedPreferences
          .setString("email", dataSnapshot.data()[CovidCheckApp.userEmail]);

      await CovidCheckApp.sharedPreferences.setString(
          CovidCheckApp.userName, dataSnapshot.data()[CovidCheckApp.userName]);

      await CovidCheckApp.sharedPreferences.setString(
          CovidCheckApp.userAvatarUrl,
          dataSnapshot.data()[CovidCheckApp.userAvatarUrl]);

      List<String> cartList =
          dataSnapshot.data()[CovidCheckApp.userCartList].cast<String>();
      await CovidCheckApp.sharedPreferences
          .setStringList(CovidCheckApp.userCartList, cartList);
    });
  }

  void _togglepassword() {
    setState(() {
      ishidePassword = !ishidePassword;
    });
  }
}
