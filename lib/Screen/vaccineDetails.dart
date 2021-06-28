import 'package:covidcheck/models/orgServiecs.dart';
import 'package:covidcheck/services/ser.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:velocity_x/velocity_x.dart';
import 'package:date_range_picker/date_range_picker.dart' as DateRangePicker;

class VaccineDetails extends StatefulWidget {
  final OrgModel vaccine;
  final List<String> reportList;
  VaccineDetails({this.vaccine, this.reportList});

  @override
  _VaccineDetailsState createState() => _VaccineDetailsState();
}

class _VaccineDetailsState extends State<VaccineDetails> {
  final formKey = new GlobalKey<FormState>();
  final TextEditingController _nameController = new TextEditingController();
  final TextEditingController _aadharNumberController =
      new TextEditingController();
  final TextEditingController _birthyearController =
      new TextEditingController();
  String selectedChoice = "";
  String ageselectedChoice = "";
  String genderChoice = "";
  String seasonChoice = "";
  String aadharNumber, name, birthyear;
  DateTime dateTime = DateTime.now();
  String vaccinationID = DateTime.now().millisecondsSinceEpoch.toString();

  //
  checkFields() {
    final form = formKey.currentState;
    if (form.validate()) {
      form.save();
      return true;
    }
    return false;
  }

