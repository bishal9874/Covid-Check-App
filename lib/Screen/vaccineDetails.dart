import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:covidcheck/counter/booking_counter.dart';
import 'package:covidcheck/models/orgServiecs.dart';
import 'package:covidcheck/services/ser.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:date_range_picker/date_range_picker.dart' as DateRangePicker;
import 'package:fluttertoast/fluttertoast.dart';

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
  String seasonChoice = "";
  String aadharNumber, name, birthyear;
  DateTime dateTime = DateTime.now();
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

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.vaccine.organization,
          style: GoogleFonts.raleway(fontSize: 18.0, color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: Form(
        key: formKey,
        child: VStack([
          TextFormField(
              controller: _nameController,
              decoration: InputDecoration(
                  labelText: 'Name',
                  labelStyle:
                      GoogleFonts.raleway(fontSize: 18.0, color: Colors.white),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Color(0xffffc107)),
                  )),
              onChanged: (value) {
                this.name = value;
              },
              validator: (value) => value.isEmpty ? 'Name is required' : null),
          TextFormField(
              controller: _aadharNumberController,
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                  labelText: 'Aadhar Number',
                  labelStyle:
                      GoogleFonts.raleway(fontSize: 18.0, color: Colors.white),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Color(0xffffc107)),
                  )),
              onChanged: (value) {
                this.aadharNumber = value;
              },
              validator: (value) {
                if (value.isEmpty) {
                  return "please enter a Aadhar number";
                } else if (value.length != 12) {
                  return "please enter a valid Aadhar number";
                }

                return null;
              }),
          TextFormField(
              controller: _birthyearController,
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                  labelText: 'Birth Year',
                  labelStyle:
                      GoogleFonts.raleway(fontSize: 18.0, color: Colors.white),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Color(0xffffc107)),
                  )),
              onChanged: (value) {
                this.birthyear = value;
              },
              validator: (value) {
                if (value.isEmpty) {
                  return "please enter a Birth Year";
                } else if (value.length != 4) {
                  return "please enter a valid Birth Year";
                }

                return null;
              }),
          SizedBox(
            height: 12.0,
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
          Container(
            child: Wrap(
              spacing: 8.0,
              children: <Widget>[
                __seasonChoice("Morning"),
                __seasonChoice("Afternoon"),
              ],
            ),
          ),
          SizedBox(
            height: height * 0.20,
            child: Container(
              child: HStack([
                Container(
                    height: height * 0.04,
                    width: width * 0.25,
                    child: Material(
                        borderRadius: BorderRadius.circular(5.0),
                        color: Colors.white,
                        elevation: 1.0,
                        child: HStack([
                          Text(
                            dateTime.day.toString(),
                            style: TextStyle(
                                fontSize: 18,
                                color: Colors.black,
                                fontWeight: FontWeight.w600),
                          ),
                          Text("/",
                              style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w600)),
                          Text(
                            dateTime.month.toString(),
                            style: TextStyle(
                                fontSize: 18,
                                color: Colors.black,
                                fontWeight: FontWeight.w600),
                          ),
                          Text("/",
                              style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w600)),
                          Text(
                            dateTime.year.toString(),
                            style: TextStyle(
                                fontSize: 18,
                                color: Colors.black,
                                fontWeight: FontWeight.w600),
                          ),
                        ]).centered())),
                SizedBox(
                  width: width * 0.08,
                ),
                GestureDetector(
                    onTap: () => selectTimePicker(context),
                    child: Text('Select Date',
                        style: GoogleFonts.montserrat(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontSize: 15.0))),
              ]),
            ),
          ),
          GestureDetector(
            onTap: () {
              if (checkFields())
                checkvaccineBookCart(widget.vaccine.organization, context,
                    widget.vaccine.organization);
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
                            style: GoogleFonts.raleway(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                                fontSize: 18.0))))),
          ).centered(),
        ]).p(10.0).scrollVertical(),
      ),
    );
  }

  _buildChoiceList(String name) {
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
        labelStyle: GoogleFonts.raleway(
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

  __seasonChoice(String name) {
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
        ? Fluttertoast.showToast(msg: "Book is Already in Cart")
        : addBookToCart(org, context, orgName);
  }

  addBookToCart(String org, BuildContext context, String oranizationName) {
    List vaccineList = CovidCheckApp.sharedPreferences
        .getStringList(CovidCheckApp.userCartList);
    vaccineList.add(org);

    CovidCheckApp.firestore
        .collection("vaccine")
        .doc(CovidCheckApp.sharedPreferences.getString(CovidCheckApp.userUID))
        .set({
      "vaccineCentre_Name": oranizationName,
      "userUI":
          CovidCheckApp.sharedPreferences.getString(CovidCheckApp.userUID),
      "username":
          CovidCheckApp.sharedPreferences.getString(CovidCheckApp.userName),
      "useremail":
          CovidCheckApp.sharedPreferences.getString(CovidCheckApp.userName),
      "name": _nameController.text.trim(),
      "aadharnumber": _aadharNumberController.text.trim(),
      "birthyear": _birthyearController.text.trim(),
      "vaccineChoice": selectedChoice,
      "underAge": ageselectedChoice,
      "seasonChoice": seasonChoice,
      "dateSelection": dateTime
    });
    CovidCheckApp.firestore
        .collection(CovidCheckApp.collectionUser)
        .doc(CovidCheckApp.sharedPreferences.getString(CovidCheckApp.userUID))
        .update({
      CovidCheckApp.userCartList: vaccineList,
    }).then((value) {
      Fluttertoast.showToast(msg: "Book Added to Cart Successfully");
      CovidCheckApp.sharedPreferences
          .setStringList(CovidCheckApp.userCartList, vaccineList);
      Provider.of<BookItemCounter>(context, listen: false).displayResult();
    });
    setState(() {
      _nameController.clear();
      _birthyearController.clear();
      _aadharNumberController.clear();
    });
  }
}
