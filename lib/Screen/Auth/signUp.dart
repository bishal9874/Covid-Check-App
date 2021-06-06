import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:covidcheck/DialogBox/dialogBox.dart';
import 'package:covidcheck/DialogBox/loadignDialog.dart';
import 'package:covidcheck/Screen/home.dart';
import 'package:covidcheck/services/error_handler.dart';
import 'package:covidcheck/services/ser.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';

class SignupPage extends StatefulWidget {
  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final formKey = new GlobalKey<FormState>();
  FirebaseStorage fstorage = FirebaseStorage.instance;
  FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  bool ishiddenpass = true;

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
                    child: InkWell(
                      onTap: selectandPickImage,
                      child: CircleAvatar(
                        radius: width * 0.15,
                        backgroundColor: Colors.white,
                        backgroundImage:
                            _file == null ? null : FileImage(_file),
                        child: _file == null
                            ? Icon(
                                Icons.add_photo_alternate,
                                size: width * 0.15,
                              )
                            : null,
                      ),
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
                  suffixIcon: IconButton(
                    icon: Icon(Icons.visibility),
                    onPressed: () {
                      _togglepassword();
                    },
                  ),
                  labelText: 'PASSWORD',
                  labelStyle:
                      GoogleFonts.raleway(fontSize: 12.0, color: Colors.white),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: greenColor),
                  )),
              obscureText: ishiddenpass,
              onChanged: (value) {
                this.password = value;
              },
              validator: (value) =>
                  value.isEmpty ? 'Password is required' : null),
          TextFormField(
              controller: _cpassController,
              decoration: InputDecoration(
                  suffixIcon: IconButton(
                    icon: Icon(Icons.visibility),
                    onPressed: () {
                      _togglepassword();
                    },
                  ),
                  labelText: 'CONFRIM PASSWORD',
                  labelStyle:
                      GoogleFonts.raleway(fontSize: 12.0, color: Colors.white),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: greenColor),
                  )),
              obscureText: ishiddenpass,
              onChanged: (value) {
                this.password = value;
              },
              validator: (value) =>
                  value.isEmpty ? 'Password is required' : null),
          SizedBox(height: 50.0),
          GestureDetector(
            onTap: () {
              //   AuthService().signUp(email, password, name, context);
              uploadAndSaveImage();
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
    _file = File(await ImagePicker()
        .getImage(source: ImageSource.gallery)
        .then((pickedFile) => pickedFile.path));
  }

  Future<void> uploadAndSaveImage() async {
    if (_file == null) {
      showDialog(
          context: context,
          builder: (c) {
            return ErrorAlertDialog(
              message: "Please select an iamge file",
            );
          });
    } else {
      _passwordController.text == _cpassController.text
          ? _emailController.text.isNotEmpty &&
                  _passwordController.text.isNotEmpty &&
                  _cpassController.text.isNotEmpty &&
                  _nameController.text.isNotEmpty
              ? uploadtoStorage()
              : displayDialog(
                  "Please fill up the reg complete form",
                )
          : displayDialog(
              "Password do not match",
            );
    }
  }

  displayDialog(
    String msg,
  ) {
    showDialog(
        context: context,
        builder: (c) {
          return ErrorAlertDialog(
            message: msg,
          );
        });
  }

  uploadtoStorage() async {
    showDialog(
        context: context,
        builder: (c) {
          return LoadingAlertDialog(
            message: "Registering, Please wait......",
          );
        });

    String imageFileName = DateTime.now().millisecondsSinceEpoch.toString();
    Reference reference = fstorage.ref().child(imageFileName);
    UploadTask uploadTask = reference.putFile(_file);
    TaskSnapshot taskSnapshot = await uploadTask;
    await taskSnapshot.ref.getDownloadURL().then((url) {
      userImageUrl = url;
      _registerUser();
    });
  }

  void _registerUser() async {
    User user;
    await _firebaseAuth
        .createUserWithEmailAndPassword(
            email: _emailController.text.trim(),
            password: _passwordController.text.trim())
        .then((userCrads) {
      user = userCrads.user;
    }).catchError((e) {
      ErrorHandler().errorDialog(context, e);
    });

    if (user != null) {
      saveUserInfoToFirestore(user).then((value) {
        Navigator.pop(context);
        Route route = MaterialPageRoute(builder: (c) => HomePage());
        Navigator.pushReplacement(context, route);
      });
    }
  }

  Future saveUserInfoToFirestore(User fuser) async {
    FirebaseFirestore.instance.collection("users").doc(fuser.uid).set({
      "uid": fuser.uid,
      "email": _emailController.text.trim(),
      "name": _nameController.text.trim(),
      "url": userImageUrl,
      CovidCheckApp.userCartList: ["garbageValue"],
    });
    await CovidCheckApp.sharedPreferences
        .setString(CovidCheckApp.userUID, fuser.uid);
    await CovidCheckApp.sharedPreferences
        .setString(CovidCheckApp.userEmail, _emailController.text);
    await CovidCheckApp.sharedPreferences
        .setString(CovidCheckApp.userName, _nameController.text);
    await CovidCheckApp.sharedPreferences
        .setString(CovidCheckApp.userAvatarUrl, userImageUrl);
    await CovidCheckApp.sharedPreferences
        .setStringList(CovidCheckApp.userCartList, ["garbageValue"]);
  }

  void _togglepassword() {
    setState(() {
      ishiddenpass = !ishiddenpass;
    });
  }
}
