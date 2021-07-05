import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:velocity_x/velocity_x.dart';

class Organization extends StatefulWidget {
  const Organization({Key key}) : super(key: key);

  @override
  _OrganizationState createState() => _OrganizationState();
}

class _OrganizationState extends State<Organization> {
  String blood1Choice = "";
  String blood2Choice = "";
  String blood3Choice = "";
  String blood4Choice = "";
  String blood5Choice = "";
  String blood6Choice = "";
  String blood7Choice = "";
  String blood8Choice = "";
  String doctor1day1schedule = "";
  String doctor1day2schedule = "";
  String doctor1day3schedule = "";
  String doctor2day1schedule = "";
  String doctor2day2schedule = "";
  String doctor2day3schedule = "";
  String doctor3day1schedule = "";
  String doctor3day2schedule = "";
  String doctor3day3schedule = "";

  final formKey = new GlobalKey<FormState>();
  String email,
      name,
      doctor1,
      doctor2,
      doctor3,
      doctor1des,
      doctor2des,
      doctor3des,
      vaccine1,
      vaccine2,
      vaccine3,
      doctor1fee,
      doctor2fee,
      doctor3fee,
      address,
      city,
      district,
      pin,
      contact,
      eamil,
      normalbed,
      emgBed,
      quarentine,
      priceOfvacine,
      priceOfappintment,
      priceOfbed,
      bloodbank,
      oxygen,
      ambulenceNumber;
  String day1vacine1, day2vacine1, day3vacine1, day4vacine1, day5vacine1;
  String day1vacine2, day2vacine2, day3vacine2, day4vacine2, day5vacine2;
  String day1vacine3, day2vacine3, day3vacine3, day4vacine3, day5vacine3;
  String day1doc1, day2doc1, day3doc1;
  String day1doc2, day2doc2, day3doc2;
  String day1doc3, day2doc3, day3doc3;
  String imageUrl = "";
  File _file;
  TextEditingController _organizationName = new TextEditingController();
  TextEditingController _doctor1Name = new TextEditingController();
  TextEditingController _doctor2Name = new TextEditingController();
  TextEditingController _doctor3Name = new TextEditingController();
  TextEditingController _vaccine1Name = new TextEditingController();
  TextEditingController _vaccine2Name = new TextEditingController();
  TextEditingController _vaccine3Name = new TextEditingController();
  TextEditingController _doctor1description = new TextEditingController();
  TextEditingController _doctor2description = new TextEditingController();
  TextEditingController _doctor3description = new TextEditingController();
  TextEditingController _doctorfees1 = new TextEditingController();
  TextEditingController _doctorfees2 = new TextEditingController();
  TextEditingController _doctorfees3 = new TextEditingController();
  TextEditingController _organizationAddress = new TextEditingController();
  TextEditingController _organizationcity = new TextEditingController();
  TextEditingController _organizationDistrict = new TextEditingController();
  TextEditingController _organizationAddresspin = new TextEditingController();
  TextEditingController _organizationcontact = new TextEditingController();
  TextEditingController _organizationemail = new TextEditingController();
  TextEditingController _normalBed = new TextEditingController();
  TextEditingController _emergencyBed = new TextEditingController();
  TextEditingController _qurentinebed = new TextEditingController();
  TextEditingController _minimun_price_of_vacination =
      new TextEditingController();
  TextEditingController _minimun_price_of_Appointment =
      new TextEditingController();
  TextEditingController _minimun_price_of_bedBooking =
      new TextEditingController();
  TextEditingController _minimun_price_of_bloodbankServices =
      new TextEditingController();
  TextEditingController _minimun_price_of_oxygenServices =
      new TextEditingController();
  TextEditingController _phoneNumber_of_ambulance = new TextEditingController();

  ///
  ///
  ///
  ///
  ///
  ///
  ///
  TextEditingController _doctor1Day1view = new TextEditingController();
  DateTime doctor1Day1dateTime = DateTime.now();
  Future<Null> selectdoctor1Day1Picker(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: doctor1Day1dateTime,
        firstDate: DateTime(2021),
        lastDate: DateTime(2050));
    if (picked != null && picked != doctor1Day1dateTime) {
      setState(() {
        doctor1Day1dateTime = picked;
        print("day1doc1 " + doctor1Day1dateTime.toString());
      });
    }
  }

  TextEditingController _doctor1Day2view = new TextEditingController();
  DateTime doctor1Day2dateTime = DateTime.now();
  Future<Null> selectdoctor1Day2Picker(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: doctor1Day2dateTime,
        firstDate: DateTime(2021),
        lastDate: DateTime(2050));
    if (picked != null && picked != doctor1Day2dateTime) {
      setState(() {
        doctor1Day2dateTime = picked;
        print("day2doc1 " + doctor1Day2dateTime.toString());
      });
    }
  }

  TextEditingController _doctor1Day3view = new TextEditingController();
  DateTime doctor1Day3dateTime = DateTime.now();
  Future<Null> selectdoctor1Day3Picker(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: doctor1Day3dateTime,
        firstDate: DateTime(2021),
        lastDate: DateTime(2050));
    if (picked != null && picked != doctor1Day3dateTime) {
      setState(() {
        doctor1Day3dateTime = picked;
        print("day3doc1 " + doctor1Day3dateTime.toString());
      });
    }
  }

  ///
  ///
  ///
  ///
  ///
  ///
  TextEditingController _doctor2Day1view = new TextEditingController();
  DateTime doctor2Day1dateTime = DateTime.now();
  Future<Null> selectdoctor2Day1Picker(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: doctor2Day1dateTime,
        firstDate: DateTime(2021),
        lastDate: DateTime(2050));
    if (picked != null && picked != doctor2Day1dateTime) {
      setState(() {
        doctor2Day1dateTime = picked;
        print("day1doc2 " + doctor2Day1dateTime.toString());
      });
    }
  }

  TextEditingController _doctor2Day2view = new TextEditingController();
  DateTime doctor2Day2dateTime = DateTime.now();
  Future<Null> selectdoctor2Day2Picker(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: doctor2Day2dateTime,
        firstDate: DateTime(2021),
        lastDate: DateTime(2050));
    if (picked != null && picked != doctor2Day2dateTime) {
      setState(() {
        doctor2Day2dateTime = picked;
        print("day3doc2 " + doctor2Day2dateTime.toString());
      });
    }
  }

  TextEditingController _doctor2Day3view = new TextEditingController();
  DateTime doctor2Day3dateTime = DateTime.now();
  Future<Null> selectdoctor2Day3Picker(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: doctor2Day3dateTime,
        firstDate: DateTime(2021),
        lastDate: DateTime(2050));
    if (picked != null && picked != doctor2Day3dateTime) {
      setState(() {
        doctor2Day3dateTime = picked;
        print("day3doc2 " + doctor2Day3dateTime.toString());
      });
    }
  }

  ///
  ///
  ///
  ///
  ///
  ///
  ///
  ///
  ///
  TextEditingController _doctor3Day1view = new TextEditingController();
  DateTime doctor3Day1dateTime = DateTime.now();
  Future<Null> selectdoctor3Day1Picker(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: doctor3Day1dateTime,
        firstDate: DateTime(2021),
        lastDate: DateTime(2050));
    if (picked != null && picked != doctor3Day1dateTime) {
      setState(() {
        doctor3Day1dateTime = picked;
        print("day1doc3 " + doctor3Day1dateTime.toString());
      });
    }
  }

  TextEditingController _doctor3Day2view = new TextEditingController();
  DateTime doctor3Day2dateTime = DateTime.now();
  Future<Null> selectdoctor3Day2Picker(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: doctor3Day2dateTime,
        firstDate: DateTime(2021),
        lastDate: DateTime(2050));
    if (picked != null && picked != doctor3Day2dateTime) {
      setState(() {
        doctor3Day2dateTime = picked;
        print("day3doc3 " + doctor3Day2dateTime.toString());
      });
    }
  }

  TextEditingController _doctor3Day3view = new TextEditingController();
  DateTime doctor3Day3dateTime = DateTime.now();
  Future<Null> selectdoctor3Day3Picker(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: doctor3Day3dateTime,
        firstDate: DateTime(2021),
        lastDate: DateTime(2050));
    if (picked != null && picked != doctor3Day3dateTime) {
      setState(() {
        doctor3Day3dateTime = picked;
        print("day3doc3 " + doctor3Day3dateTime.toString());
      });
    }
  }

  ///
  ///
  ///
  ///
  ///
  ///
  ///
  ///
  TextEditingController _vaccine1Day1availity = new TextEditingController();
  DateTime vaccine1Day1dateTime = DateTime.now();
  Future<Null> selectvaccine1Day1Picker(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: vaccine1Day1dateTime,
        firstDate: DateTime(2021),
        lastDate: DateTime(2050));
    if (picked != null && picked != vaccine1Day1dateTime) {
      setState(() {
        vaccine1Day1dateTime = picked;
        print("day1vac1 " + vaccine1Day1dateTime.toString());
      });
    }
  }

  TextEditingController _vaccine1Day2availity = new TextEditingController();
  DateTime vaccine1Day2dateTime = DateTime.now();
  Future<Null> selectvaccine1Day2Picker(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: vaccine1Day2dateTime,
        firstDate: DateTime(2021),
        lastDate: DateTime(2050));
    if (picked != null && picked != vaccine1Day2dateTime) {
      setState(() {
        vaccine1Day2dateTime = picked;
        print("day2vac1 " + vaccine1Day2dateTime.toString());
      });
    }
  }

  TextEditingController _vaccine1Day3availity = new TextEditingController();
  DateTime vaccine1Day3dateTime = DateTime.now();
  Future<Null> selectvaccine1Day3Picker(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: vaccine1Day3dateTime,
        firstDate: DateTime(2021),
        lastDate: DateTime(2050));
    if (picked != null && picked != vaccine1Day3dateTime) {
      setState(() {
        vaccine1Day3dateTime = picked;
        print("day3vac1 " + vaccine1Day3dateTime.toString());
      });
    }
  }

  TextEditingController _vaccine1Day4availity = new TextEditingController();
  DateTime vaccine1Day4dateTime = DateTime.now();
  Future<Null> selectvaccine1Day4Picker(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: vaccine1Day4dateTime,
        firstDate: DateTime(2021),
        lastDate: DateTime(2050));
    if (picked != null && picked != vaccine1Day4dateTime) {
      setState(() {
        vaccine1Day4dateTime = picked;
        print("day4vac1 " + vaccine1Day4dateTime.toString());
      });
    }
  }

  TextEditingController _vaccine1Day5availity = new TextEditingController();
  DateTime vaccine1Day5dateTime = DateTime.now();
  Future<Null> selectvaccine1Day5Picker(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: vaccine1Day5dateTime,
        firstDate: DateTime(2021),
        lastDate: DateTime(2050));
    if (picked != null && picked != vaccine1Day5dateTime) {
      setState(() {
        vaccine1Day5dateTime = picked;
        print("day5vac1 " + vaccine1Day5dateTime.toString());
      });
    }
  }

  //
  //
  //
  ///
  ///
  ///
  ///
  ///
  ///
  ///
  ///
  ///
  ///
  ///
  ///
  ///
  ///
  ///

  ///
  ///
  ///
  ///
  ///
  ///
  ///
  TextEditingController _vaccine2Day1availity = new TextEditingController();
  DateTime vaccine2Day1dateTime = DateTime.now();
  Future<Null> selectvaccine2Day1Picker(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: vaccine2Day1dateTime,
        firstDate: DateTime(2021),
        lastDate: DateTime(2050));
    if (picked != null && picked != vaccine2Day1dateTime) {
      setState(() {
        vaccine2Day1dateTime = picked;
        print("day1vac2 " + vaccine2Day1dateTime.toString());
      });
    }
  }

  TextEditingController _vaccine2Day2availity = new TextEditingController();
  DateTime vaccine2Day2dateTime = DateTime.now();
  Future<Null> selectvaccine2Day2Picker(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: vaccine2Day2dateTime,
        firstDate: DateTime(2021),
        lastDate: DateTime(2050));
    if (picked != null && picked != vaccine2Day2dateTime) {
      setState(() {
        vaccine2Day2dateTime = picked;
        print("day2vac2 " + vaccine2Day2dateTime.toString());
      });
    }
  }

  TextEditingController _vaccine2Day3availity = new TextEditingController();
  DateTime vaccine2Day3dateTime = DateTime.now();
  Future<Null> selectvaccine2Day3Picker(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: vaccine2Day3dateTime,
        firstDate: DateTime(2021),
        lastDate: DateTime(2050));
    if (picked != null && picked != vaccine2Day3dateTime) {
      setState(() {
        vaccine2Day3dateTime = picked;
        print("day3vac2 " + vaccine2Day3dateTime.toString());
      });
    }
  }

  TextEditingController _vaccine2Day4availity = new TextEditingController();
  DateTime vaccine2Day4dateTime = DateTime.now();
  Future<Null> selectvaccine2Day4Picker(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: vaccine2Day4dateTime,
        firstDate: DateTime(2021),
        lastDate: DateTime(2050));
    if (picked != null && picked != vaccine2Day4dateTime) {
      setState(() {
        vaccine2Day4dateTime = picked;
        print("day4vac2 " + vaccine2Day4dateTime.toString());
      });
    }
  }

  TextEditingController _vaccine2Day5availity = new TextEditingController();
  DateTime vaccine2Day5dateTime = DateTime.now();
  Future<Null> selectvaccine2Day5Picker(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: vaccine2Day5dateTime,
        firstDate: DateTime(2021),
        lastDate: DateTime(2050));
    if (picked != null && picked != vaccine2Day5dateTime) {
      setState(() {
        vaccine2Day5dateTime = picked;
        print("day5vac2 " + vaccine2Day5dateTime.toString());
      });
    }
  }

  //
  ///
  ///
  ///
  ///
  ///
  ///
  ///
  //
  TextEditingController _vaccine3Day1availity = new TextEditingController();
  DateTime vaccine3Day1dateTime = DateTime.now();
  Future<Null> selectvaccine3Day1Picker(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: vaccine3Day1dateTime,
        firstDate: DateTime(2021),
        lastDate: DateTime(2050));
    if (picked != null && picked != vaccine3Day1dateTime) {
      setState(() {
        vaccine3Day1dateTime = picked;
        print("day1vac3 " + vaccine3Day1dateTime.toString());
      });
    }
  }

  TextEditingController _vaccine3Day2availity = new TextEditingController();
  DateTime vaccine3Day2dateTime = DateTime.now();
  Future<Null> selectvaccine3Day2Picker(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: vaccine3Day2dateTime,
        firstDate: DateTime(2021),
        lastDate: DateTime(2050));
    if (picked != null && picked != vaccine3Day2dateTime) {
      setState(() {
        vaccine3Day2dateTime = picked;
        print("day2vac3 " + vaccine3Day2dateTime.toString());
      });
    }
  }

  TextEditingController _vaccine3Day3availity = new TextEditingController();
  DateTime vaccine3Day3dateTime = DateTime.now();
  Future<Null> selectvaccine3Day3Picker(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: vaccine3Day3dateTime,
        firstDate: DateTime(2021),
        lastDate: DateTime(2050));
    if (picked != null && picked != vaccine3Day3dateTime) {
      setState(() {
        vaccine3Day3dateTime = picked;
        print("day3vac3 " + vaccine3Day3dateTime.toString());
      });
    }
  }

  TextEditingController _vaccine3Day4availity = new TextEditingController();
  DateTime vaccine3Day4dateTime = DateTime.now();
  Future<Null> selectvaccine3Day4Picker(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: vaccine3Day4dateTime,
        firstDate: DateTime(2021),
        lastDate: DateTime(2050));
    if (picked != null && picked != vaccine3Day4dateTime) {
      setState(() {
        vaccine3Day4dateTime = picked;
        print("day4vac3 " + vaccine3Day4dateTime.toString());
      });
    }
  }

  TextEditingController _vaccine3Day5availity = new TextEditingController();
  DateTime vaccine3Day5dateTime = DateTime.now();
  Future<Null> selectvaccine3Day5Picker(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: vaccine3Day5dateTime,
        firstDate: DateTime(2021),
        lastDate: DateTime(2050));
    if (picked != null && picked != vaccine3Day5dateTime) {
      setState(() {
        vaccine3Day5dateTime = picked;
        print("day5vac3 " + vaccine3Day5dateTime.toString());
      });
    }
  }

