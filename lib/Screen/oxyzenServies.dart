import 'dart:io';

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

// ignore: must_be_immutable
class OxygenServices extends StatefulWidget {
  OrgModel oxygen;
  OxygenServices({Key key, this.oxygen}) : super(key: key);

  @override
  _OxygenServicesState createState() => _OxygenServicesState();
}

class _OxygenServicesState extends State<OxygenServices> {
  final formKey = new GlobalKey<FormState>();
  final TextEditingController _nameController = new TextEditingController();
  final TextEditingController _addressController = new TextEditingController();

  final TextEditingController _pinController = new TextEditingController();
  final TextEditingController _phonenumberController =
      new TextEditingController();
  final TextEditingController _reasonsController = new TextEditingController();
  bool adminApproval = false;
  String literOrMlChoice = "";
  String rentOrbuyChoice = "";
  String address, name, reason, phonenumber, pin, city, district;
  String imageUrl = "";
  File _file;
  DateTime birthDate = DateTime.now();
  DateTime dateTime = DateTime.now();
  String oxygenID = DateTime.now().millisecondsSinceEpoch.toString();

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

  checkFields() {
    final form = formKey.currentState;
    if (form.validate()) {
      form.save();
      return true;
    }
    return false;
  }

  Future<void> selectandPickImage() async {
    _file = File(await ImagePicker()
        .getImage(source: ImageSource.gallery)
        .then((pickedFile) => pickedFile.path));
  }

