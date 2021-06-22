import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:covidcheck/models/orgServiecs.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_progress_button/flutter_progress_button.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:velocity_x/velocity_x.dart';

class BloodServices extends StatefulWidget {
  OrgModel bloodservice;
  BloodServices({Key key, this.bloodservice}) : super(key: key);

  @override
  _BloodServicesState createState() => _BloodServicesState();
}

class _BloodServicesState extends State<BloodServices> {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blueGrey[700],
        appBar: _buildAppBar(context),
        body: VStack([_buildHeading(context), _buildCoursePanel(context)]));
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
            style: GoogleFonts.raleway(),
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
              style: GoogleFonts.raleway(
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

  upload_data() async {
    String imageDownURl = await uploadImage();
    updateDetails(imageDownURl);
  }

  Future<String> uploadImage() async {
    final Reference ref = FirebaseStorage.instance.ref().child("prescription");
    UploadTask uploadTask =
        ref.child("organization_$bloobankID.jpg").putFile(_file);
    TaskSnapshot taskSnapshot = await uploadTask;
    imageUrl = await taskSnapshot.ref.getDownloadURL();
    return imageUrl;
  }

  updateDetails(String downloadUrl) {
    final details = FirebaseFirestore.instance.collection("bloodbank");

    details.doc(bloobankID).set({
      // "organization": _organizationName.text.trim(),
      // "doctor1": _doctor1Name.text.trim(),
      // "doctor1des": _doctor1description.text.trim(),
      // "doctor1fees": int.parse(_doctorfees1.text.trim()),
      // "doctor2": _doctor2Name.text.trim(),
      // "doctor2des": _doctor2description.text.trim(),
      // "doctor2fees": int.parse(_doctorfees2.text.trim()),
      // "doctor3": _doctor3Name.text.trim(),
      // "doctor3des": _doctor3description.text.trim(),
      // "doctor3fees": int.parse(_doctorfees3.text.trim()),
      // "vaccine1": _vaccine1Name.text.trim(),
      // "vaccine2": _vaccine2Name.text.trim(),
      // "vaccine3": _vaccine3Name.text.trim(),
      // "address": _organizationAddress.text.trim(),
      // "city": _organizationcity.text.trim(),
      // "district": _organizationDistrict.text.trim(),
      // "pin_number": int.parse(_organizationAddresspin.text.trim()),
      // "contact": int.parse(_organizationcontact.text.trim()),
      // "email": _organizationemail.text.trim(),
      // "thumbnailUrl": downloadUrl,
      // "publishedDate": DateTime.now(),
      // "status": "available",
      // "blood1Choice": blood1Choice,
      // "blood2Choice": blood2Choice,
      // "blood3Choice": blood3Choice,
      // "blood4Choice": blood4Choice,
      // "blood5Choice": blood5Choice,
      // "blood6Choice": blood6Choice,
      // "blood7Choice": blood7Choice,
      // "blood8Choice": blood8Choice,
      // "doctor1schedule": doctor1schedule,
      // "doctor2schedule": doctor2schedule,
      // "doctor3schedule": doctor3schedule,
      // "minimumAppointprice":
      //     int.parse(_minimun_price_of_Appointment.text.trim()),
      // "minimumvaccineprice":
      //     int.parse(_minimun_price_of_vacination.text.trim()),
      // "minimumbedprice": int.parse(_minimun_price_of_bedBooking.text.trim()),
      // "minimumbloodprice":
      //     int.parse(_minimun_price_of_bloodbankServices.text.trim()),
      // "normalbedAvailable": int.parse(_normalBed.text.trim()),
      // "emergencybedAvailable": int.parse(_emergencyBed.text.trim()),
      // "minimumoygenprice":
      //     int.parse(_minimun_price_of_oxygenServices.text.trim()),
      // "AmbulanceNumber": int.parse(_phoneNumber_of_ambulance.text.trim())
    });

    setState(() {
      _file = null;
      // oranizationID = DateTime.now().millisecondsSinceEpoch.toString();
      // _organizationName.clear();
      // _doctor1Name.clear();
      // _doctor1description.clear();
      // _doctorfees1.clear();
      // _doctor2Name.clear();
      // _doctor2description.clear();
      // _doctorfees2.clear();
      // _doctor3Name.clear();
      // _doctor3description.clear();
      // _doctorfees3.clear();
      // _vaccine1Name.clear();
      // _vaccine2Name.clear();
      // _vaccine3Name.clear();
      // _organizationAddress.clear();
      // _organizationcity.clear();
      // _organizationDistrict.clear();
      // _organizationAddresspin.clear();
      // _organizationcontact.clear();
      // _organizationemail.clear();
      // _normalBed.clear();
      // _emergencyBed.clear();
      // _minimun_price_of_Appointment.clear();
      // _minimun_price_of_bedBooking.clear();
      // _minimun_price_of_bloodbankServices.clear();
      // _minimun_price_of_vacination.clear();
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
                    style: GoogleFonts.raleway(
                      fontSize: 25,
                      fontWeight: FontWeight.w400,
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
                          hintStyle: GoogleFonts.raleway(),
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
                          hintStyle: GoogleFonts.raleway(),
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
                          hintStyle: GoogleFonts.raleway(),
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
                            style: GoogleFonts.raleway(
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
                            style: GoogleFonts.raleway(
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
                            style: GoogleFonts.raleway(
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
                                          style: GoogleFonts.montserrat(
                                              color: Colors.white,
                                              fontWeight: FontWeight.w600,
                                              fontSize: 15.0)),
                                    )))),
                      ],
                    ),
                    SizedBox(
                      height: height * 0.03,
                    ),
                    ProgressButton(
                      type: ProgressButtonType.Raised,
                      color: Color(0xff101beb),
                      height: height * 0.07,
                      defaultWidget: Text(
                        'Book Appointment',
                        style: GoogleFonts.raleway(
                          fontSize: width * 0.05,
                          fontWeight: FontWeight.w500,
                          letterSpacing: 1,
                          color: Colors.white,
                        ),
                      ),
                      progressWidget: CircularProgressIndicator(
                        valueColor:
                            AlwaysStoppedAnimation<Color>(Colors.orange),
                      ),
                      width: width * 0.9,
                      onPressed: () async {
                        // if (checkFields())
                        //   checkdoctorBookCart(doctorid, context, widget.orgname,
                        //       widget.doctorName, widget.fee.toString());
                      },
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
        labelStyle: GoogleFonts.raleway(
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
        labelStyle: GoogleFonts.raleway(
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