////
  ///
  ///
  ///
  ///
  ///
  ///
  ///
  ///
  ///
  ///
  ///
  String oranizationID = DateTime.now().millisecondsSinceEpoch.toString();
  bool uploading = false;

  String validateEmail(String value) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern);
    if (!regex.hasMatch(value))
      return 'Enter Valid Email';
    else
      return null;
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
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: "Add Organization".text.make(),
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: Icon(Icons.arrow_back_ios),
        ),
      ),
      body: Container(
        child: Form(
          key: formKey,
          child: VStack([
            uploading ? CircularProgressIndicator() : Text(""),
            Container(
              child: Column(
                children: [
                  InkWell(
                    onTap: captureImage,
                    child: CircleAvatar(
                      radius: width * 0.10,
                      backgroundColor: Colors.white,
                      backgroundImage: _file == null ? null : FileImage(_file),
                      child: _file == null
                          ? Icon(
                              Icons.add_photo_alternate,
                              size: width * 0.08,
                            )
                          : null,
                    ),
                  ),
                  Divider(),
                  "Organization Image".text.size(12.0).make()
                ],
              ).centered(),
            ),
            TextFormField(
                style: GoogleFonts.raleway(),
                controller: _organizationName,
                decoration: InputDecoration(
                  labelText: "Organization Name",
                  labelStyle:
                      GoogleFonts.raleway(fontSize: 16.0, color: Colors.white),
                ),
                onChanged: (value) {
                  this.name = value;
                },
                validator: (value) =>
                    value.isEmpty ? 'Organization Name Required' : null),
            SizedBox(
              height: 15.0,
            ),
            TextFormField(
                style: GoogleFonts.raleway(),
                controller: _doctor1Name,
                decoration: InputDecoration(
                  labelText: "Doctor 1 Name",
                  labelStyle:
                      GoogleFonts.raleway(fontSize: 16.0, color: Colors.white),
                ),
                onChanged: (value) {
                  this.doctor1 = value;
                },
                validator: (value) => value.isEmpty
                    ? 'if Doctor name is empty (type not availble)'
                    : null),
            SizedBox(
              height: 15.0,
            ),
            TextFormField(
                style: GoogleFonts.raleway(),
                controller: _doctor1description,
                decoration: InputDecoration(
                  labelText: "Doctor 1 Description",
                  labelStyle:
                      GoogleFonts.raleway(fontSize: 16.0, color: Colors.white),
                ),
                onChanged: (value) {
                  this.doctor1des = value;
                },
                validator: (value) => value.isEmpty ? '(type Null)' : null),
            SizedBox(
              height: 15.0,
            ),
            TextFormField(
                style: GoogleFonts.raleway(),
                controller: _doctorfees1,
                decoration: InputDecoration(
                  labelText: "Doctor 1 Fees",
                  labelStyle:
                      GoogleFonts.raleway(fontSize: 16.0, color: Colors.white),
                ),
                onChanged: (value) {
                  this.doctor1fee = value;
                },
                validator: (value) {
                  if (value.isEmpty) {
                    return "please enter Doctor1 fees";
                  }
                  return null;
                }),
            SizedBox(
              height: 15.0,
            ),
            Text("Schedule Time Set",
                style: GoogleFonts.raleway(fontWeight: FontWeight.w400)),
            SizedBox(
              height: height * 0.01,
            ),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              GestureDetector(
                  onTap: () => selectdoctor1Day1Picker(context),
                  child: Container(
                      height: height * 0.05,
                      width: width * 0.25,
                      child: Material(
                          borderRadius: BorderRadius.circular(12.0),
                          color: Color(0xFF2877ed),
                          elevation: 0.0,
                          child: Center(
                            child: Text(
                                doctor1Day1dateTime.day.toString() +
                                    '/' +
                                    doctor1Day1dateTime.month.toString() +
                                    '/' +
                                    doctor1Day1dateTime.year.toString(),
                                style: GoogleFonts.comfortaa(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 15.0)),
                          )))),
              SizedBox(
                width: width * 0.01,
              ),
              Flexible(
                child: TextFormField(
                    controller: _doctor1Day1view,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.blue[80],
                      hintText: "Day1view",
                      hintStyle: GoogleFonts.raleway(),
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
                      this.day1doc1 = value;
                    },
                    validator: (value) {
                      if (value.isEmpty) {
                        return "please enter day1 view Minimum Patient ";
                      } else {
                        return null;
                      }
                    }),
              ),
            ]),
            HStack([
              Wrap(
                spacing: 2.0,
                children: [
                  _doctor1day1schedule("Not Available"),
                  _doctor1day1schedule("7am to 10am"),
                  _doctor1day1schedule("11am to 1pm"),
                  _doctor1day1schedule("2am to 5pm"),
                  _doctor1day1schedule("7pm to 9pm"),
                ],
              )
            ]).scrollHorizontal(),
            SizedBox(
              height: 15.0,
            ),

            ///
            ///
            ///
            ///
            ///
            ///
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              GestureDetector(
                  onTap: () => selectdoctor1Day2Picker(context),
                  child: Container(
                      height: height * 0.05,
                      width: width * 0.25,
                      child: Material(
                          borderRadius: BorderRadius.circular(12.0),
                          color: Color(0xFF2877ed),
                          elevation: 0.0,
                          child: Center(
                            child: Text(
                                doctor1Day2dateTime.day.toString() +
                                    '/' +
                                    doctor1Day2dateTime.month.toString() +
                                    '/' +
                                    doctor1Day2dateTime.year.toString(),
                                style: GoogleFonts.comfortaa(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 15.0)),
                          )))),
              SizedBox(
                width: width * 0.01,
              ),
              Flexible(
                child: TextFormField(
                    controller: _doctor1Day2view,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.blue[80],
                      hintText: "Day2view",
                      hintStyle: GoogleFonts.raleway(),
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
                      this.day2doc1 = value;
                    },
                    validator: (value) {
                      if (value.isEmpty) {
                        return "please enter day2 view Minimum Patient ";
                      } else {
                        return null;
                      }
                    }),
              ),
            ]),
            HStack([
              Wrap(
                spacing: 2.0,
                children: [
                  _doctor1day2schedule("Not Available"),
                  _doctor1day2schedule("7am to 10am"),
                  _doctor1day2schedule("11am to 1pm"),
                  _doctor1day2schedule("2am to 5pm"),
                  _doctor1day2schedule("7pm to 9pm"),
                ],
              )
            ]).scrollHorizontal(),
            SizedBox(
              height: 15.0,
            ),
            //
            ///
            ///
            ///
            ///
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              GestureDetector(
                  onTap: () => selectdoctor1Day3Picker(context),
                  child: Container(
                      height: height * 0.05,
                      width: width * 0.25,
                      child: Material(
                          borderRadius: BorderRadius.circular(12.0),
                          color: Color(0xFF2877ed),
                          elevation: 0.0,
                          child: Center(
                            child: Text(
                                doctor1Day3dateTime.day.toString() +
                                    '/' +
                                    doctor1Day3dateTime.month.toString() +
                                    '/' +
                                    doctor1Day3dateTime.year.toString(),
                                style: GoogleFonts.comfortaa(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 15.0)),
                          )))),
              SizedBox(
                width: width * 0.01,
              ),
              Flexible(
                child: TextFormField(
                    controller: _doctor1Day3view,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.blue[80],
                      hintText: "Day3view",
                      hintStyle: GoogleFonts.raleway(),
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
                      this.day3doc1 = value;
                    },
                    validator: (value) {
                      if (value.isEmpty) {
                        return "please enter day3 view Minimum Patient ";
                      } else {
                        return null;
                      }
                    }),
              ),
            ]),
            HStack([
              Wrap(
                spacing: 2.0,
                children: [
                  _doctor1day3schedule("Not Available"),
                  _doctor1day3schedule("7am to 10am"),
                  _doctor1day3schedule("11am to 1pm"),
                  _doctor1day3schedule("2am to 5pm"),
                  _doctor1day3schedule("7pm to 9pm"),
                ],
              )
            ]).scrollHorizontal(),
            SizedBox(
              height: 15.0,
            ),
            TextFormField(
                style: GoogleFonts.raleway(),
                controller: _doctor2Name,
                decoration: InputDecoration(
                  labelText: "Doctor 2 Name",
                  labelStyle:
                      GoogleFonts.raleway(fontSize: 16.0, color: Colors.white),
                ),
                onChanged: (value) {
                  this.doctor2 = value;
                },
                validator: (value) => value.isEmpty
                    ? 'if Doctor name is empty (type not availble)'
                    : null),
            SizedBox(
              height: 15.0,
            ),
            TextFormField(
                style: GoogleFonts.raleway(),
                controller: _doctor2description,
                decoration: InputDecoration(
                  labelText: "Doctor 2 Description",
                  labelStyle:
                      GoogleFonts.raleway(fontSize: 16.0, color: Colors.white),
                ),
                onChanged: (value) {
                  this.doctor2des = value;
                },
                validator: (value) => value.isEmpty ? '(type Null)' : null),
            SizedBox(
              height: 15.0,
            ),
            TextFormField(
                style: GoogleFonts.raleway(),
                controller: _doctorfees2,
                decoration: InputDecoration(
                  labelText: "Doctor 2 Fees",
                  labelStyle:
                      GoogleFonts.raleway(fontSize: 16.0, color: Colors.white),
                ),
                onChanged: (value) {
                  this.doctor2fee = value;
                },
                validator: (value) {
                  if (value.isEmpty) {
                    return "please enter Doctor2 fees";
                  }
                  return null;
                }),
            SizedBox(
              height: 15.0,
            ),
            Text("Schedule Time Set",
                style: GoogleFonts.raleway(fontWeight: FontWeight.w400)),

            ///
            ///
            ///
            ///
            ///
            ///
            ///
            ///
            ///
            ///
            ///
            ///
            ///
            ///
            ///
            ///
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              GestureDetector(
                  onTap: () => selectdoctor2Day1Picker(context),
                  child: Container(
                      height: height * 0.05,
                      width: width * 0.25,
                      child: Material(
                          borderRadius: BorderRadius.circular(12.0),
                          color: Color(0xFF2877ed),
                          elevation: 0.0,
                          child: Center(
                            child: Text(
                                doctor2Day1dateTime.day.toString() +
                                    '/' +
                                    doctor2Day1dateTime.month.toString() +
                                    '/' +
                                    doctor2Day1dateTime.year.toString(),
                                style: GoogleFonts.comfortaa(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 15.0)),
                          )))),
              SizedBox(
                width: width * 0.01,
              ),
              Flexible(
                child: TextFormField(
                    controller: _doctor2Day1view,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.blue[80],
                      hintText: "Day1view",
                      hintStyle: GoogleFonts.raleway(),
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
                      this.day1doc2 = value;
                    },
                    validator: (value) {
                      if (value.isEmpty) {
                        return "please enter day1 view Minimum Patient ";
                      } else {
                        return null;
                      }
                    }),
              ),
            ]),
            HStack([
              Wrap(
                spacing: 2.0,
                children: [
                  _doctor2day1schedule("Not Available"),
                  _doctor2day1schedule("7am to 10am"),
                  _doctor2day1schedule("11am to 1pm"),
                  _doctor2day1schedule("2am to 5pm"),
                  _doctor2day1schedule("7pm to 9pm"),
                ],
              )
            ]).scrollHorizontal(),
            SizedBox(
              height: 15.0,
            ),

            ///
            ///
            ///
            ///
            ///
            ///
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              GestureDetector(
                  onTap: () => selectdoctor2Day2Picker(context),
                  child: Container(
                      height: height * 0.05,
                      width: width * 0.25,
                      child: Material(
                          borderRadius: BorderRadius.circular(12.0),
                          color: Color(0xFF2877ed),
                          elevation: 0.0,
                          child: Center(
                            child: Text(
                                doctor2Day2dateTime.day.toString() +
                                    '/' +
                                    doctor2Day2dateTime.month.toString() +
                                    '/' +
                                    doctor2Day2dateTime.year.toString(),
                                style: GoogleFonts.comfortaa(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 15.0)),
                          )))),
              SizedBox(
                width: width * 0.01,
              ),
              Flexible(
                child: TextFormField(
                    controller: _doctor2Day2view,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.blue[80],
                      hintText: "Day2view",
                      hintStyle: GoogleFonts.raleway(),
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
                      this.day2doc2 = value;
                    },
                    validator: (value) {
                      if (value.isEmpty) {
                        return "please enter day2 view Minimum Patient ";
                      } else {
                        return null;
                      }
                    }),
              ),
            ]),
            HStack([
              Wrap(
                spacing: 2.0,
                children: [
                  _doctor2day2schedule("Not Available"),
                  _doctor2day2schedule("7am to 10am"),
                  _doctor2day2schedule("11am to 1pm"),
                  _doctor2day2schedule("2am to 5pm"),
                  _doctor2day2schedule("7pm to 9pm"),
                ],
              )
            ]).scrollHorizontal(),
            SizedBox(
              height: 15.0,
            ),
            //
            ///
            ///
            ///
            ///
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              GestureDetector(
                  onTap: () => selectdoctor2Day3Picker(context),
                  child: Container(
                      height: height * 0.05,
                      width: width * 0.25,
                      child: Material(
                          borderRadius: BorderRadius.circular(12.0),
                          color: Color(0xFF2877ed),
                          elevation: 0.0,
                          child: Center(
                            child: Text(
                                doctor2Day3dateTime.day.toString() +
                                    '/' +
                                    doctor2Day3dateTime.month.toString() +
                                    '/' +
                                    doctor2Day3dateTime.year.toString(),
                                style: GoogleFonts.comfortaa(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 15.0)),
                          )))),
              SizedBox(
                width: width * 0.01,
              ),
              Flexible(
                child: TextFormField(
                    controller: _doctor2Day3view,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.blue[80],
                      hintText: "Day3view",
                      hintStyle: GoogleFonts.raleway(),
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
                      this.day3doc2 = value;
                    },
                    validator: (value) {
                      if (value.isEmpty) {
                        return "please enter day3 view Minimum Patient ";
                      } else {
                        return null;
                      }
                    }),
              ),
            ]),
            HStack([
              Wrap(
                spacing: 2.0,
                children: [
                  _doctor2day3schedule("Not Available"),
                  _doctor2day3schedule("7am to 10am"),
                  _doctor2day3schedule("11am to 1pm"),
                  _doctor2day3schedule("2am to 5pm"),
                  _doctor2day3schedule("7pm to 9pm"),
                ],
              )
            ]).scrollHorizontal(),
            SizedBox(
              height: 15.0,
            ),

            ///
            ///
            ///
            ///
            ///
            ///
            ///
            ///

            TextFormField(
                style: GoogleFonts.raleway(),
                controller: _doctor3Name,
                decoration: InputDecoration(
                  labelText: "Doctor 3 Name",
                  labelStyle:
                      GoogleFonts.raleway(fontSize: 16.0, color: Colors.white),
                ),
                onChanged: (value) {
                  this.doctor3 = value;
                },
                validator: (value) => value.isEmpty
                    ? 'if Doctor name is empty (type not availble)'
                    : null),
            SizedBox(
              height: 15.0,
            ),
            TextFormField(
                style: GoogleFonts.raleway(),
                controller: _doctor3description,
                decoration: InputDecoration(
                  labelText: "Doctor 3 Description",
                  labelStyle:
                      GoogleFonts.raleway(fontSize: 16.0, color: Colors.white),
                ),
                onChanged: (value) {
                  this.doctor3des = value;
                },
                validator: (value) => value.isEmpty ? '(type Null)' : null),
            SizedBox(
              height: 15.0,
            ),
            TextFormField(
                style: GoogleFonts.raleway(),
                controller: _doctorfees3,
                decoration: InputDecoration(
                  labelText: "Doctor 3 Fees",
                  labelStyle:
                      GoogleFonts.raleway(fontSize: 16.0, color: Colors.white),
                ),
                onChanged: (value) {
                  this.doctor3fee = value;
                },
                validator: (value) {
                  if (value.isEmpty) {
                    return "please enter Doctor3 fees";
                  }
                  return null;
                }),
            SizedBox(
              height: 15.0,
            ),
            Text("Schedule Time Set",
                style: GoogleFonts.raleway(fontWeight: FontWeight.w400)),

            /////
            ///
            ///
            ///
            ///
            ///
            ///
            ///
            ///
            ///
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              GestureDetector(
                  onTap: () => selectdoctor3Day1Picker(context),
                  child: Container(
                      height: height * 0.05,
                      width: width * 0.25,
                      child: Material(
                          borderRadius: BorderRadius.circular(12.0),
                          color: Color(0xFF2877ed),
                          elevation: 0.0,
                          child: Center(
                            child: Text(
                                doctor3Day1dateTime.day.toString() +
                                    '/' +
                                    doctor3Day1dateTime.month.toString() +
                                    '/' +
                                    doctor3Day1dateTime.year.toString(),
                                style: GoogleFonts.comfortaa(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 15.0)),
                          )))),
              SizedBox(
                width: width * 0.01,
              ),
              Flexible(
                child: TextFormField(
                    controller: _doctor3Day1view,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.blue[80],
                      hintText: "Day1view",
                      hintStyle: GoogleFonts.raleway(),
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
                      this.day1doc3 = value;
                    },
                    validator: (value) {
                      if (value.isEmpty) {
                        return "please enter day1 view Minimum Patient ";
                      } else {
                        return null;
                      }
                    }),
              ),
            ]),
            HStack([
              Wrap(
                spacing: 2.0,
                children: [
                  _doctor3day1schedule("Not Available"),
                  _doctor3day1schedule("7am to 10am"),
                  _doctor3day1schedule("11am to 1pm"),
                  _doctor3day1schedule("2am to 5pm"),
                  _doctor3day1schedule("7pm to 9pm"),
                ],
              )
            ]).scrollHorizontal(),
            SizedBox(
              height: 15.0,
            ),

            ///
            ///
            ///
            ///
            ///
            ///
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              GestureDetector(
                  onTap: () => selectdoctor3Day2Picker(context),
                  child: Container(
                      height: height * 0.05,
                      width: width * 0.25,
                      child: Material(
                          borderRadius: BorderRadius.circular(12.0),
                          color: Color(0xFF2877ed),
                          elevation: 0.0,
                          child: Center(
                            child: Text(
                                doctor3Day2dateTime.day.toString() +
                                    '/' +
                                    doctor3Day2dateTime.month.toString() +
                                    '/' +
                                    doctor3Day2dateTime.year.toString(),
                                style: GoogleFonts.comfortaa(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 15.0)),
                          )))),
              SizedBox(
                width: width * 0.01,
              ),
              Flexible(
                child: TextFormField(
                    controller: _doctor3Day2view,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.blue[80],
                      hintText: "Day2view",
                      hintStyle: GoogleFonts.raleway(),
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
                      this.day2doc3 = value;
                    },
                    validator: (value) {
                      if (value.isEmpty) {
                        return "please enter day2 view Minimum Patient ";
                      } else {
                        return null;
                      }
                    }),
              ),
            ]),
            HStack([
              Wrap(
                spacing: 2.0,
                children: [
                  _doctor3day2schedule("Not Available"),
                  _doctor3day2schedule("7am to 10am"),
                  _doctor3day2schedule("11am to 1pm"),
                  _doctor3day2schedule("2am to 5pm"),
                  _doctor3day2schedule("7pm to 9pm"),
                ],
              )
            ]).scrollHorizontal(),
            SizedBox(
              height: 15.0,
            ),
            //
            ///
            ///
            ///
            ///
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              GestureDetector(
                  onTap: () => selectdoctor3Day3Picker(context),
                  child: Container(
                      height: height * 0.05,
                      width: width * 0.25,
                      child: Material(
                          borderRadius: BorderRadius.circular(12.0),
                          color: Color(0xFF2877ed),
                          elevation: 0.0,
                          child: Center(
                            child: Text(
                                doctor3Day3dateTime.day.toString() +
                                    '/' +
                                    doctor3Day3dateTime.month.toString() +
                                    '/' +
                                    doctor3Day3dateTime.year.toString(),
                                style: GoogleFonts.comfortaa(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 15.0)),
                          )))),
              SizedBox(
                width: width * 0.01,
              ),
              Flexible(
                child: TextFormField(
                    controller: _doctor3Day3view,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.blue[80],
                      hintText: "Day3view",
                      hintStyle: GoogleFonts.raleway(),
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
                      this.day3doc3 = value;
                    },
                    validator: (value) {
                      if (value.isEmpty) {
                        return "please enter day3 view Minimum Patient ";
                      } else {
                        return null;
                      }
                    }),
              ),
            ]),
            HStack([
              Wrap(
                spacing: 2.0,
                children: [
                  _doctor3day3schedule("Not Available"),
                  _doctor3day3schedule("7am to 10am"),
                  _doctor3day3schedule("11am to 1pm"),
                  _doctor3day3schedule("2am to 5pm"),
                  _doctor3day3schedule("7pm to 9pm"),
                ],
              )
            ]).scrollHorizontal(),
            SizedBox(
              height: 15.0,
            ),

            ////
            ///
            ///
            ///
            ///
            ///
            ///
            ///
            ///
            ///
            SizedBox(
              height: 15.0,
            ),
            TextFormField(
                controller: _minimun_price_of_Appointment,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.blue[80],
                  hintText: " Minimum Doctor Appointment price (under 50 rs)",
                  hintStyle: GoogleFonts.raleway(),
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
                  this.priceOfappintment = value;
                },
                validator: (value) {
                  if (value.isEmpty) {
                    return "please enter Minimum Appointment Price";
                  } else {
                    return null;
                  }
                }),
            SizedBox(
              height: 15.0,
            ),
            TextFormField(
                style: GoogleFonts.raleway(),
                controller: _normalBed,
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  labelText: "Normal Bed Available",
                  labelStyle:
                      GoogleFonts.raleway(fontSize: 16.0, color: Colors.white),
                ),
                onChanged: (value) {
                  this.normalbed = value;
                },
                validator: (value) {
                  if (value.isEmpty) {
                    return "please enter Bed Number";
                  }
                  return null;
                }),
            SizedBox(
              height: 15.0,
            ),
            TextFormField(
                style: GoogleFonts.raleway(),
                controller: _emergencyBed,
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  labelText: "Emergency Bed Available Number",
                  labelStyle:
                      GoogleFonts.raleway(fontSize: 16.0, color: Colors.white),
                ),
                onChanged: (value) {
                  this.emgBed = value;
                },
                validator: (value) {
                  if (value.isEmpty) {
                    return "please enter Bed Number Number";
                  }
                  return null;
                }),
            SizedBox(
              height: 15.0,
            ),
            TextFormField(
                style: GoogleFonts.raleway(),
                controller: _qurentinebed,
                decoration: InputDecoration(
                  labelText: "covid quarantine Bed",
                  labelStyle:
                      GoogleFonts.raleway(fontSize: 16.0, color: Colors.white),
                ),
                onChanged: (value) {
                  this.quarentine = value;
                },
                validator: (value) {
                  if (value.isEmpty) {
                    return "please enter covid quarantine Bed number";
                  }
                  return null;
                }),
            SizedBox(
              height: 15.0,
            ),
            TextFormField(
                controller: _minimun_price_of_bedBooking,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.blue[80],
                  hintText: " Minimum Bed Booking price (under 50 rs)",
                  hintStyle: GoogleFonts.raleway(),
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
                  this.priceOfbed = value;
                },
                validator: (value) {
                  if (value.isEmpty) {
                    return "please enter Minimum bed Price";
                  } else {
                    return null;
                  }
                }),
            SizedBox(
              height: 15.0,
            ),

            ///
            ///
            ///
            ///
            ///
            ///
            TextFormField(
                style: GoogleFonts.raleway(),
                controller: _vaccine1Name,
                decoration: InputDecoration(
                  labelText: "Vaccine 1 Name",
                  labelStyle:
                      GoogleFonts.raleway(fontSize: 16.0, color: Colors.white),
                ),
                onChanged: (value) {
                  this.vaccine1 = value;
                },
                validator: (value) {
                  if (value.isEmpty) {
                    return "please enter vaccine 1 Name";
                  }
                  return null;
                }),
            SizedBox(
              height: 15.0,
            ),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              GestureDetector(
                  onTap: () => selectvaccine1Day1Picker(context),
                  child: Container(
                      height: height * 0.05,
                      width: width * 0.25,
                      child: Material(
                          borderRadius: BorderRadius.circular(12.0),
                          color: Color(0xFF2877ed),
                          elevation: 0.0,
                          child: Center(
                            child: Text(
                                vaccine1Day1dateTime.day.toString() +
                                    '/' +
                                    vaccine1Day1dateTime.month.toString() +
                                    '/' +
                                    vaccine1Day1dateTime.year.toString(),
                                style: GoogleFonts.comfortaa(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 15.0)),
                          )))),
              SizedBox(
                width: width * 0.01,
              ),
              Flexible(
                child: TextFormField(
                    controller: _vaccine1Day1availity,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.blue[80],
                      hintText: "Day1Available",
                      hintStyle: GoogleFonts.raleway(),
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
                      this.day1vacine1 = value;
                    },
                    validator: (value) {
                      if (value.isEmpty) {
                        return "please enter day1 available Minimum Vaccine ";
                      } else {
                        return null;
                      }
                    }),
              ),
            ]),

            ///
            ///
            ///
            ///
            ///

            SizedBox(
              height: height * 0.01,
            ),

            ///
            ///
            ///
            ///
            ///
            ///
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              GestureDetector(
                  onTap: () => selectvaccine1Day2Picker(context),
                  child: Container(
                      height: height * 0.05,
                      width: width * 0.25,
                      child: Material(
                          borderRadius: BorderRadius.circular(12.0),
                          color: Color(0xFF2877ed),
                          elevation: 0.0,
                          child: Center(
                            child: Text(
                                vaccine1Day2dateTime.day.toString() +
                                    '/' +
                                    vaccine1Day2dateTime.month.toString() +
                                    '/' +
                                    vaccine1Day2dateTime.year.toString(),
                                style: GoogleFonts.comfortaa(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 15.0)),
                          )))),
              SizedBox(
                width: width * 0.01,
              ),
              Flexible(
                child: TextFormField(
                    controller: _vaccine1Day2availity,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.blue[80],
                      hintText: "Day2Available",
                      hintStyle: GoogleFonts.raleway(),
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
                      this.day2vacine1 = value;
                    },
                    validator: (value) {
                      if (value.isEmpty) {
                        return "please enter day2 available Minimum Vaccine ";
                      } else {
                        return null;
                      }
                    }),
              ),
            ]),
            ////
            ///
            ///
            SizedBox(
              height: height * 0.01,
            ),

            ///
            ///
            ///
            ///
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              GestureDetector(
                  onTap: () => selectvaccine1Day3Picker(context),
                  child: Container(
                      height: height * 0.05,
                      width: width * 0.25,
                      child: Material(
                          borderRadius: BorderRadius.circular(12.0),
                          color: Color(0xFF2877ed),
                          elevation: 0.0,
                          child: Center(
                            child: Text(
                                vaccine1Day3dateTime.day.toString() +
                                    '/' +
                                    vaccine1Day3dateTime.month.toString() +
                                    '/' +
                                    vaccine1Day3dateTime.year.toString(),
                                style: GoogleFonts.comfortaa(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 15.0)),
                          )))),
              SizedBox(
                width: width * 0.01,
              ),
              Flexible(
                child: TextFormField(
                    controller: _vaccine1Day3availity,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.blue[80],
                      hintText: "Day3Available",
                      hintStyle: GoogleFonts.raleway(),
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
                      this.day3vacine1 = value;
                    },
                    validator: (value) {
                      if (value.isEmpty) {
                        return "please enter day3 available Minimum Vaccine ";
                      } else {
                        return null;
                      }
                    }),
              ),
            ]),

            ///
            ///
            ///
            ///
            ///
            SizedBox(
              height: height * 0.01,
            ),

            ///
            ///
            ///
            ///
            ///
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              GestureDetector(
                  onTap: () => selectvaccine1Day4Picker(context),
                  child: Container(
                      height: height * 0.05,
                      width: width * 0.25,
                      child: Material(
                          borderRadius: BorderRadius.circular(12.0),
                          color: Color(0xFF2877ed),
                          elevation: 0.0,
                          child: Center(
                            child: Text(
                                vaccine1Day4dateTime.day.toString() +
                                    '/' +
                                    vaccine1Day4dateTime.month.toString() +
                                    '/' +
                                    vaccine1Day4dateTime.year.toString(),
                                style: GoogleFonts.comfortaa(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 15.0)),
                          )))),
              SizedBox(
                width: width * 0.01,
              ),
              Flexible(
                child: TextFormField(
                    controller: _vaccine1Day4availity,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.blue[80],
                      hintText: "Day4Available",
                      hintStyle: GoogleFonts.raleway(),
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
                      this.day4vacine1 = value;
                    },
                    validator: (value) {
                      if (value.isEmpty) {
                        return "please enter day4 available Minimum Vaccine ";
                      } else {
                        return null;
                      }
                    }),
              ),
            ]),

            ///
            ///
            ///
            ///
            ///
            SizedBox(
              height: height * 0.01,
            ),

            ///
            ///
            ///
            ///
            ///
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              GestureDetector(
                  onTap: () => selectvaccine1Day5Picker(context),
                  child: Container(
                      height: height * 0.05,
                      width: width * 0.25,
                      child: Material(
                          borderRadius: BorderRadius.circular(12.0),
                          color: Color(0xFF2877ed),
                          elevation: 0.0,
                          child: Center(
                            child: Text(
                                vaccine1Day5dateTime.day.toString() +
                                    '/' +
                                    vaccine1Day5dateTime.month.toString() +
                                    '/' +
                                    vaccine1Day5dateTime.year.toString(),
                                style: GoogleFonts.comfortaa(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 15.0)),
                          )))),
              SizedBox(
                width: width * 0.01,
              ),
              Flexible(
                child: TextFormField(
                    controller: _vaccine1Day5availity,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.blue[80],
                      hintText: "Day5Available",
                      hintStyle: GoogleFonts.raleway(),
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
                      this.day5vacine1 = value;
                    },
                    validator: (value) {
                      if (value.isEmpty) {
                        return "please enter day5 available Minimum Vaccine ";
                      } else {
                        return null;
                      }
                    }),
              ),
            ]),

            ///
            ///
            ///
            ///
            ///
            ///
            ///
            ///
            ///
            ///
            ///
            ///
            ///
            ///
            ///
            ///
            ///
            ///
            ///
            ///
            ///
            ///
            ///
            ///
            SizedBox(
              height: height * 0.01,
            ),
            TextFormField(
                style: GoogleFonts.raleway(),
                controller: _vaccine2Name,
                decoration: InputDecoration(
                  labelText: "Vaccine 2 Name",
                  labelStyle:
                      GoogleFonts.raleway(fontSize: 16.0, color: Colors.white),
                ),
                onChanged: (value) {
                  this.vaccine2 = value;
                },
                validator: (value) {
                  if (value.isEmpty) {
                    return "please enter vaccine 2 Name";
                  }
                  return null;
                }),
            SizedBox(
              height: height * 0.01,
            ),

            ///
            ///
            ///
            ///
            ///

            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              GestureDetector(
                  onTap: () => selectvaccine2Day1Picker(context),
                  child: Container(
                      height: height * 0.05,
                      width: width * 0.25,
                      child: Material(
                          borderRadius: BorderRadius.circular(12.0),
                          color: Color(0xFF2877ed),
                          elevation: 0.0,
                          child: Center(
                            child: Text(
                                vaccine2Day1dateTime.day.toString() +
                                    '/' +
                                    vaccine2Day1dateTime.month.toString() +
                                    '/' +
                                    vaccine2Day1dateTime.year.toString(),
                                style: GoogleFonts.comfortaa(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 15.0)),
                          )))),
              SizedBox(
                width: width * 0.01,
              ),
              Flexible(
                child: TextFormField(
                    controller: _vaccine2Day1availity,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.blue[80],
                      hintText: "vacccine2 Day1 Available",
                      hintStyle: GoogleFonts.raleway(),
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
                      this.day1vacine2 = value;
                    },
                    validator: (value) {
                      if (value.isEmpty) {
                        return "please enter day1 available Minimum Vaccine2 ";
                      } else {
                        return null;
                      }
                    }),
              ),
            ]),

            ///
            ///
            ///
            ///
            ///
            SizedBox(
              height: height * 0.01,
            ),

            ///
            ///
            ///
            ///
            ///
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              GestureDetector(
                  onTap: () => selectvaccine2Day2Picker(context),
                  child: Container(
                      height: height * 0.05,
                      width: width * 0.25,
                      child: Material(
                          borderRadius: BorderRadius.circular(12.0),
                          color: Color(0xFF2877ed),
                          elevation: 0.0,
                          child: Center(
                            child: Text(
                                vaccine2Day2dateTime.day.toString() +
                                    '/' +
                                    vaccine2Day2dateTime.month.toString() +
                                    '/' +
                                    vaccine2Day2dateTime.year.toString(),
                                style: GoogleFonts.comfortaa(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 15.0)),
                          )))),
              SizedBox(
                width: width * 0.01,
              ),
              Flexible(
                child: TextFormField(
                    controller: _vaccine2Day2availity,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.blue[80],
                      hintText: "vacccine2 Day2 Available",
                      hintStyle: GoogleFonts.raleway(),
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
                      this.day2vacine2 = value;
                    },
                    validator: (value) {
                      if (value.isEmpty) {
                        return "please enter day2 available Minimum Vaccine ";
                      } else {
                        return null;
                      }
                    }),
              ),
            ]),

            ///
            ///
            ///
            ///
            ///
            SizedBox(
              height: height * 0.01,
            ),

            ///
            ///
            ///
            ///
            ///
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              GestureDetector(
                  onTap: () => selectvaccine2Day3Picker(context),
                  child: Container(
                      height: height * 0.05,
                      width: width * 0.25,
                      child: Material(
                          borderRadius: BorderRadius.circular(12.0),
                          color: Color(0xFF2877ed),
                          elevation: 0.0,
                          child: Center(
                            child: Text(
                                vaccine2Day3dateTime.day.toString() +
                                    '/' +
                                    vaccine2Day3dateTime.month.toString() +
                                    '/' +
                                    vaccine2Day3dateTime.year.toString(),
                                style: GoogleFonts.comfortaa(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 15.0)),
                          )))),
              SizedBox(
                width: width * 0.01,
              ),
              Flexible(
                child: TextFormField(
                    controller: _vaccine2Day3availity,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.blue[80],
                      hintText: "vacccine2 Day3 Available",
                      hintStyle: GoogleFonts.raleway(),
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
                      this.day3vacine2 = value;
                    },
                    validator: (value) {
                      if (value.isEmpty) {
                        return "please enter day3 available Minimum Vaccine ";
                      } else {
                        return null;
                      }
                    }),
              ),
            ]),

            ///
            ///
            ///
            ///
            ///
            ///
            SizedBox(
              height: height * 0.01,
            ),

            ///
            ///
            ///
            ///
            ///
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              GestureDetector(
                  onTap: () => selectvaccine2Day4Picker(context),
                  child: Container(
                      height: height * 0.05,
                      width: width * 0.25,
                      child: Material(
                          borderRadius: BorderRadius.circular(12.0),
                          color: Color(0xFF2877ed),
                          elevation: 0.0,
                          child: Center(
                            child: Text(
                                vaccine2Day4dateTime.day.toString() +
                                    '/' +
                                    vaccine2Day4dateTime.month.toString() +
                                    '/' +
                                    vaccine2Day4dateTime.year.toString(),
                                style: GoogleFonts.comfortaa(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 15.0)),
                          )))),
              SizedBox(
                width: width * 0.01,
              ),
              Flexible(
                child: TextFormField(
                    controller: _vaccine2Day4availity,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.blue[80],
                      hintText: "vacccine2 Day4 Available",
                      hintStyle: GoogleFonts.raleway(),
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
                      this.day4vacine2 = value;
                    },
                    validator: (value) {
                      if (value.isEmpty) {
                        return "please enter day4 available Minimum Vaccine ";
                      } else {
                        return null;
                      }
                    }),
              ),
            ]),

            ///
            ///
            ///
            ///
            ///
            SizedBox(
              height: height * 0.01,
            ),

            ///
            ///
            ///
            ///
            ///
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              GestureDetector(
                  onTap: () => selectvaccine2Day5Picker(context),
                  child: Container(
                      height: height * 0.05,
                      width: width * 0.25,
                      child: Material(
                          borderRadius: BorderRadius.circular(12.0),
                          color: Color(0xFF2877ed),
                          elevation: 0.0,
                          child: Center(
                            child: Text(
                                vaccine2Day5dateTime.day.toString() +
                                    '/' +
                                    vaccine2Day5dateTime.month.toString() +
                                    '/' +
                                    vaccine2Day5dateTime.year.toString(),
                                style: GoogleFonts.comfortaa(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 15.0)),
                          )))),
              SizedBox(
                width: width * 0.01,
              ),
              Flexible(
                child: TextFormField(
                    controller: _vaccine2Day5availity,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.blue[80],
                      hintText: "vacccine2 Day5 Available",
                      hintStyle: GoogleFonts.raleway(),
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
                      this.day5vacine2 = value;
                    },
                    validator: (value) {
                      if (value.isEmpty) {
                        return "please enter day5 available Minimum Vaccine ";
                      } else {
                        return null;
                      }
                    }),
              ),
            ]),

            ///
            ///
            ///
            ///
            ///
            ///
            ///
            ///
            ///
            ///
            ///
            ///
            ///
            ///
            ///
            ///
            ///
            SizedBox(
              height: 15.0,
            ),
            TextFormField(
                style: GoogleFonts.raleway(),
                controller: _vaccine3Name,
                decoration: InputDecoration(
                  labelText: "Vaccine 3 Name",
                  labelStyle:
                      GoogleFonts.raleway(fontSize: 16.0, color: Colors.white),
                ),
                onChanged: (value) {
                  this.vaccine3 = value;
                },
                validator: (value) {
                  if (value.isEmpty) {
                    return "please enter vaccine 3 Name";
                  }
                  return null;
                }),
            SizedBox(
              height: 15.0,
            ),

            ///
            ///
            ///
            ///
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              GestureDetector(
                  onTap: () => selectvaccine3Day1Picker(context),
                  child: Container(
                      height: height * 0.05,
                      width: width * 0.25,
                      child: Material(
                          borderRadius: BorderRadius.circular(12.0),
                          color: Color(0xFF2877ed),
                          elevation: 0.0,
                          child: Center(
                            child: Text(
                                vaccine3Day1dateTime.day.toString() +
                                    '/' +
                                    vaccine3Day1dateTime.month.toString() +
                                    '/' +
                                    vaccine3Day1dateTime.year.toString(),
                                style: GoogleFonts.comfortaa(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 15.0)),
                          )))),
              SizedBox(
                width: width * 0.01,
              ),
              Flexible(
                child: TextFormField(
                    controller: _vaccine3Day1availity,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.blue[80],
                      hintText: "vacccine3 Day1 Available",
                      hintStyle: GoogleFonts.raleway(),
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
                      this.day1vacine3 = value;
                    },
                    validator: (value) {
                      if (value.isEmpty) {
                        return "please enter day1 available Minimum Vaccine2 ";
                      } else {
                        return null;
                      }
                    }),
              ),
            ]),

            ///
            ///
            ///
            ///
            ///
            SizedBox(
              height: height * 0.01,
            ),

            ///
            ///
            ///
            ///
            ///
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              GestureDetector(
                  onTap: () => selectvaccine3Day2Picker(context),
                  child: Container(
                      height: height * 0.05,
                      width: width * 0.25,
                      child: Material(
                          borderRadius: BorderRadius.circular(12.0),
                          color: Color(0xFF2877ed),
                          elevation: 0.0,
                          child: Center(
                            child: Text(
                                vaccine3Day2dateTime.day.toString() +
                                    '/' +
                                    vaccine3Day2dateTime.month.toString() +
                                    '/' +
                                    vaccine3Day2dateTime.year.toString(),
                                style: GoogleFonts.comfortaa(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 15.0)),
                          )))),
              SizedBox(
                width: width * 0.01,
              ),
              Flexible(
                child: TextFormField(
                    controller: _vaccine3Day2availity,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.blue[80],
                      hintText: "vacccine3 Day2 Available",
                      hintStyle: GoogleFonts.raleway(),
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
                      this.day2vacine3 = value;
                    },
                    validator: (value) {
                      if (value.isEmpty) {
                        return "please enter day2 available Minimum Vaccine ";
                      } else {
                        return null;
                      }
                    }),
              ),
            ]),

            ///
            ///
            ///
            ///
            ///
            SizedBox(
              height: height * 0.01,
            ),

            ///
            ///
            ///
            ///
            ///
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              GestureDetector(
                  onTap: () => selectvaccine3Day3Picker(context),
                  child: Container(
                      height: height * 0.05,
                      width: width * 0.25,
                      child: Material(
                          borderRadius: BorderRadius.circular(12.0),
                          color: Color(0xFF2877ed),
                          elevation: 0.0,
                          child: Center(
                            child: Text(
                                vaccine3Day3dateTime.day.toString() +
                                    '/' +
                                    vaccine3Day3dateTime.month.toString() +
                                    '/' +
                                    vaccine3Day3dateTime.year.toString(),
                                style: GoogleFonts.comfortaa(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 15.0)),
                          )))),
              SizedBox(
                width: width * 0.01,
              ),
              Flexible(
                child: TextFormField(
                    controller: _vaccine3Day3availity,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.blue[80],
                      hintText: "vacccine3 Day3 Available",
                      hintStyle: GoogleFonts.raleway(),
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
                      this.day3vacine3 = value;
                    },
                    validator: (value) {
                      if (value.isEmpty) {
                        return "please enter day3 available Minimum Vaccine ";
                      } else {
                        return null;
                      }
                    }),
              ),
            ]),

            ///
            ///
            ///
            ///
            ///
            ///
            SizedBox(
              height: height * 0.01,
            ),

            ///
            ///
            ///
            ///
            ///
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              GestureDetector(
                  onTap: () => selectvaccine3Day4Picker(context),
                  child: Container(
                      height: height * 0.05,
                      width: width * 0.25,
                      child: Material(
                          borderRadius: BorderRadius.circular(12.0),
                          color: Color(0xFF2877ed),
                          elevation: 0.0,
                          child: Center(
                            child: Text(
                                vaccine3Day4dateTime.day.toString() +
                                    '/' +
                                    vaccine3Day4dateTime.month.toString() +
                                    '/' +
                                    vaccine3Day4dateTime.year.toString(),
                                style: GoogleFonts.comfortaa(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 15.0)),
                          )))),
              SizedBox(
                width: width * 0.01,
              ),
              Flexible(
                child: TextFormField(
                    controller: _vaccine3Day4availity,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.blue[80],
                      hintText: "vacccine3 Day4 Available",
                      hintStyle: GoogleFonts.raleway(),
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
                      this.day4vacine3 = value;
                    },
                    validator: (value) {
                      if (value.isEmpty) {
                        return "please enter day4 available Minimum Vaccine ";
                      } else {
                        return null;
                      }
                    }),
              ),
            ]),

            ///
            ///
            ///
            ///
            ///
            SizedBox(
              height: height * 0.01,
            ),

            ///
            ///
            ///
            ///
            ///
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              GestureDetector(
                  onTap: () => selectvaccine3Day5Picker(context),
                  child: Container(
                      height: height * 0.05,
                      width: width * 0.25,
                      child: Material(
                          borderRadius: BorderRadius.circular(12.0),
                          color: Color(0xFF2877ed),
                          elevation: 0.0,
                          child: Center(
                            child: Text(
                                vaccine3Day5dateTime.day.toString() +
                                    '/' +
                                    vaccine3Day5dateTime.month.toString() +
                                    '/' +
                                    vaccine3Day5dateTime.year.toString(),
                                style: GoogleFonts.comfortaa(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 15.0)),
                          )))),
              SizedBox(
                width: width * 0.01,
              ),
              Flexible(
                child: TextFormField(
                    controller: _vaccine3Day5availity,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.blue[80],
                      hintText: "vacccine3 Day5 Available",
                      hintStyle: GoogleFonts.raleway(),
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
                      this.day5vacine3 = value;
                    },
                    validator: (value) {
                      if (value.isEmpty) {
                        return "please enter day5 available Minimum Vaccine ";
                      } else {
                        return null;
                      }
                    }),
              ),
            ]),
