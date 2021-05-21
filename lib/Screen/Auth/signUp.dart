import 'dart:ffi';
import 'dart:io';
import 'package:covidcheck/services/authservices.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';

class SignupPage extends StatefulWidget {
  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final formKey = new GlobalKey<FormState>();

  String email, password, name;
  final TextEditingController _nameController = new TextEditingController();
  final TextEditingController _emailController = new TextEditingController();
  final TextEditingController _passwordController = new TextEditingController();
  final TextEditingController _cpassController = new TextEditingController();
  String userImageUrl = "";
  File _file;
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
            child: Form(key: formKey, child: _buildSignupForm(context))));
  }

  _buildSignupForm(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Padding(
        padding: const EdgeInsets.only(left: 25.0, right: 25.0),
        child: ListView(children: [
          SizedBox(height: 10.0),
          Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "Sign Up",
                  style: GoogleFonts.raleway(
                      fontSize: 25.0,
                      fontWeight: FontWeight.w600,
                      color: Colors.green),
                ),
                Divider(),
                SizedBox(height: 15.0),
                Container(
                  child: Center(
                    child: CircleAvatar(
                      radius: width * 0.15,
                      backgroundColor: Colors.white,
                      backgroundImage: _file == null ? null : FileImage(_file),
                      child: _file == null
                          ? Icon(
                              Icons.add_photo_alternate,
                              size: width * 0.15,
                            )
                          : null,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 25.0),
          TextFormField(
              controller: _nameController,
              decoration: InputDecoration(
                  labelText: 'Name',
                  labelStyle:
                      GoogleFonts.raleway(fontSize: 12.0, color: Colors.white),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: greenColor),
                  )),
              onChanged: (value) {
                this.name = value;
              },
              validator: (value) => value.isEmpty ? 'Name is required' : null),
          TextFormField(
              controller: _emailController,
              decoration: InputDecoration(
                  labelText: 'EMAIL',
                  labelStyle:
                      GoogleFonts.raleway(fontSize: 12.0, color: Colors.white),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: greenColor),
                  )),
              onChanged: (value) {
                this.email = value;
              },
              validator: (value) =>
                  value.isEmpty ? 'Email is required' : validateEmail(value)),
          TextFormField(
              controller: _passwordController,
              decoration: InputDecoration(
                  labelText: 'PASSWORD',
                  labelStyle:
                      GoogleFonts.raleway(fontSize: 12.0, color: Colors.white),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: greenColor),
                  )),
              obscureText: true,
              onChanged: (value) {
                this.password = value;
              },
              validator: (value) =>
                  value.isEmpty ? 'Password is required' : null),
          TextFormField(
              controller: _cpassController,
              decoration: InputDecoration(
                  labelText: 'CONFRIM PASSWORD',
                  labelStyle:
                      GoogleFonts.raleway(fontSize: 12.0, color: Colors.white),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: greenColor),
                  )),
              obscureText: true,
              onChanged: (value) {
                this.password = value;
              },
              validator: (value) =>
                  value.isEmpty ? 'Password is required' : null),
          SizedBox(height: 50.0),
          GestureDetector(
            onTap: () {
              // if (checkFields())
              //   AuthService().signUp(email, password, name, context);
            },
            child: Container(
                height: height * 0.06,
                // width: width * 0.10,
                child: Material(
                    borderRadius: BorderRadius.circular(25.0),
                    color: greenColor,
                    elevation: 0.0,
                    child: Center(
                        child: Text('Sign Up',
                            style: GoogleFonts.raleway(
                                color: Colors.white, fontSize: 18.0))))),
          ),
          SizedBox(height: 20.0),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            InkWell(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: Text('Go back',
                    style: TextStyle(
                        color: greenColor,
                        fontFamily: 'Trueno',
                        decoration: TextDecoration.underline)))
          ])
        ]));
  }

  Future<void> selectandPickImage() async {
    _file = (await ImagePicker().getImage(source: ImageSource.gallery)) as File;
  }
}
