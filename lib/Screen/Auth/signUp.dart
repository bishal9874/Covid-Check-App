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
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:velocity_x/velocity_x.dart';

class SignupPage extends StatefulWidget {
  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final formKey = new GlobalKey<FormState>();
  FirebaseStorage fstorage = FirebaseStorage.instance;
  FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  bool ishiddenpass = true;

  String email, password, name, phonenumber;
  final TextEditingController _nameController = new TextEditingController();
  final TextEditingController _emailController = new TextEditingController();
  final TextEditingController _phonenumberController =
      new TextEditingController();
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
        appBar: _buildAppBar(context),
        body: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Form(key: formKey, child: _buildSignupForm(context))));
  }

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

  _buildSignupForm(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Container(
        color: Colors.blueGrey[800],
        padding: const EdgeInsets.only(left: 25.0, right: 25.0),
        child: VStack([
          SizedBox(height: 10.0),
          Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
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
                filled: true,
                fillColor: Colors.blue[80],
                hintText: "Name",
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
              onChanged: (value) {
                this.name = value;
              },
              validator: (value) => value.isEmpty ? 'Name is required' : null),
          // TextFormField(
          //     controller: _nameController,
          //     decoration: InputDecoration(
          //         labelText: 'Name',
          //         labelStyle:
          //             GoogleFonts.raleway(fontSize: 12.0, color: Colors.white),
          //         focusedBorder: UnderlineInputBorder(
          //           borderSide: BorderSide(color: greenColor),
          //         )),
          //     onChanged: (value) {
          //       this.name = value;
          //     },
          //     validator: (value) => value.isEmpty ? 'Name is required' : null),
          // TextFormField(
          //     controller: _emailController,
          //     decoration: InputDecoration(
          //         labelText: 'EMAIL',
          //         labelStyle:
          //             GoogleFonts.raleway(fontSize: 12.0, color: Colors.white),
          //         focusedBorder: UnderlineInputBorder(
          //           borderSide: BorderSide(color: greenColor),
          //         )),
          //     onChanged: (value) {
          //       this.email = value;
          //     },
          //     validator: (value) =>
          //         value.isEmpty ? 'Email is required' : validateEmail(value)),
          SizedBox(height: height * 0.01),
          TextFormField(
              controller: _emailController,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.blue[80],
                hintText: " Email",
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
              onChanged: (value) {
                this.email = value;
              },
              validator: (value) =>
                  value.isEmpty ? 'Email is required' : validateEmail(value)),
          SizedBox(height: height * 0.01),
          TextFormField(
              controller: _phonenumberController,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.blue[80],
                hintText: " Phone Number",
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
              keyboardType: TextInputType.number,
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.digitsOnly
              ],
              onChanged: (value) {
                this.phonenumber = value;
              },
              validator: (value) {
                if (value.isEmpty) {
                  return "please enter your phone number";
                } else if (value.length != 10) {
                  return "please enter your valid phone number";
                }
                return null;
              }),
          SizedBox(height: height * 0.01),
          TextFormField(
              controller: _passwordController,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.blue[80],
                hintText: " Password",
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
                suffixIcon: IconButton(
                  icon: Icon(Icons.visibility),
                  onPressed: () {
                    _togglepassword();
                  },
                ),

                // labelText: 'PASSWORD',
                // labelStyle:
                //     GoogleFonts.raleway(fontSize: 12.0, color: Colors.white),
                // focusedBorder: UnderlineInputBorder(
                //   borderSide: BorderSide(color: greenColor),
                // ))
              ),
              obscureText: ishiddenpass,
              onChanged: (value) {
                this.password = value;
              },
              validator: (value) =>
                  value.isEmpty ? 'Password is required' : null),
          SizedBox(height: height * 0.01),
          TextFormField(
              controller: _cpassController,
              decoration: InputDecoration(
                suffixIcon: IconButton(
                  icon: Icon(Icons.visibility),
                  onPressed: () {
                    _togglepassword();
                  },
                ),
                filled: true,
                fillColor: Colors.blue[80],
                hintText: " Confrim Password",
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
                // labelText: 'CONFRIM PASSWORD',
                // labelStyle:
                //     GoogleFonts.raleway(fontSize: 12.0, color: Colors.white),
                // focusedBorder: UnderlineInputBorder(
                //   borderSide: BorderSide(color: greenColor),
                // )
              ),
              obscureText: ishiddenpass,
              onChanged: (value) {
                this.password = value;
              },
              validator: (value) =>
                  value.isEmpty ? 'confrim Password is required' : null),
          SizedBox(height: 50.0),
          GestureDetector(
            onTap: () {
              //   AuthService().signUp(email, password, name, context);
              uploadAndSaveImage();
            },
            child: Container(
                height: height * 0.06,
                width: width * 0.80,
                child: Material(
                    borderRadius: BorderRadius.circular(10.0),
                    color: Color(0xFF2877ed),
                    elevation: 0.0,
                    child: Center(
                        child: Text('Sign Up',
                            style: GoogleFonts.comfortaa(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                                fontSize: 18.0))))),
          ).centered(),
          SizedBox(height: 20.0),
        ]).scrollVertical());
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
    Reference reference = fstorage.ref().child("profileiamge");
    UploadTask uploadTask =
        reference.child("${_nameController}_$imageFileName ").putFile(_file);
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
      "phoneNumber": _phonenumberController.text.trim(),
      "url": userImageUrl,
      CovidCheckApp.userCartList: ["garbageValue"],
    });
    await CovidCheckApp.sharedPreferences
        .setString(CovidCheckApp.userUID, fuser.uid);
    await CovidCheckApp.sharedPreferences
        .setString(CovidCheckApp.userEmail, _emailController.text);
    await CovidCheckApp.sharedPreferences
        .setString(CovidCheckApp.phoneNumber, _phonenumberController.text);
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