////
            ///
            ///
            ///
            ///
            ///
            ///
            ///
            ///
            ///
            ///
            ///
            ///
            ///
            ///
            ///
            ///
            SizedBox(
              height: height * .01,
            ),
            ////
            ///
            ///
            ///
            ///
            ///
            TextFormField(
                controller: _minimun_price_of_vacination,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.blue[80],
                  hintText: " Minimum Vaccine price (under 50 rs)",
                  hintStyle: GoogleFonts.raleway(),
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
                  this.priceOfvacine = value;
                },
                validator: (value) {
                  if (value.isEmpty) {
                    return "please enter Minimum Vaccine Price";
                  } else {
                    return null;
                  }
                }),
            SizedBox(
              height: 15.0,
            ),
            Text("Blood Bank Groups",
                style: GoogleFonts.raleway(
                  fontSize: 20.0,
                )).p1(),
            SizedBox(
              height: 10.0,
            ),
            Container(
                child: HStack(
              [
                __blood1Choice("O+"),
                __blood2Choice("O-"),
                __blood3Choice("AB"),
                __blood4Choice("AB-"),
                __blood5Choice("A+"),
                __blood6Choice("B+"),
                __blood7Choice("A-"),
                __blood8Choice("B-"),
              ],
            ).scrollHorizontal()),
            SizedBox(
              height: 15.0,
            ),
            TextFormField(
                controller: _minimun_price_of_bloodbankServices,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.blue[80],
                  hintText: " Minimum BloodBank service price (under 50 rs)",
                  hintStyle: GoogleFonts.raleway(),
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
                  this.bloodbank = value;
                },
                validator: (value) {
                  if (value.isEmpty) {
                    return "please enter Minimum bloodBank Service Price";
                  } else {
                    return null;
                  }
                }),
            SizedBox(
              height: 15.0,
            ),
            TextFormField(
                controller: _minimun_price_of_oxygenServices,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.blue[80],
                  hintText: " Minimum Oxygen Services price (under 50 rs)",
                  hintStyle: GoogleFonts.raleway(),
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
                  this.oxygen = value;
                },
                validator: (value) {
                  if (value.isEmpty) {
                    return "please enter Minimum Oxygen Price";
                  } else {
                    return null;
                  }
                }),
            SizedBox(
              height: 15.0,
            ),
            TextFormField(
                style: GoogleFonts.raleway(),
                controller: _organizationAddress,
                decoration: InputDecoration(
                  labelText: "Organization Address",
                  labelStyle:
                      GoogleFonts.raleway(fontSize: 16.0, color: Colors.white),
                ),
                onChanged: (value) {
                  this.address = value;
                },
                validator: (value) {
                  if (value.isEmpty) {
                    return "please enter Address";
                  }
                  return null;
                }),
            SizedBox(
              height: 15.0,
            ),
            TextFormField(
                style: GoogleFonts.raleway(),
                controller: _organizationcity,
                decoration: InputDecoration(
                  labelText: "Organization City",
                  labelStyle:
                      GoogleFonts.raleway(fontSize: 16.0, color: Colors.white),
                ),
                onChanged: (value) {
                  this.city = value;
                },
                validator: (value) {
                  if (value.isEmpty) {
                    return "please enter City Name";
                  }
                  return null;
                }),
            SizedBox(
              height: 15.0,
            ),
            TextFormField(
                style: GoogleFonts.raleway(),
                controller: _organizationDistrict,
                decoration: InputDecoration(
                  labelText: "Organization District",
                  labelStyle:
                      GoogleFonts.raleway(fontSize: 16.0, color: Colors.white),
                ),
                onChanged: (value) {
                  this.district = value;
                },
                validator: (value) {
                  if (value.isEmpty) {
                    return "please enter District Name";
                  }
                  return null;
                }),
            SizedBox(
              height: 15.0,
            ),
            TextFormField(
                style: GoogleFonts.raleway(),
                controller: _organizationAddresspin,
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  labelText: "Pin Number",
                  labelStyle:
                      GoogleFonts.raleway(fontSize: 16.0, color: Colors.white),
                ),
                onChanged: (value) {
                  this.pin = value;
                },
                validator: (value) {
                  if (value.isEmpty) {
                    return "please enter Pin Number";
                  }
                  return null;
                }),
            SizedBox(
              height: 15.0,
            ),
            TextFormField(
                style: GoogleFonts.raleway(),
                controller: _organizationcontact,
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  labelText: "Organization Contact Number",
                  labelStyle:
                      GoogleFonts.raleway(fontSize: 16.0, color: Colors.white),
                ),
                onChanged: (value) {
                  this.contact = value;
                },
                validator: (value) {
                  if (value.isEmpty) {
                    return "please enter Contact Number";
                  }
                  return null;
                }),
            SizedBox(
              height: 15.0,
            ),
            TextFormField(
                controller: _phoneNumber_of_ambulance,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.blue[80],
                  hintText: " Enter Amubulance Emergency Number",
                  hintStyle: GoogleFonts.raleway(),
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
                  this.ambulenceNumber = value;
                },
                validator: (value) {
                  if (value.isEmpty) {
                    return "please enter Minimum Appointment Price";
                  } else {
                    return null;
                  }
                }),
            SizedBox(
              height: 15.0,
            ),
            TextFormField(
                controller: _organizationemail,
                decoration: InputDecoration(
                  labelText: 'EMAIL',
                  labelStyle:
                      GoogleFonts.raleway(fontSize: 16.0, color: Colors.white),
                ),
                onChanged: (value) {
                  this.email = value;
                },
                validator: (value) =>
                    value.isEmpty ? 'Email is required' : validateEmail(value)),
            SizedBox(
              height: 15.0,
            ),
            GestureDetector(
              onTap: () {
                if (checkFields()) upload_data();
              },
              child: Container(
                  height: height * 0.06,
                  width: width * 0.20,
                  child: Material(
                      borderRadius: BorderRadius.circular(25.0),
                      color: Color(0xFF2877ed),
                      elevation: 0.0,
                      child: Center(
                          child: Text('Add',
                              style: GoogleFonts.raleway(
                                  color: Colors.white, fontSize: 18.0))))),
            ).centered(),
          ]).scrollVertical(),
        ),
      ).p(8.0),
    );
  }

  __blood1Choice(String name) {
    return Container(
      padding: const EdgeInsets.all(2.0),
      child: ChoiceChip(
        label: Text(name),
        labelStyle: GoogleFonts.raleway(
            color: Colors.black, fontSize: 14.0, fontWeight: FontWeight.bold),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        backgroundColor: Color(0xffededed),
        selectedColor: Color(0xff9ee892),
        selected: blood1Choice == name,
        onSelected: (bool val) {
          setState(() {
            if (val) {
              blood1Choice = name;
              print(blood1Choice);
            } else
              blood1Choice = "O+ (not available)";
            print(blood1Choice);
          });
        },
      ),
    );
  }

  __blood2Choice(String name) {
    return Container(
      padding: const EdgeInsets.all(2.0),
      child: ChoiceChip(
        label: Text(name),
        labelStyle: GoogleFonts.raleway(
            color: Colors.black, fontSize: 14.0, fontWeight: FontWeight.bold),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        backgroundColor: Color(0xffededed),
        selectedColor: Color(0xff9ee892),
        selected: blood2Choice == name,
        onSelected: (bool val) {
          setState(() {
            if (val) {
              blood2Choice = name;
              print(blood2Choice);
            } else
              blood2Choice = "O- (not available)";
            print(blood2Choice);
          });
        },
      ),
    );
  }

  __blood3Choice(String name) {
    return Container(
      padding: const EdgeInsets.all(2.0),
      child: ChoiceChip(
        label: Text(name),
        labelStyle: GoogleFonts.raleway(
            color: Colors.black, fontSize: 14.0, fontWeight: FontWeight.bold),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        backgroundColor: Color(0xffededed),
        selectedColor: Color(0xff9ee892),
        selected: blood3Choice == name,
        onSelected: (bool val) {
          setState(() {
            if (val) {
              blood3Choice = name;
              print(blood3Choice);
            } else
              blood3Choice = "AB (not available)";
            print(blood3Choice);
          });
        },
      ),
    );
  }

  __blood4Choice(String name) {
    return Container(
      padding: const EdgeInsets.all(2.0),
      child: ChoiceChip(
        label: Text(name),
        labelStyle: GoogleFonts.raleway(
            color: Colors.black, fontSize: 14.0, fontWeight: FontWeight.bold),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        backgroundColor: Color(0xffededed),
        selectedColor: Color(0xff9ee892),
        selected: blood4Choice == name,
        onSelected: (bool val) {
          setState(() {
            if (val) {
              blood4Choice = name;
              print(blood4Choice);
            } else
              blood4Choice = "AB-(not available)";
            print(blood4Choice);
          });
        },
      ),
    );
  }

  __blood5Choice(String name) {
    return Container(
      padding: const EdgeInsets.all(2.0),
      child: ChoiceChip(
        label: Text(name),
        labelStyle: GoogleFonts.raleway(
            color: Colors.black, fontSize: 14.0, fontWeight: FontWeight.bold),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        backgroundColor: Color(0xffededed),
        selectedColor: Color(0xff9ee892),
        selected: blood5Choice == name,
        onSelected: (bool val) {
          setState(() {
            if (val) {
              blood5Choice = name;
              print(blood5Choice);
            } else
              blood5Choice = "A+(not available)";
            print(blood5Choice);
          });
        },
      ),
    );
  }

  __blood6Choice(String name) {
    return Container(
      padding: const EdgeInsets.all(2.0),
      child: ChoiceChip(
        label: Text(name),
        labelStyle: GoogleFonts.raleway(
            color: Colors.black, fontSize: 14.0, fontWeight: FontWeight.bold),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        backgroundColor: Color(0xffededed),
        selectedColor: Color(0xff9ee892),
        selected: blood6Choice == name,
        onSelected: (bool val) {
          setState(() {
            if (val) {
              blood6Choice = name;
              print(blood6Choice);
            } else
              blood6Choice = "B(not available)";
            print(blood6Choice);
          });
        },
      ),
    );
  }

  __blood7Choice(String name) {
    return Container(
      padding: const EdgeInsets.all(2.0),
      child: ChoiceChip(
        label: Text(name),
        labelStyle: GoogleFonts.raleway(
            color: Colors.black, fontSize: 14.0, fontWeight: FontWeight.bold),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        backgroundColor: Color(0xffededed),
        selectedColor: Color(0xff9ee892),
        selected: blood7Choice == name,
        onSelected: (bool val) {
          setState(() {
            if (val) {
              blood7Choice = name;
              print(blood7Choice);
            } else
              blood7Choice = "A-(not available)";
            print(blood7Choice);
          });
        },
      ),
    );
  }

  __blood8Choice(String name) {
    return Container(
      padding: const EdgeInsets.all(2.0),
      child: ChoiceChip(
        label: Text(name),
        labelStyle: GoogleFonts.raleway(
            color: Colors.black, fontSize: 14.0, fontWeight: FontWeight.bold),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        backgroundColor: Color(0xffededed),
        selectedColor: Color(0xff9ee892),
        selected: blood8Choice == name,
        onSelected: (bool val) {
          setState(() {
            if (val) {
              blood8Choice = name;
              print(blood8Choice);
            } else
              blood8Choice = "B-(not available)";
            print(blood8Choice);
          });
        },
      ),
    );
  }

  //////dotor Time period//////
  ///
  ///
  ///
  ///
  ///
  ///
  ///
  ///
  ///
  ///
  _doctor1day1schedule(String time) {
    return Container(
      padding: const EdgeInsets.all(2.0),
      child: ChoiceChip(
        label: Text(time),
        labelStyle: GoogleFonts.notoSans(
            color: Colors.black, fontSize: 14.0, fontWeight: FontWeight.bold),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        backgroundColor: Color(0xffededed),
        selectedColor: Color(0xff9ee892),
        selected: doctor1day1schedule == time,
        onSelected: (bool val) {
          setState(() {
            doctor1day1schedule = time;
            print("doc1Day1time " + doctor1day1schedule);
          });
        },
      ),
    );
  }

  _doctor1day2schedule(String time) {
    return Container(
      padding: const EdgeInsets.all(2.0),
      child: ChoiceChip(
        label: Text(time),
        labelStyle: GoogleFonts.notoSans(
            color: Colors.black, fontSize: 14.0, fontWeight: FontWeight.bold),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        backgroundColor: Color(0xffededed),
        selectedColor: Color(0xff9ee892),
        selected: doctor1day2schedule == time,
        onSelected: (bool val) {
          setState(() {
            doctor1day2schedule = time;
            print("doc1Day2time " + doctor1day2schedule);
          });
        },
      ),
    );
  }

  _doctor1day3schedule(String time) {
    return Container(
      padding: const EdgeInsets.all(2.0),
      child: ChoiceChip(
        label: Text(time),
        labelStyle: GoogleFonts.notoSans(
            color: Colors.black, fontSize: 14.0, fontWeight: FontWeight.bold),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        backgroundColor: Color(0xffededed),
        selectedColor: Color(0xff9ee892),
        selected: doctor1day3schedule == time,
        onSelected: (bool val) {
          setState(() {
            doctor1day3schedule = time;
            print("doc1Day3time " + doctor1day3schedule);
          });
        },
      ),
    );
  }

  //////
  ///
  ///
  ///
  ///
  ///
  ///
  _doctor2day1schedule(String time) {
    return Container(
      padding: const EdgeInsets.all(2.0),
      child: ChoiceChip(
        label: Text(time),
        labelStyle: GoogleFonts.notoSans(
            color: Colors.black, fontSize: 14.0, fontWeight: FontWeight.bold),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        backgroundColor: Color(0xffededed),
        selectedColor: Color(0xff9ee892),
        selected: doctor2day1schedule == time,
        onSelected: (bool val) {
          setState(() {
            doctor2day1schedule = time;
            print("doc2Day1time " + doctor2day1schedule);
          });
        },
      ),
    );
  }

  _doctor2day2schedule(String time) {
    return Container(
      padding: const EdgeInsets.all(2.0),
      child: ChoiceChip(
        label: Text(time),
        labelStyle: GoogleFonts.notoSans(
            color: Colors.black, fontSize: 14.0, fontWeight: FontWeight.bold),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        backgroundColor: Color(0xffededed),
        selectedColor: Color(0xff9ee892),
        selected: doctor2day2schedule == time,
        onSelected: (bool val) {
          setState(() {
            doctor2day2schedule = time;
            print("doc2Day2time " + doctor2day2schedule);
          });
        },
      ),
    );
  }

  _doctor2day3schedule(String time) {
    return Container(
      padding: const EdgeInsets.all(2.0),
      child: ChoiceChip(
        label: Text(time),
        labelStyle: GoogleFonts.notoSans(
            color: Colors.black, fontSize: 14.0, fontWeight: FontWeight.bold),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        backgroundColor: Color(0xffededed),
        selectedColor: Color(0xff9ee892),
        selected: doctor2day3schedule == time,
        onSelected: (bool val) {
          setState(() {
            doctor2day3schedule = time;
            print("doc2Day3time " + doctor2day3schedule);
          });
        },
      ),
    );
  }

  ///
  ///
  ///
  ///
  ///
  ///
  ///
  ///
  ///
  _doctor3day1schedule(String time) {
    return Container(
      padding: const EdgeInsets.all(2.0),
      child: ChoiceChip(
        label: Text(time),
        labelStyle: GoogleFonts.notoSans(
            color: Colors.black, fontSize: 14.0, fontWeight: FontWeight.bold),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        backgroundColor: Color(0xffededed),
        selectedColor: Color(0xff9ee892),
        selected: doctor3day1schedule == time,
        onSelected: (bool val) {
          setState(() {
            doctor3day1schedule = time;
            print("doc3Day1time " + doctor3day1schedule);
          });
        },
      ),
    );
  }

  _doctor3day2schedule(String time) {
    return Container(
      padding: const EdgeInsets.all(2.0),
      child: ChoiceChip(
        label: Text(time),
        labelStyle: GoogleFonts.notoSans(
            color: Colors.black, fontSize: 14.0, fontWeight: FontWeight.bold),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        backgroundColor: Color(0xffededed),
        selectedColor: Color(0xff9ee892),
        selected: doctor3day2schedule == time,
        onSelected: (bool val) {
          setState(() {
            doctor3day2schedule = time;
            print("doc3Day2time " + doctor3day2schedule);
          });
        },
      ),
    );
  }

  _doctor3day3schedule(String time) {
    return Container(
      padding: const EdgeInsets.all(2.0),
      child: ChoiceChip(
        label: Text(time),
        labelStyle: GoogleFonts.notoSans(
            color: Colors.black, fontSize: 14.0, fontWeight: FontWeight.bold),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        backgroundColor: Color(0xffededed),
        selectedColor: Color(0xff9ee892),
        selected: doctor3day3schedule == time,
        onSelected: (bool val) {
          setState(() {
            doctor3day3schedule = time;
            print("doc3Day3time " + doctor3day3schedule);
          });
        },
      ),
    );
  }

  ///
  ///

