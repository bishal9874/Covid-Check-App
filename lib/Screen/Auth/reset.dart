import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:toast/toast.dart';
import 'package:velocity_x/velocity_x.dart';

class ResetPassword extends StatefulWidget {
  @override
  _ResetPasswordState createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  final formKey = new GlobalKey<FormState>();
  final TextEditingController _emailController = new TextEditingController();
  FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  String email;

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

  // ignore: unused_element
  _buildAppBar(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.blueGrey[800],
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
            "Sign Up",
            style: GoogleFonts.comfortaa(),
          ),
          IconButton(onPressed: () {}, icon: Icon(Icons.more_vert_rounded)),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: Colors.blueGrey[800],
          leading: IconButton(
              onPressed: () {
                Get.back();
              },
              icon: Icon(FontAwesomeIcons.chevronLeft)),
        ),
        body: Container(
            color: Colors.blueGrey[800],
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Form(key: formKey, child: _buildResetForm(context))));
  }

  _buildResetForm(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Padding(
        padding: const EdgeInsets.only(left: 25.0, right: 25.0),
        child: VStack([
          SizedBox(height: height * 0.08),
          Container(
            child: Center(
              child: Text('Reset Password',
                  style: GoogleFonts.raleway(fontSize: 40.0)),
            ),
          ),
          SizedBox(height: 25.0),
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
                // labelStyle:
                //     GoogleFonts.raleway(color: Colors.white, fontSize: 12.0),
                // focusedBorder: UnderlineInputBorder(
                //   borderSide: BorderSide(color: greenColor),
                // )
              ),
              onChanged: (value) {
                this.email = value;
              },
              validator: (value) =>
                  value.isEmpty ? 'Email is required' : validateEmail(value)),
          SizedBox(height: 50.0),
          GestureDetector(
            onTap: () {
              if (checkFields()) resetPasswordLink();
              Navigator.of(context).pop();
              Toast.show(
                  "please check your mail Box for reset your password", context,
                  duration: Toast.LENGTH_LONG, gravity: Toast.BOTTOM);
            },
            child: Container(
                height: height * 0.06,
                width: width * 0.85,
                child: Material(
                    borderRadius: BorderRadius.circular(10.0),
                    color: Color(0xFF2877ed),
                    elevation: 0.0,
                    child: Center(
                        child: Text('Reset',
                            style: GoogleFonts.comfortaa(
                                color: Colors.white, fontSize: 18.0))))),
          ).centered(),
          SizedBox(height: 20.0),
          // Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          //   InkWell(
          //       onTap: () {
          //         Navigator.of(context).pop();
          //       },
          //       child: Text('Go back',
          //           style: TextStyle(
          //               color: greenColor,
          //               fontFamily: 'Trueno',
          //               decoration: TextDecoration.underline)))
          // ])
        ]).scrollVertical());
  }

  resetPasswordLink() {
    return _firebaseAuth.sendPasswordResetEmail(
        email: _emailController.text.trim());
  }
}
