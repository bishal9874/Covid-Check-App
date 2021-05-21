import 'package:covidcheck/Screen/Auth/reset.dart';
import 'package:covidcheck/Screen/Auth/signUp.dart';
import 'package:covidcheck/services/authservices.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final formKey = new GlobalKey<FormState>();
  String email, password, name;

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
    return Padding(
        padding: const EdgeInsets.only(left: 25.0, right: 25.0),
        child: ListView(children: [
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
                        style: GoogleFonts.raleway(
                            fontWeight: FontWeight.w700, color: Colors.white)),
                    TextSpan(
                        text: 'Check!',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.blueAccent[200])),
                  ],
                ),
              ))),
          SizedBox(height: 25.0),
          TextFormField(
              decoration: InputDecoration(
                  labelText: 'EMAIL',
                  labelStyle: TextStyle(
                      fontFamily: 'Trueno',
                      fontSize: 12.0,
                      color: Colors.white),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: greenColor),
                  )),
              onChanged: (value) {
                this.email = value;
              },
              validator: (value) =>
                  value.isEmpty ? 'Email is required' : validateEmail(value)),
          TextFormField(
              decoration: InputDecoration(
                  labelText: 'PASSWORD',
                  labelStyle: TextStyle(
                      fontFamily: 'Trueno',
                      fontSize: 12.0,
                      color: Colors.white),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: greenColor),
                  )),
              obscureText: true,
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
                          style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'Trueno',
                              fontSize: 11.0,
                              decoration: TextDecoration.underline))))),
          SizedBox(height: 50.0),
          GestureDetector(
            onTap: () {
              // if (checkFields())
              //   AuthService().signIn(email, password, name, context);
            },
            child: Container(
                height: height * 0.06,
                // width: width * 0.10,
                child: Material(
                    borderRadius: BorderRadius.circular(25.0),
                    color: greenColor,
                    elevation: 0.0,
                    child: Center(
                        child: Text('Login',
                            style: GoogleFonts.raleway(
                                color: Colors.white, fontSize: 18.0))))),
          ),
          SizedBox(height: 20.0),
          InkWell(
              onTap: () {
                // AuthService().fbSignIn();
              },
              child: Container(
                height: height * 0.06,
                width: width * 0.58,
                decoration: BoxDecoration(
                    color: Color(0xFF3B5998),
                    borderRadius: BorderRadius.circular(30.0)),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(FontAwesomeIcons.facebook),
                    SizedBox(
                      width: width * 0.03,
                    ),
                    Text("Login with Facebook",
                        style: GoogleFonts.notoSans(
                            color: Color(0xFFFFFFFF), fontSize: 15.0))
                  ],
                ),
              )),
          SizedBox(height: 25.0),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Text("Don’t have an Account ? "),
            SizedBox(width: 5.0),
            InkWell(
                onTap: () {
                  Get.to(SignupPage());
                },
                child: Text('Register',
                    style: TextStyle(
                        color: greenColor,
                        fontFamily: 'Trueno',
                        decoration: TextDecoration.underline)))
          ])
        ]));
  }
}