//////////////////////////////**************************************************////////////////////////////// */
  Future<void> captureImage() async {
    _file = File(await ImagePicker()
        .getImage(source: ImageSource.gallery)
        .then((pickedFile) => pickedFile.path));
  }

  clearFormInfo() {
    setState(() {
      _file = null;
      _organizationName.clear();
      _doctor1Name.clear();
      _doctor2Name.clear();
      _doctor3Name.clear();
      _vaccine1Name.clear();
      _vaccine2Name.clear();
      _vaccine3Name.clear();
    });
  }

  upload_data() async {
    String imageDownURl = await uploadImage();
    updateDetails(imageDownURl);
  }

  Future<String> uploadImage() async {
    final Reference ref = FirebaseStorage.instance.ref().child("Organization");
    UploadTask uploadTask =
        ref.child("organization_$oranizationID.jpg").putFile(_file);
    TaskSnapshot taskSnapshot = await uploadTask;
    imageUrl = await taskSnapshot.ref.getDownloadURL();
    return imageUrl;
  }

  updateDetails(String downloadUrl) {
    final details = FirebaseFirestore.instance.collection("Details");

    details.doc(oranizationID + _organizationName.text.trim()).set({
      "organization": _organizationName.text.trim(),
      "vaccine1": _vaccine1Name.text.trim(),
      "vaccine1day1available": int.parse(_vaccine1Day1availity.text.trim()),
      "vaccine1day1date": vaccine1Day1dateTime,
      "vaccine1day2available": int.parse(_vaccine1Day2availity.text.trim()),
      "vaccine1day2date": vaccine1Day2dateTime,
      "vaccine1day3available": int.parse(_vaccine1Day3availity.text.trim()),
      "vaccine1day3date": vaccine1Day3dateTime,
      "vaccine1day4available": int.parse(_vaccine1Day4availity.text.trim()),
      "vaccine1day4date": vaccine1Day4dateTime,
      "vaccine1day5available": int.parse(_vaccine1Day5availity.text.trim()),
      "vaccine1day5date": vaccine1Day5dateTime,
      "vaccine2": _vaccine2Name.text.trim(),
      "vaccine2day1available": int.parse(_vaccine2Day1availity.text.trim()),
      "vaccine2day1date": vaccine2Day1dateTime,
      "vaccine2day2available": int.parse(_vaccine2Day2availity.text.trim()),
      "vaccine2day2date": vaccine1Day2dateTime,
      "vaccine2day3available": int.parse(_vaccine2Day3availity.text.trim()),
      "vaccine2day3date": vaccine2Day3dateTime,
      "vaccine2day4available": int.parse(_vaccine2Day4availity.text.trim()),
      "vaccine2day4date": vaccine2Day4dateTime,
      "vaccine2day5available": int.parse(_vaccine2Day5availity.text.trim()),
      "vaccine2day5date": vaccine2Day5dateTime,
      "vaccine3": _vaccine3Name.text.trim(),
      "vaccine3day1available": int.parse(_vaccine3Day1availity.text.trim()),
      "vaccine3day1date": vaccine3Day1dateTime,
      "vaccine3day2available": int.parse(_vaccine3Day2availity.text.trim()),
      "vaccine3day2date": vaccine3Day2dateTime,
      "vaccine3day3available": int.parse(_vaccine3Day3availity.text.trim()),
      "vaccine3day3date": vaccine3Day3dateTime,
      "vaccine3day4available": int.parse(_vaccine3Day4availity.text.trim()),
      "vaccine3day4date": vaccine3Day4dateTime,
      "vaccine3day5available": int.parse(_vaccine3Day5availity.text.trim()),
      "vaccine3day5date": vaccine3Day5dateTime,
      "address": _organizationAddress.text.trim(),
      "city": _organizationcity.text.trim(),
      "district": _organizationDistrict.text.trim(),
      "pin_number": int.parse(_organizationAddresspin.text.trim()),
      "contact": int.parse(_organizationcontact.text.trim()),
      "email": _organizationemail.text.trim(),
      "thumbnailUrl": downloadUrl,
      "publishedDate": DateTime.now(),
      "status": "available",
      "blood1Choice": blood1Choice,
      "blood2Choice": blood2Choice,
      "blood3Choice": blood3Choice,
      "blood4Choice": blood4Choice,
      "blood5Choice": blood5Choice,
      "blood6Choice": blood6Choice,
      "blood7Choice": blood7Choice,
      "blood8Choice": blood8Choice,

      ///
      "doctor1": _doctor1Name.text.trim(),
      "doctor1des": _doctor1description.text.trim(),
      "doctor1fees": int.parse(_doctorfees1.text.trim()),

      ///
      "doctor1day1date": doctor1Day1dateTime,
      "doctor1day1view": int.parse(_doctor1Day1view.text.trim()),
      "doctor1day1schedule": doctor1day1schedule,
      "doctor1day2date": doctor1Day2dateTime,
      "doctor1day2view": int.parse(_doctor1Day2view.text.trim()),
      "doctor1day2schedule": doctor1day2schedule,
      "doctor1day3date": doctor1Day3dateTime,
      "doctor1day3view": int.parse(_doctor1Day3view.text.trim()),
      "doctor1day3schedule": doctor1day3schedule,

      ///
      "doctor2": _doctor2Name.text.trim(),
      "doctor2des": _doctor2description.text.trim(),
      "doctor2fees": int.parse(_doctorfees2.text.trim()),

      ///
      "doctor2day1date": doctor2Day1dateTime,
      "doctor2day1view": int.parse(_doctor2Day1view.text.trim()),
      "doctor2day1schedule": doctor2day1schedule,
      "doctor2day2date": doctor2Day2dateTime,
      "doctor2day2view": int.parse(_doctor2Day2view.text.trim()),
      "doctor2day2schedule": doctor2day2schedule,
      "doctor2day3date": doctor2Day3dateTime,
      "doctor2day3view": int.parse(_doctor2Day3view.text.trim()),
      "doctor2day3schedule": doctor2day3schedule,

      ///
      ///
      "doctor3": _doctor3Name.text.trim(),
      "doctor3des": _doctor3description.text.trim(),
      "doctor3fees": int.parse(_doctorfees3.text.trim()),

      ///
      "doctor3day1date": doctor3Day1dateTime,
      "doctor3day1view": int.parse(_doctor3Day1view.text.trim()),
      "doctor3day1schedule": doctor3day1schedule,
      "doctor3day2date": doctor3Day2dateTime,
      "doctor3day2view": int.parse(_doctor3Day2view.text.trim()),
      "doctor3day2schedule": doctor3day2schedule,
      "doctor3day3date": doctor3Day3dateTime,
      "doctor3day3view": int.parse(_doctor3Day3view.text.trim()),
      "doctor3day3schedule": doctor3day3schedule,

      // "doctor2schedule": doctor2schedule,
      // "doctor3schedule": doctor3schedule,
      "minimumAppointprice":
          int.parse(_minimun_price_of_Appointment.text.trim()),
      "minimumvaccineprice":
          int.parse(_minimun_price_of_vacination.text.trim()),
      "minimumbedprice": int.parse(_minimun_price_of_bedBooking.text.trim()),
      "minimumbloodprice":
          int.parse(_minimun_price_of_bloodbankServices.text.trim()),
      "normalbedAvailable": int.parse(_normalBed.text.trim()),
      "emergencybedAvailable": int.parse(_emergencyBed.text.trim()),
      "covidquarantinebed": int.parse(_qurentinebed.text.trim()),
      "minimumoygenprice":
          int.parse(_minimun_price_of_oxygenServices.text.trim()),
      "AmbulanceNumber": int.parse(_phoneNumber_of_ambulance.text.trim()),
      "docnumber": oranizationID,
    }).then((value) {
      return showDialog(
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
                          "Organization Added.........",
                          style: GoogleFonts.comfortaa(),
                        )
                      ]),
                ));
          });
    }).whenComplete(() => showDialog(
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
                        "Organization Add Successfully !! Congratulation !!!",
                        style: GoogleFonts.comfortaa(color: Colors.black),
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
      oranizationID = DateTime.now().millisecondsSinceEpoch.toString();
      _organizationName.clear();
      _doctor1Name.clear();
      _doctor1description.clear();
      _doctorfees1.clear();
      _doctor2Name.clear();
      _doctor2description.clear();
      _doctorfees2.clear();
      _doctor3Name.clear();
      _doctor3description.clear();
      _doctorfees3.clear();
      _vaccine1Name.clear();
      _vaccine2Name.clear();
      _vaccine3Name.clear();
      _organizationAddress.clear();
      _organizationcity.clear();
      _organizationDistrict.clear();
      _organizationAddresspin.clear();
      _organizationcontact.clear();
      _organizationemail.clear();
      _normalBed.clear();
      _emergencyBed.clear();
      _minimun_price_of_Appointment.clear();
      _minimun_price_of_bedBooking.clear();
      _minimun_price_of_bloodbankServices.clear();
      _minimun_price_of_vacination.clear();
    });
  }
}
