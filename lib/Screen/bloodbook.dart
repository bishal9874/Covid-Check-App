import 'dart:async';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:covidcheck/models/orgServiecs.dart';
import 'package:covidcheck/services/ser.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:toast/toast.dart';

class BloodServices extends StatefulWidget {
  OrgModel bloodservice;
  BloodServices({Key key, this.bloodservice}) : super(key: key);

  @override
  _BloodServicesState createState() => _BloodServicesState();
}

class _BloodServicesState extends State<BloodServices> {
  final formKey = new GlobalKey<FormState>();
  bool approval = false;
  String genderChoice = "";
  String bloodgroupChoice = "";
  DateTime dateTime = DateTime.now();
  String name, phonenumber, aadhar;
  String bloobankID = DateTime.now().millisecondsSinceEpoch.toString();
  String imageUrl = "";
  File _file;
  final TextEditingController _nameController = new TextEditingController();
  final TextEditingController _phonenumberController =
      new TextEditingController();
  final TextEditingController _aadharnumberController =
      new TextEditingController();

  Future<void> selectandPickImage() async {
    _file = File(await ImagePicker()
        .getImage(source: ImageSource.gallery)
        .then((pickedFile) => pickedFile.path));
  }

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
    return Scaffold(
        backgroundColor: Colors.blueGrey[700],
        appBar: _buildAppBar(context),
        body: Form(
            key: formKey,
            child:
                VStack([_buildHeading(context), _buildCoursePanel(context)])));
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
            "BloodBank",
            style: GoogleFonts.comfortaa(),
          ),
          IconButton(onPressed: () {}, icon: Icon(Icons.more_vert_rounded)),
        ],
      ),
    );
  }

  _buildHeading(
    BuildContext context,
  ) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Container(
      // height: height * 0.25,
      margin: EdgeInsets.all(10.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text("Upload Doctor Recommended Prescription",
              style: GoogleFonts.comfortaa(
                fontSize: width * 0.04,
              )),
          SizedBox(
            height: height * 0.02,
          ),
          Container(
            child: InkWell(
              onTap: selectandPickImage,
              child: CircleAvatar(
                radius: width * 0.10,
                backgroundColor: Colors.white,
                backgroundImage: _file == null ? null : FileImage(_file),
                child: _file == null
                    ? Icon(
                        Icons.add_photo_alternate,
                        size: width * 0.10,
                      )
                    : null,
              ),
            ),
          ),
        ],
      ),
    ).centered();
  }

  // ignore: non_constant_identifier_names
  upload_data() async {
    String imageDownURl = await uploadImage();
    updateDetails(imageDownURl);
  }

  Future<String> uploadImage() async {
    final Reference ref = FirebaseStorage.instance.ref().child("prescription");
    UploadTask uploadTask =
        ref.child("bloodbank_$bloobankID.jpg").putFile(_file);
    TaskSnapshot taskSnapshot = await uploadTask;
    imageUrl = await taskSnapshot.ref.getDownloadURL();
    return imageUrl;
  }

  updateDetails(String downloadUrl) {
    CovidCheckApp.firestore
        .collection("BloodBank")
        .doc(CovidCheckApp.sharedPreferences.getString(CovidCheckApp.userUID) +
            _aadharnumberController.text.trim())
        .set({
      "bloodCentre_Name": widget.bloodservice.organization,
      "userUI":
          CovidCheckApp.sharedPreferences.getString(CovidCheckApp.userUID),
      "username":
          CovidCheckApp.sharedPreferences.getString(CovidCheckApp.userName),
      "useremail":
          CovidCheckApp.sharedPreferences.getString(CovidCheckApp.userEmail),
      "name": _nameController.text.trim(),
      "aadharnumber": int.parse(_aadharnumberController.text.trim()),
      "phoneNumber": int.parse(_phonenumberController.text.trim()),
      "bloodchoice": bloodgroupChoice,
      "dateSelection": dateTime,
      "precriptionProve": downloadUrl,
      "adminapproval": approval,
      "gender": genderChoice,
      "publishDate": DateTime.now(),
    });
    CovidCheckApp.firestore
        .collection(CovidCheckApp.collectionUser)
        .doc(CovidCheckApp.sharedPreferences.getString(CovidCheckApp.userUID))
        .collection(CovidCheckApp.bloodbankcollection)
        .doc(CovidCheckApp.sharedPreferences.getString(CovidCheckApp.userUID) +
            _aadharnumberController.text.trim())
        .set({
      "bloodCentre_Name": widget.bloodservice.organization,
      "userUI":
          CovidCheckApp.sharedPreferences.getString(CovidCheckApp.userUID),
      "username":
          CovidCheckApp.sharedPreferences.getString(CovidCheckApp.userName),
      "useremail":
          CovidCheckApp.sharedPreferences.getString(CovidCheckApp.userEmail),
      "name": _nameController.text.trim(),
      "aadharnumber": int.parse(_aadharnumberController.text.trim()),
      "phoneNumber": int.parse(_phonenumberController.text.trim()),
      "bloodchoice": bloodgroupChoice,
      "dateSelection": dateTime,
      "precriptionProve": downloadUrl,
      "adminapproval": approval,
      "gender": genderChoice,
      "publishDate": DateTime.now(),
    }).then((value) {
      return showDialog(
          barrierDismissible: false,
          context: context,
          builder: (c) {
            Future.delayed(Duration(seconds: 5), () {
              Navigator.of(context).pop(true);
            });
            return AlertDialog(
                contentPadding: EdgeInsets.all(5.0),
                content: Container(
                  height: 100.0,
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircularProgressIndicator(
                          backgroundColor: Colors.cyanAccent,
                          valueColor:
                              new AlwaysStoppedAnimation<Color>(Colors.red),
                        ),
                        SizedBox(
                          height: 5.0,
                        ),
                        Text(
                          "Uploading.........",
                          style: GoogleFonts.comfortaa(),
                        )
                      ]),
                ));
          });
    }).whenComplete(() => showDialog(
            barrierDismissible: false,
            context: context,
            builder: (c) {
              Future.delayed(Duration(seconds: 8), () {
                Navigator.of(context).pop(true);
              });
              return AlertDialog(
                  backgroundColor: Color(0xffd0f2e7),
                  contentPadding: EdgeInsets.all(10.0),
                  content: Container(
                    height: 120.0,
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 2.0,
                          ),
                          Text(
                            "Blood Booking Successfully !! Please Kindly received your registerd blood from ${widget.bloodservice.organization} ",
                            style: GoogleFonts.comfortaa(
                                fontSize: 15.0, color: Colors.black),
                          ),
                          SizedBox(
                            height: 5.0,
                          ),
                          LinearProgressIndicator(
                            backgroundColor: Colors.cyanAccent,
                            valueColor:
                                new AlwaysStoppedAnimation<Color>(Colors.red),
                          ),
                          SizedBox(
                            height: 2.0,
                          ),
                        ]),
                  ));
            }));

    setState(() {
      _file = null;
      _nameController.clear();
      _phonenumberController.clear();
      _aadharnumberController.clear();
    });
  }

  Future<Null> selectTimePicker(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: dateTime,
        firstDate: DateTime(2021),
        lastDate: DateTime(2050));
    if (picked != null && picked != dateTime) {
      setState(() {
        dateTime = picked;
        print(dateTime.toString());
      });
    }
  }

  _buildCoursePanel(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Expanded(
      child: ClipRRect(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(50),
            topLeft: Radius.circular(50),
          ),
          child: Container(
            color: Colors.black26,
            child: VStack([
              Padding(
                padding: EdgeInsets.only(bottom: 15, top: 15),
                child: Center(
                  child: Text(
                    'Patient Details',
                    style: GoogleFonts.comfortaa(
                      fontSize: width * 0.04,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
              VStack(
                [
                  Container(
                      child: VStack([
                    TextFormField(
                        controller: _nameController,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.blue[80],
                          hintText: " Patient Name",
                          hintStyle: GoogleFonts.comfortaa(),
                          errorBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              borderSide:
                                  BorderSide(width: 1, color: Colors.red)),
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
                        validator: (value) =>
                            value.isEmpty ? 'Name is required' : null),
                    SizedBox(
                      height: height * 0.01,
                    ),
                    TextFormField(
                        controller: _phonenumberController,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.blue[80],
                          hintText: " Phone Number",
                          hintStyle: GoogleFonts.comfortaa(),
                          errorBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              borderSide:
                                  BorderSide(width: 1, color: Colors.red)),
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
                    SizedBox(
                      height: height * 0.01,
                    ),
                    TextFormField(
                        controller: _aadharnumberController,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.blue[80],
                          hintText: " Aadhar Number",
                          hintStyle: GoogleFonts.comfortaa(),
                          errorBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              borderSide:
                                  BorderSide(width: 1, color: Colors.red)),
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
                          this.aadhar = value;
                        },
                        validator: (value) {
                          if (value.isEmpty) {
                            return "please enter a Aadhar number";
                          } else if (value.length != 12) {
                            return "please enter a valid Aadhar number";
                          }

                          return null;
                        }),
                    SizedBox(
                      height: height * 0.01,
                    ),
                    Text("Gender",
                            style: GoogleFonts.comfortaa(
                                fontSize: 15.0, fontWeight: FontWeight.w700))
                        .p1(),
                    // SizedBox(
                    //   height: height * 0.01,
                    // ),
                    HStack([
                      _genderChoiceList("Male"),
                      _genderChoiceList("Female"),
                    ]),

                    Text("Blood Group Select",
                            style: GoogleFonts.comfortaa(
                                fontSize: 15.0, fontWeight: FontWeight.w700))
                        .p1(),
                    HStack([
                      _bloodgroupChoice(widget.bloodservice.blood1Choice),
                      _bloodgroupChoice(widget.bloodservice.blood2Choice),
                      _bloodgroupChoice(widget.bloodservice.blood3Choice),
                      _bloodgroupChoice(widget.bloodservice.blood4Choice),
                      _bloodgroupChoice(widget.bloodservice.blood5Choice),
                      _bloodgroupChoice(widget.bloodservice.blood6Choice),
                      _bloodgroupChoice(widget.bloodservice.blood7Choice),
                      _bloodgroupChoice(widget.bloodservice.blood8Choice),
                    ]).scrollHorizontal(),
                    Text("Select Schedule",
                            style: GoogleFonts.comfortaa(
                                fontSize: 15.0, fontWeight: FontWeight.w700))
                        .p1(),
                    SizedBox(
                      height: height * 0.01,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                            onTap: () => selectTimePicker(context),
                            child: Container(
                                height: height * 0.05,
                                width: width * 0.25,
                                child: Material(
                                    borderRadius: BorderRadius.circular(12.0),
                                    color: Color(0xFF2877ed),
                                    elevation: 0.0,
                                    child: Center(
                                      child: Text(
                                          dateTime.day.toString() +
                                              '/' +
                                              dateTime.month.toString() +
                                              '/' +
                                              dateTime.year.toString(),
                                          style: GoogleFonts.comfortaa(
                                              color: Colors.white,
                                              fontWeight: FontWeight.w600,
                                              fontSize: 15.0)),
                                    )))),
                      ],
                    ),
                    SizedBox(
                      height: height * 0.03,
                    ),
                    GestureDetector(
                      onTap: () {
                        if (checkFields() && _file != null)
                          showDialog(
                              context: context,
                              builder: (c) {
                                return AlertDialog(
                                  content: Container(
                                      height: height * 0.25,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Container(
                                              width: width * 0.43,
                                              child: Text(
                                                  "You Just Pay ₹ ${widget.bloodservice.minimumbloodprice} for BloodBank Registration",
                                                  style: GoogleFonts.comfortaa(
                                                      fontSize: 13.0,
                                                      fontWeight:
                                                          FontWeight.w700))),
                                          SizedBox(
                                            height: height * 0.03,
                                          ),
                                          GestureDetector(
                                            onTap: () async {
                                              upload_data();

                                              Navigator.pop(context);
                                            },
                                            child: Container(
                                                height: height * 0.06,
                                                width: width * 0.40,
                                                child: Material(
                                                    borderRadius: BorderRadius
                                                        .circular(5.0),
                                                    color: Color(0xFF2877ed),
                                                    elevation: 0.0,
                                                    child: Center(
                                                        child: Text('Pay',
                                                            style: GoogleFonts
                                                                .comfortaa(
                                                                    color: Colors
                                                                        .white,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600,
                                                                    fontSize:
                                                                        18.0))))),
                                          ),
                                          SizedBox(
                                            height: height * 0.01,
                                          ),
                                          Text(
                                            "After click pay Button wait for few Second",
                                            style: GoogleFonts.comfortaa(
                                                fontSize: 12.0,
                                                fontWeight: FontWeight.w200),
                                          ),
                                        ],
                                      )),
                                );
                              });
                        else
                          Toast.show(
                              "Please upload recommended Doctor Prescription",
                              context,
                              duration: Toast.LENGTH_LONG,
                              gravity: Toast.TOP);
                      },
                      child: Container(
                          height: height * 0.06,
                          width: width * 0.40,
                          child: Material(
                              borderRadius: BorderRadius.circular(5.0),
                              color: Color(0xFF2877ed),
                              elevation: 0.0,
                              child: Center(
                                  child: Text('Submit',
                                      style: GoogleFonts.comfortaa(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w600,
                                          fontSize: 18.0))))),
                    ).centered(),
                  ])).p8()
                ],
              ),
            ]).scrollVertical(),
          )),
    );
  }

  _genderChoiceList(String name) {
    return Container(
      padding: const EdgeInsets.all(4.0),
      child: ChoiceChip(
        label: Text(name),
        labelStyle: GoogleFonts.comfortaa(
            color: Colors.black, fontSize: 14.0, fontWeight: FontWeight.bold),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        backgroundColor: Color(0xffededed),
        selectedColor: Color(0xffffc107),
        selected: genderChoice == name,
        onSelected: (selected) {
          setState(() {
            genderChoice = name;
            print(genderChoice);
          });
        },
      ),
    );
  }

  _bloodgroupChoice(String name) {
    return Container(
      padding: const EdgeInsets.all(4.0),
      child: ChoiceChip(
        label: Text(name),
        labelStyle: GoogleFonts.comfortaa(
            color: Colors.black, fontSize: 14.0, fontWeight: FontWeight.bold),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        backgroundColor: Color(0xffededed),
        selectedColor: Color(0xffe6aab7),
        selected: bloodgroupChoice == name,
        onSelected: (selected) {
          setState(() {
            bloodgroupChoice = name;
            print(bloodgroupChoice);
          });
        },
      ),
    );
  }
}