  //Date and time picker
  //
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
          Text("Vaccine Registration",
              style: GoogleFonts.comfortaa(fontSize: 18.0)),
          IconButton(onPressed: () {}, icon: Icon(Icons.more_vert_rounded)),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: _buildAppBar(context),
      body: Form(key: formKey, child: VStack([_buildCoursePanel(context)])),
    );
  }

  _buildChoiceList(String name) {
    return Container(
      padding: const EdgeInsets.all(2.0),
      child: ChoiceChip(
        label: Text(name),
        labelStyle: GoogleFonts.comfortaa(
            color: Colors.black, fontSize: 14.0, fontWeight: FontWeight.bold),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        backgroundColor: Color(0xffededed),
        selectedColor: Color(0xffffc107),
        selected: selectedChoice == name,
        onSelected: (selected) {
          setState(() {
            selectedChoice = name;
            print(selectedChoice);
          });
        },
      ),
    );
  }

  _ageChoiceList(String name) {
    return Container(
      padding: const EdgeInsets.all(2.0),
      child: ChoiceChip(
        label: Text(name),
        labelStyle: GoogleFonts.comfortaa(
            color: Colors.black, fontSize: 14.0, fontWeight: FontWeight.bold),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        backgroundColor: Color(0xffededed),
        selectedColor: Color(0xff03fcca),
        selected: ageselectedChoice == name,
        onSelected: (selected) {
          setState(() {
            ageselectedChoice = name;
            print(ageselectedChoice);
          });
        },
      ),
    );
  }

  //// blood choice
  __seasonChoice(String name) {
    return Container(
      padding: const EdgeInsets.all(2.0),
      child: ChoiceChip(
        label: Text(name),
        labelStyle: GoogleFonts.comfortaa(
            color: Colors.black, fontSize: 14.0, fontWeight: FontWeight.bold),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        backgroundColor: Color(0xffededed),
        selectedColor: Color(0xff9ee892),
        selected: seasonChoice == name,
        onSelected: (selected) {
          setState(() {
            seasonChoice = name;
            print(seasonChoice);
          });
        },
      ),
    );
  }

  void checkvaccineBookCart(String org, BuildContext context, String orgName) {
    CovidCheckApp.sharedPreferences
            .getStringList(CovidCheckApp.userCartList)
            .contains(org)
        ? VxToast.show(
            context,
            msg: "Your Aadharnumber is already registered for Vaccination",
            position: VxToastPosition.bottom,
          )
        : addBookToCart(
            org,
            context,
            orgName,
          );
  }

  addBookToCart(
    String org,
    BuildContext context,
    String oranizationName,
  ) async {
    List vaccineList = CovidCheckApp.sharedPreferences
        .getStringList(CovidCheckApp.userCartList);
    vaccineList.add(org);

    CovidCheckApp.firestore
        .collection(CovidCheckApp.collectionUser)
        .doc(CovidCheckApp.sharedPreferences.getString(CovidCheckApp.userUID))
        .update({
      CovidCheckApp.userCartList: vaccineList,
    }).then((value) {
      VxToast.show(
        context,
        msg: "Your Aadharnumber registered Successfully for Vaccination",
        position: VxToastPosition.bottom,
      );
      CovidCheckApp.sharedPreferences
          .setStringList(CovidCheckApp.userCartList, vaccineList);
      //Provider.of<BookItemCounter>(context, listen: false).displayResult();
    });

    CovidCheckApp.firestore
        .collection(CovidCheckApp.collectionUser)
        .doc(CovidCheckApp.sharedPreferences.getString(CovidCheckApp.userUID))
        .collection(CovidCheckApp.vaccinecollection)
        .doc(CovidCheckApp.sharedPreferences.getString(CovidCheckApp.userUID) +
            _aadharNumberController.text.trim())
        .set({
      "vaccineCentre_Name": oranizationName,
      "userUI":
          CovidCheckApp.sharedPreferences.getString(CovidCheckApp.userUID),
      "username":
          CovidCheckApp.sharedPreferences.getString(CovidCheckApp.userName),
      "useremail":
          CovidCheckApp.sharedPreferences.getString(CovidCheckApp.userEmail),
      "name": _nameController.text.trim(),
      "aadharnumber": int.parse(_aadharNumberController.text.trim()),
      "birthyear": int.parse(_birthyearController.text.trim()),
      "vaccineChoice": selectedChoice,
      "underAge": ageselectedChoice,
      "seasonChoice": seasonChoice,
      "dateSelection": dateTime,
      "genderChoice": genderChoice,
      "publishDate": DateTime.now(),
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
                          "Uploading.........",
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
                            "Vaccine Booking Successfully !! Please Kindly received your registerd Vaccine from Our Hospital/Organization ",
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
    await CovidCheckApp.sharedPreferences
        .setString(CovidCheckApp.vaccineUI, _aadharNumberController.text);
    setState(() {
      _nameController.clear();
      _birthyearController.clear();
      _aadharNumberController.clear();
    });
  }

  _buildCoursePanel(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Expanded(
      child: ClipRRect(
          child: Container(
        color: Colors.blueGrey[800],
        child: VStack([
          SizedBox(
            height: height * 0.05,
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
                    controller: _aadharNumberController,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.blue[80],
                      hintText: " Aadhar number",
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
                      this.aadharNumber = value;
                    },
                    validator: (value) {
                      if (value.isEmpty) {
                        return "please enter your Aadhar number";
                      } else if (value.length != 12) {
                        return "please enter your valid Aadhar number";
                      }
                      return null;
                    }),
                SizedBox(
                  height: height * 0.01,
                ),
                TextFormField(
                    controller: _birthyearController,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.blue[80],
                      hintText: "Birth Year",
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
                      this.birthyear = value;
                    },
                    validator: (value) {
                      if (value.isEmpty) {
                        return "please enter your birth year";
                      } else if (value.length != 4) {
                        return "please enter your valid birth year";
                      }
                      return null;
                    }),
                SizedBox(
                  height: height * 0.01,
                ),
                Container(
                  child: Wrap(
                    spacing: 8.0,
                    children: <Widget>[
                      _buildChoiceList(widget.vaccine.vaccine1),
                      _buildChoiceList(widget.vaccine.vaccine2),
                      _buildChoiceList(widget.vaccine.vaccine3),
                    ],
                  ),
                ),
                SizedBox(
                  height: 15.0,
                ),
                Container(
                  child: Wrap(
                    spacing: 8.0,
                    children: <Widget>[
                      _ageChoiceList("18+"),
                      _ageChoiceList("45+"),
                    ],
                  ),
                ),
                SizedBox(
                  height: 15.0,
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
                    Container(
                      child: Wrap(
                        spacing: 8.0,
                        children: <Widget>[
                          __seasonChoice("Morning"),
                          __seasonChoice("Afternoon"),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: height * 0.03,
                ),
                GestureDetector(
                  onTap: () {
                    if (checkFields())
                      showDialog(
                          context: context,
                          builder: (c) {
                            return AlertDialog(
                              contentPadding: EdgeInsets.all(8.0),
                              content: Container(
                                  height: height * 0.25,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                          "You Just Pay ₹ ${widget.vaccine.minimumvaccineprice} for Vaccination"),
                                      SizedBox(
                                        height: height * 0.05,
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          checkvaccineBookCart(
                                              _aadharNumberController.text
                                                  .trim(),
                                              context,
                                              widget.vaccine.organization);
                                          Navigator.of(context).pop();
                                        },
                                        child: Container(
                                            height: height * 0.06,
                                            width: width * 0.40,
                                            child: Material(
                                                borderRadius:
                                                    BorderRadius.circular(5.0),
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
                                    ],
                                  )),
                            );
                          });
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
}

///// vakin duto dose
