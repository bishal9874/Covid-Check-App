import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:covidcheck/admin/adminHomepage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class Adminauth extends StatefulWidget {
  @override
  _AdminauthState createState() => _AdminauthState();
}

class _AdminauthState extends State<Adminauth> {
  bool ishide = true;
  FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final formKey = new GlobalKey<FormState>();
  Color greenColor = Color(0xFF00AF19);
  String email, password, name;
  final TextEditingController _adminController = new TextEditingController();
  final TextEditingController _passwordController = new TextEditingController();
  checkFields() {
    final form = formKey.currentState;
    if (form.validate()) {
      form.save();
      return true;
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                Get.back();
              },
              icon: Icon(Icons.arrow_back_ios_new)),
          elevation: 0.0,
          backgroundColor: Colors.transparent,
        ),
        body: Padding(
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
                            text: 'Ad',
                            style: GoogleFonts.raleway(
                                fontWeight: FontWeight.w700,
                                color: Colors.white)),
                        TextSpan(
                            text: 'min',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.blueAccent[200])),
                      ],
                    ),
                  ))),
              SizedBox(height: 25.0),
              TextFormField(
                  controller: _adminController,
                  decoration: InputDecoration(
                      labelText: 'UID',
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
                  obscureText: ishide,
                  validator: (value) =>
                      value.isEmpty ? 'unique ID is required' : null),
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
                      labelStyle: TextStyle(
                          fontFamily: 'Trueno',
                          fontSize: 12.0,
                          color: Colors.white),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: greenColor),
                      )),
                  obscureText: ishide,
                  onChanged: (value) {
                    this.password = value;
                  },
                  validator: (value) =>
                      value.isEmpty ? 'Password is required' : null),
              SizedBox(height: 5.0),
              SizedBox(height: 50.0),
              GestureDetector(
                onTap: () {
                  loginAdmin();
                },
                child: Container(
                    height: height * 0.06,
                    // width: width * 0.10,
                    child: Material(
                        borderRadius: BorderRadius.circular(25.0),
                        color: Colors.blueAccent[200],
                        elevation: 0.0,
                        child: Center(
                            child: Text('Login',
                                style: GoogleFonts.raleway(
                                    color: Colors.white, fontSize: 18.0))))),
              ),
            ])));
  }

  void _togglepassword() {
    setState(() {
      ishide = !ishide;
    });
  }

  loginAdmin() {
    FirebaseFirestore.instance
        .collection(
          "admins",
        )
        .get()
        .then((snapshot) {
      snapshot.docs.forEach((result) {
        if (result.data()["id"] != _adminController.text.trim()) {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text("your id is not correct.")));
        } else if (result.data()["password"] !=
            _passwordController.text.trim()) {
          ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text("your password is not correct.")));
        } else {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content:
                  Text("Welcome to Admin Panel : " + result.data()["name"])));
          setState(() {
            _adminController.text = "";
            _passwordController.text = "";
          });
          Route route = MaterialPageRoute(
              builder: (c) => AdminHome(
                    name: result.data()["name"],
                  ));
          Navigator.pushReplacement(context, route);
        }
      });
    });
  }
}