  @override
  Widget build(BuildContext context) {
    // var height = MediaQuery.of(context).size.height;
    // var width = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: _buildAppBar(context),
        body: Form(key: formKey, child: VStack([_buildCoursePanel(context)])));
  }

  _buildAppBar(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.blueGrey[700],
      automaticallyImplyLeading: false,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          IconButton(
              onPressed: () {
                Get.back();
              },
              icon: Icon(FontAwesomeIcons.chevronLeft)),
          Text("Oxyzen Booking", style: GoogleFonts.comfortaa(fontSize: 18.0)),
          IconButton(onPressed: () {}, icon: Icon(Icons.more_vert_rounded)),
        ],
      ),
    );
  }

  _buildCoursePanel(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Expanded(
      child: ClipRRect(
          child: Container(
        color: Colors.blueGrey[800],
        child: VStack([
          VStack(
            [
              Container(
                  child: VStack([
                Text("Verification Document",
                        style: GoogleFonts.comfortaa(
                            color: Colors.orange,
                            fontSize: 13.0,
                            fontWeight: FontWeight.w700))
                    .p1()
                    .centered(),
                SizedBox(
                  height: height * 0.01,
                ),
                Container(
                  child: InkWell(
                      onTap: selectandPickImage,
                      child: _file == null
                          ? Container(
                              height: height * 0.05,
                              width: width * .40,
                              decoration: BoxDecoration(
                                  color: Colors.blueGrey[500],
                                  borderRadius: BorderRadius.circular(5.0)),
                              child: Icon(Icons.add_a_photo),
                            )
                          : Container(
                              height: height * 0.05,
                              width: width * .40,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5.0),
                                  image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: FileImage(_file))),
                            )),
                ).centered(),
                SizedBox(
                  height: height * 0.01,
                ),
                TextFormField(
                    controller: _nameController,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.blue[80],
                      hintText: " Patient Name",
                      hintStyle: GoogleFonts.comfortaa(),
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
                      hintText: " Phone number",
                      hintStyle: GoogleFonts.comfortaa(),
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
                        return "please enter your Phone number";
                      } else if (value.length != 10) {
                        return "please enter your valid Phone number";
                      }
                      return null;
                    }),
                SizedBox(
                  height: height * 0.01,
                ),
                TextFormField(
                    controller: _reasonsController,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.blue[80],
                      hintText: "Reason",
                      hintStyle: GoogleFonts.comfortaa(),
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
                      this.reason = value;
                    },
                    validator: (value) {
                      if (value.isEmpty) {
                        return "please enter reason year";
                      }
                      return null;
                    }),
                SizedBox(
                  height: height * 0.01,
                ),
                SizedBox(
                  height: 15.0,
                ),
                Text("Select Varient",
                        style: GoogleFonts.comfortaa(
                            fontSize: 13.0, fontWeight: FontWeight.w700))
                    .p1(),
                HStack([
                  _rentOrBuyChoiceList("Rent"),
                  _rentOrBuyChoiceList("Buy"),
                ]),
                SizedBox(
                  height: height * 0.01,
                ),
                Text("Select lt/ml",
                        style: GoogleFonts.comfortaa(
                            fontSize: 13.0, fontWeight: FontWeight.w700))
                    .p1(),
                HStack(
                  [
                    _mlOrliterChoiceList("250 ml"),
                    _mlOrliterChoiceList("500 ml"),
                    _mlOrliterChoiceList("700 ml"),
                    _mlOrliterChoiceList("1 lt"),
                    _mlOrliterChoiceList("5 lt"),
                    _mlOrliterChoiceList("10 lt"),
                  ],
                ).scrollHorizontal(),
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
                    if (checkFields())
                      (_file != null)
                          ? (rentOrbuyChoice != "")
                              ? (literOrMlChoice != "")
                                  ? showDialog(
                                      context: context,
                                      builder: (c) {
                                        return AlertDialog(
                                          contentPadding: EdgeInsets.all(8.0),
                                          content: Container(
                                              height: height * 0.40,
                                              width: width * 0.80,
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceEvenly,
                                                children: [
                                                  Text("Add Address",
                                                      style:
                                                          GoogleFonts.comfortaa(
                                                              color:
                                                                  Colors.orange,
                                                              fontSize: 19.0,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w700)),

                                                  TextFormField(
                                                      controller:
                                                          _addressController,
                                                      decoration:
                                                          InputDecoration(
                                                        filled: true,
                                                        fillColor:
                                                            Colors.blue[80],
                                                        hintText: "Area Name",
                                                        hintStyle: GoogleFonts
                                                            .comfortaa(),
                                                        errorBorder: OutlineInputBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .all(Radius
                                                                        .circular(
                                                                            10)),
                                                            borderSide:
                                                                BorderSide(
                                                                    width: 1,
                                                                    color: Colors
                                                                        .red)),
                                                        focusedErrorBorder:
                                                            OutlineInputBorder(
                                                          borderRadius:
                                                              BorderRadius.all(
                                                                  Radius
                                                                      .circular(
                                                                          10)),
                                                        ),
                                                        border:
                                                            OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                                  color: Colors
                                                                      .white),
                                                          borderRadius:
                                                              const BorderRadius
                                                                  .all(
                                                            const Radius
                                                                .circular(10.0),
                                                          ),
                                                        ),
                                                      ),
                                                      onChanged: (value) {
                                                        this.address = value;
                                                      },
                                                      validator: (value) => value
                                                              .isEmpty
                                                          ? 'Address is required'
                                                          : null),

                                                  TextFormField(
                                                      controller:
                                                          _pinController,
                                                      decoration:
                                                          InputDecoration(
                                                        filled: true,
                                                        fillColor:
                                                            Colors.blue[80],
                                                        hintText: "Pin Code",
                                                        hintStyle: GoogleFonts
                                                            .comfortaa(),
                                                        errorBorder: OutlineInputBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .all(Radius
                                                                        .circular(
                                                                            10)),
                                                            borderSide:
                                                                BorderSide(
                                                                    width: 1,
                                                                    color: Colors
                                                                        .red)),
                                                        focusedErrorBorder:
                                                            OutlineInputBorder(
                                                          borderRadius:
                                                              BorderRadius.all(
                                                                  Radius
                                                                      .circular(
                                                                          10)),
                                                        ),
                                                        border:
                                                            OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                                  color: Colors
                                                                      .white),
                                                          borderRadius:
                                                              const BorderRadius
                                                                  .all(
                                                            const Radius
                                                                .circular(10.0),
                                                          ),
                                                        ),
                                                      ),
                                                      keyboardType:
                                                          TextInputType.number,
                                                      inputFormatters: <
                                                          TextInputFormatter>[
                                                        FilteringTextInputFormatter
                                                            .digitsOnly
                                                      ],
                                                      onChanged: (value) {
                                                        this.pin = value;
                                                      },
                                                      validator: (value) {
                                                        if (value.isEmpty) {
                                                          return "PIn Required";
                                                        }
                                                        return null;
                                                      }),
                                                  // SizedBox(
                                                  //     height: height * 0.01),
                                                  Text(
                                                      "You Just Pay ₹ ${widget.oxygen.minimumoygenprice} for Oxyzen Services"),
                                                  SizedBox(
                                                    height: height * 0.01,
                                                  ),
                                                  GestureDetector(
                                                    onTap: () {
                                                      (_addressController ==
                                                                  null &&
                                                              _pinController ==
                                                                  null)
                                                          ? VxToast.show(
                                                              context,
                                                              msg:
                                                                  "Field's are empty",
                                                              position:
                                                                  VxToastPosition
                                                                      .bottom,
                                                              bgColor: Colors
                                                                  .red[400],
                                                              showTime: 5000,
                                                              textColor:
                                                                  Colors.white)
                                                          : uploadData();
                                                      Navigator.pop(context);
                                                    },
                                                    child: Container(
                                                        height: height * 0.06,
                                                        width: width * 0.40,
                                                        child: Material(
                                                            borderRadius:
                                                                BorderRadius.circular(
                                                                    5.0),
                                                            color: Color(
                                                                0xFF2877ed),
                                                            elevation: 0.0,
                                                            child: Center(
                                                                child: Text(
                                                                    'Pay',
                                                                    style: GoogleFonts.comfortaa(
                                                                        color: Colors
                                                                            .white,
                                                                        fontWeight:
                                                                            FontWeight
                                                                                .w600,
                                                                        fontSize:
                                                                            18.0))))),
                                                  ),
                                                ],
                                              )),
                                        );
                                      })
                                  : VxToast.show(context,
                                      msg: "Choice liter/ml",
                                      position: VxToastPosition.bottom,
                                      bgColor: Colors.red[400],
                                      showTime: 5000,
                                      textColor: Colors.white)
                              : VxToast.show(context,
                                  msg: "Choice Varient ",
                                  position: VxToastPosition.bottom,
                                  bgColor: Colors.red[400],
                                  showTime: 5000,
                                  textColor: Colors.white)
                          : VxToast.show(context,
                              msg: "upload your varification Image",
                              position: VxToastPosition.bottom,
                              bgColor: Colors.red[400],
                              showTime: 5000,
                              textColor: Colors.white);
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

  _rentOrBuyChoiceList(String name) {
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
        selected: rentOrbuyChoice == name,
        onSelected: (selected) {
          setState(() {
            rentOrbuyChoice = name;
            print(rentOrbuyChoice);
          });
        },
      ),
    );
  }

  _mlOrliterChoiceList(String name) {
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
        selected: literOrMlChoice == name,
        onSelected: (selected) {
          setState(() {
            literOrMlChoice = name;
            print(literOrMlChoice);
          });
        },
      ),
    );
  }

  uploadData() async {
    String imageDownURl = await uploadImage();
    update(imageDownURl);
  }

  Future<String> uploadImage() async {
    final Reference ref = FirebaseStorage.instance.ref().child("OxygenService");
    UploadTask uploadTask =
        ref.child("OxygenService$oxygenID.jpg").putFile(_file);
    TaskSnapshot taskSnapshot = await uploadTask;
    imageUrl = await taskSnapshot.ref.getDownloadURL();
    return imageUrl;
  }

  update(String downloadUrl) {
    CovidCheckApp.firestore
        .collection("oxygen")
        .doc(CovidCheckApp.sharedPreferences.getString(CovidCheckApp.userUID) +
            oxygenID)
        .set({
      "oxygenCentre": widget.oxygen.organization,
      "phone_number": _phonenumberController.text.trim(),
      "userUI":
          CovidCheckApp.sharedPreferences.getString(CovidCheckApp.userUID),
      "username":
          CovidCheckApp.sharedPreferences.getString(CovidCheckApp.userName),
      "useremail":
          CovidCheckApp.sharedPreferences.getString(CovidCheckApp.userEmail),
      "name": _nameController.text.trim(),
      "Reason": _reasonsController.text.trim(),
      "rentorbuy": rentOrbuyChoice,
      "selectLt/ml": literOrMlChoice,
      "submit_time": oxygenID,
      "docnumber": widget.oxygen.docnumber,
      "adminApproval": adminApproval,
      "areaName": _addressController.text.trim(),
      "pin": int.parse(_pinController.text.trim()),
      "dateSelected": dateTime,
      "verificationUrl": downloadUrl
    });

    CovidCheckApp.firestore
        .collection(CovidCheckApp.collectionUser)
        .doc(CovidCheckApp.sharedPreferences.getString(CovidCheckApp.userUID))
        .collection(CovidCheckApp.oxygencollection)
        .doc(oxygenID + _nameController.text.trim())
        .set({
      "oxygenCentre": widget.oxygen.organization,
      "phone_number": _phonenumberController.text.trim(),
      "userUI":
          CovidCheckApp.sharedPreferences.getString(CovidCheckApp.userUID),
      "username":
          CovidCheckApp.sharedPreferences.getString(CovidCheckApp.userName),
      "useremail":
          CovidCheckApp.sharedPreferences.getString(CovidCheckApp.userEmail),
      "name": _nameController.text.trim(),
      "Reason": _reasonsController.text.trim(),
      "rentorbuy": rentOrbuyChoice,
      "selectLt/ml": literOrMlChoice,
      "submit_time": oxygenID,
      "docnumber": widget.oxygen.docnumber,
      "areaName": _addressController.text.trim(),
      "pin": int.parse(_pinController.text.trim()),
      "adminApproval": adminApproval,
      "dateSelected": dateTime,
      "verificationUrl": downloadUrl
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
                          "Oxygen cylinder Booking.........",
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
                            "Your cylinder Booking Successfully Done!! Please Kindly Visit Our Hospital/Organization on your mentioned Date and Time Thank You",
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
      _pinController.clear();
      _reasonsController.clear();
      rentOrbuyChoice = "";
      literOrMlChoice = "";
    });
  }
}
