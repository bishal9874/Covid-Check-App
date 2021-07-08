import 'package:covidcheck/models/orgServiecs.dart';
import 'package:covidcheck/models/vaccinationModel.dart';
import 'package:covidcheck/services/ser.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:twilio_flutter/twilio_flutter.dart';

import 'package:velocity_x/velocity_x.dart';
// ignore: unused_import
import 'package:date_range_picker/date_range_picker.dart' as DateRangePicker;

// ignore: must_be_immutable
class VaccineDetails extends StatefulWidget {
  final OrgModel vaccine;
  VaccineModel vaccineModel;
  VaccineDetails({this.vaccine, this.vaccineModel});

  @override
  _VaccineDetailsState createState() => _VaccineDetailsState();
}

class _VaccineDetailsState extends State<VaccineDetails> {
  TwilioFlutter twilioFlutter;
  final formKey = new GlobalKey<FormState>();
  final TextEditingController _nameController = new TextEditingController();
  final TextEditingController _aadharNumberController =
      new TextEditingController();
  final TextEditingController _birthyearController =
      new TextEditingController();
  bool approval = false;
  String selectedChoice = "";
  String ageselectedChoice = "";
  String genderChoice = "";
  String seasonChoice = "";
  String vaccinedatechoice = "";
  int vaccavail;

  String aadharNumber, name, birthyear;
  DateTime dateTime = DateTime.now();
  String vaccinationID = DateTime.now().millisecondsSinceEpoch.toString();
  // @override
  // void initState() {
  //   twilioFlutter = TwilioFlutter(
  //       accountSid: 'ACe23216f98687bf29b23704d4bcf9b0d5',
  //       authToken: '17c74526c6f43fb29ffd52a755032f2e',
  //       twilioNumber: '+19195253688');

  //   super.initState();
  // }

  //
  checkFields() {
    final form = formKey.currentState;
    if (form.validate()) {
      form.save();
      return true;
    }
    return false;
  }

  // void sendSms() async {
  //   twilioFlutter.sendSMS(
  //       toNumber: '+918337000993',
  //       messageBody: '$_nameController Vaccination date $vaccinedatechoice .');
  // }

  // void getSms() async {
  //   var data = await twilioFlutter.getSmsList();
  //   print(data);

  //   await twilioFlutter.getSMS('***************************');
  // }

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
    // var height = MediaQuery.of(context).size.height;
    // var width = MediaQuery.of(context).size.width;
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

  // _vaccine1details() {
  //   return Container(
  //       child: Wrap(
  //     children: [
  //       if (widget.vaccine.vaccine1day1available != 0)
  //         Text(widget.vaccine.vaccine1day1available.toString())
  //       else
  //         Text("out of stock"),
  //     ],
  //   ));
  // }

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

  __vaccine1dateChoice(String name, int availVacc1) {
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
        selected: vaccinedatechoice == name,
        onSelected: (selected) {
          setState(() {
            vaccinedatechoice = name;
            vaccavail = availVacc1;

            print(vaccinedatechoice);
            print(vaccavail);
          });
        },
      ),
    );
  }

  __vaccine2dateChoice(String name, int availVacc2) {
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
        selectedColor: Color(0xfff27f4e),
        selected: vaccinedatechoice == name,
        onSelected: (selected) {
          setState(() {
            vaccinedatechoice = name;
            vaccavail = availVacc2;

            print(vaccinedatechoice);
            print(vaccavail);
          });
        },
      ),
    );
  }

  __vaccine3dateChoice(String name, int availVacc3) {
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
        selectedColor: Color(0xff7c9df7),
        selected: vaccinedatechoice == name,
        onSelected: (selected) {
          setState(() {
            vaccinedatechoice = name;
            vaccavail = availVacc3;

            print(vaccinedatechoice);
            print(vaccavail);
          });
        },
      ),
    );
  }

  void checkvaccineBookCart(
    String docNO,
    String org,
    BuildContext context,
    String orgName,
  ) {
    CovidCheckApp.sharedPreferences
            .getStringList(CovidCheckApp.userCartList)
            .contains(org)
        ? VxToast.show(context,
            msg: "Your Aadharnumber is already registered for Vaccination",
            position: VxToastPosition.bottom,
            bgColor: Colors.red[400],
            textColor: Colors.white)
        : addBookToCart(
            docNO,
            org,
            context,
            orgName,
          );
  }

  addBookToCart(
    String docNo,
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
        .collection("Details")
        .doc(docNo + oranizationName)
        .update({
      if (selectedChoice == widget.vaccine.vaccine1 &&
          vaccavail == widget.vaccine.vaccine1day1available &&
          vaccinedatechoice ==
              widget.vaccine.vaccine1day1date.toDate().day.toString() +
                  "/" +
                  widget.vaccine.vaccine1day1date.toDate().month.toString() +
                  "/" +
                  widget.vaccine.vaccine1day1date.toDate().year.toString())
        "vaccine1day1available": widget.vaccine.vaccine1day1available - 1
      else if (selectedChoice == widget.vaccine.vaccine1 &&
          vaccavail == widget.vaccine.vaccine1day2available &&
          vaccinedatechoice ==
              widget.vaccine.vaccine1day2date.toDate().day.toString() +
                  "/" +
                  widget.vaccine.vaccine1day2date.toDate().month.toString() +
                  "/" +
                  widget.vaccine.vaccine1day2date.toDate().year.toString())
        "vaccine1day2available": widget.vaccine.vaccine1day2available - 1
      else if (selectedChoice == widget.vaccine.vaccine1 &&
          vaccavail == widget.vaccine.vaccine1day3available &&
          vaccinedatechoice ==
              widget.vaccine.vaccine1day3date.toDate().day.toString() +
                  "/" +
                  widget.vaccine.vaccine1day3date.toDate().month.toString() +
                  "/" +
                  widget.vaccine.vaccine1day3date.toDate().year.toString())
        "vaccine1day3available": widget.vaccine.vaccine1day3available - 1
      else if (selectedChoice == widget.vaccine.vaccine1 &&
          vaccavail == widget.vaccine.vaccine1day4available &&
          vaccinedatechoice ==
              widget.vaccine.vaccine1day4date.toDate().day.toString() +
                  "/" +
                  widget.vaccine.vaccine1day4date.toDate().month.toString() +
                  "/" +
                  widget.vaccine.vaccine1day4date.toDate().year.toString())
        "vaccine1day4available": widget.vaccine.vaccine1day4available - 1
      else if (selectedChoice == widget.vaccine.vaccine1 &&
          vaccavail == widget.vaccine.vaccine1day5available &&
          vaccinedatechoice ==
              widget.vaccine.vaccine1day5date.toDate().day.toString() +
                  "/" +
                  widget.vaccine.vaccine1day5date.toDate().month.toString() +
                  "/" +
                  widget.vaccine.vaccine1day5date.toDate().year.toString())
        "vaccine1day5available": widget.vaccine.vaccine1day5available - 1

      ///
      ///
      else if (selectedChoice == widget.vaccine.vaccine2 &&
          vaccavail == widget.vaccine.vaccine2day1available &&
          vaccinedatechoice ==
              widget.vaccine.vaccine2day1date.toDate().day.toString() +
                  "/" +
                  widget.vaccine.vaccine2day1date.toDate().month.toString() +
                  "/" +
                  widget.vaccine.vaccine2day1date.toDate().year.toString())
        "vaccine2day1available": widget.vaccine.vaccine2day1available - 1
      else if (selectedChoice == widget.vaccine.vaccine2 &&
          vaccavail == widget.vaccine.vaccine2day2available &&
          vaccinedatechoice ==
              widget.vaccine.vaccine2day2date.toDate().day.toString() +
                  "/" +
                  widget.vaccine.vaccine2day2date.toDate().month.toString() +
                  "/" +
                  widget.vaccine.vaccine2day2date.toDate().year.toString())
        "vaccine2day2available": widget.vaccine.vaccine2day2available - 1
      else if (selectedChoice == widget.vaccine.vaccine2 &&
          vaccavail == widget.vaccine.vaccine2day3available &&
          vaccinedatechoice ==
              widget.vaccine.vaccine2day3date.toDate().day.toString() +
                  "/" +
                  widget.vaccine.vaccine2day3date.toDate().month.toString() +
                  "/" +
                  widget.vaccine.vaccine2day3date.toDate().year.toString())
        "vaccine2day3available": widget.vaccine.vaccine2day3available - 1
      else if (selectedChoice == widget.vaccine.vaccine2 &&
          vaccavail == widget.vaccine.vaccine2day4available &&
          vaccinedatechoice ==
              widget.vaccine.vaccine2day4date.toDate().day.toString() +
                  "/" +
                  widget.vaccine.vaccine2day4date.toDate().month.toString() +
                  "/" +
                  widget.vaccine.vaccine2day4date.toDate().year.toString())
        "vaccine2day4available": widget.vaccine.vaccine2day4available - 1
      else if (selectedChoice == widget.vaccine.vaccine2 &&
          vaccavail == widget.vaccine.vaccine2day5available &&
          vaccinedatechoice ==
              widget.vaccine.vaccine2day5date.toDate().day.toString() +
                  "/" +
                  widget.vaccine.vaccine2day5date.toDate().month.toString() +
                  "/" +
                  widget.vaccine.vaccine2day5date.toDate().year.toString())
        "vaccine2day5available": widget.vaccine.vaccine2day5available - 1

      ///
      ///
      ///
      else if (selectedChoice == widget.vaccine.vaccine3 &&
          vaccavail == widget.vaccine.vaccine3day1available &&
          vaccinedatechoice ==
              widget.vaccine.vaccine3day1date.toDate().day.toString() +
                  "/" +
                  widget.vaccine.vaccine3day1date.toDate().month.toString() +
                  "/" +
                  widget.vaccine.vaccine3day1date.toDate().year.toString())
        "vaccine3day1available": widget.vaccine.vaccine3day1available - 1
      else if (selectedChoice == widget.vaccine.vaccine3 &&
          vaccavail == widget.vaccine.vaccine3day2available &&
          vaccinedatechoice ==
              widget.vaccine.vaccine3day2date.toDate().day.toString() +
                  "/" +
                  widget.vaccine.vaccine3day2date.toDate().month.toString() +
                  "/" +
                  widget.vaccine.vaccine3day2date.toDate().year.toString())
        "vaccine3day2available": widget.vaccine.vaccine3day2available - 1
      else if (selectedChoice == widget.vaccine.vaccine3 &&
          vaccavail == widget.vaccine.vaccine3day3available &&
          vaccinedatechoice ==
              widget.vaccine.vaccine3day3date.toDate().day.toString() +
                  "/" +
                  widget.vaccine.vaccine3day3date.toDate().month.toString() +
                  "/" +
                  widget.vaccine.vaccine3day3date.toDate().year.toString())
        "vaccine3day3available": widget.vaccine.vaccine3day3available - 1
      else if (selectedChoice == widget.vaccine.vaccine3 &&
          vaccavail == widget.vaccine.vaccine3day4available &&
          vaccinedatechoice ==
              widget.vaccine.vaccine3day4date.toDate().day.toString() +
                  "/" +
                  widget.vaccine.vaccine3day4date.toDate().month.toString() +
                  "/" +
                  widget.vaccine.vaccine3day4date.toDate().year.toString())
        "vaccine3day4available": widget.vaccine.vaccine3day4available - 1
      else if (selectedChoice == widget.vaccine.vaccine3 &&
          vaccavail == widget.vaccine.vaccine3day5available &&
          vaccinedatechoice ==
              widget.vaccine.vaccine3day5date.toDate().day.toString() +
                  "/" +
                  widget.vaccine.vaccine3day5date.toDate().month.toString() +
                  "/" +
                  widget.vaccine.vaccine3day5date.toDate().year.toString())
        "vaccine3day5available": widget.vaccine.vaccine3day5available - 1
    });

    CovidCheckApp.firestore
        .collection("vaccine")
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
      "dateSelection": vaccinedatechoice,
      "nextAvailable": vaccavail,
      "genderChoice": genderChoice,
      "publishDate": DateTime.now(),
      "approval": approval,
      "docnumber": widget.vaccine.docnumber,
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
      "dateSelection": vaccinedatechoice,
      "genderChoice": genderChoice,
      "docnumber": widget.vaccine.docnumber,
      "approval": approval,
      "publishDate": DateTime.now(),
    }).then((value) {
      return showDialog(
          context: context,
          barrierDismissible: false,
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
              Future.delayed(Duration(seconds: 5), () {
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
                Text("Select Vaccine",
                        style: GoogleFonts.comfortaa(
                            fontSize: 15.0, fontWeight: FontWeight.w700))
                    .p1(),
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

                ///
                ///
                ///
                ///
                ///
                if (widget.vaccine.vaccine1 == selectedChoice)
                  VStack([
                    Text("Select Schedule",
                            style: GoogleFonts.comfortaa(
                                fontSize: 13.0, fontWeight: FontWeight.w700))
                        .p1(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        __vaccine1dateChoice(
                            widget.vaccine.vaccine1day1date
                                    .toDate()
                                    .day
                                    .toString() +
                                "/" +
                                widget.vaccine.vaccine1day1date
                                    .toDate()
                                    .month
                                    .toString() +
                                "/" +
                                widget.vaccine.vaccine1day1date
                                    .toDate()
                                    .year
                                    .toString(),
                            widget.vaccine.vaccine1day1available),
                        if (widget.vaccine.vaccine1day1available != 0)
                          Container(
                              height: height * 0.04,
                              width: width * 0.08,
                              decoration: BoxDecoration(
                                  color: Colors.blueGrey,
                                  borderRadius: BorderRadius.circular(5)),
                              child: Text(
                                      widget.vaccine.vaccine1day1available
                                          .toString(),
                                      style: GoogleFonts.comfortaa(
                                          fontWeight: FontWeight.w700,
                                          color: Colors.white))
                                  .centered())
                        else
                          Text("out of stock"),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        __vaccine1dateChoice(
                            widget.vaccine.vaccine1day2date
                                    .toDate()
                                    .day
                                    .toString() +
                                "/" +
                                widget.vaccine.vaccine1day2date
                                    .toDate()
                                    .month
                                    .toString() +
                                "/" +
                                widget.vaccine.vaccine1day2date
                                    .toDate()
                                    .year
                                    .toString(),
                            widget.vaccine.vaccine1day2available),
                        if (widget.vaccine.vaccine1day2available != 0)
                          Container(
                              height: height * 0.04,
                              width: width * 0.08,
                              decoration: BoxDecoration(
                                  color: Colors.blueGrey,
                                  borderRadius: BorderRadius.circular(5)),
                              child: Text(
                                      widget.vaccine.vaccine1day2available
                                          .toString(),
                                      style: GoogleFonts.comfortaa(
                                          fontWeight: FontWeight.w700,
                                          color: Colors.white))
                                  .centered())
                        else
                          Text("out of stock"),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        __vaccine1dateChoice(
                            widget.vaccine.vaccine1day3date
                                    .toDate()
                                    .day
                                    .toString() +
                                "/" +
                                widget.vaccine.vaccine1day3date
                                    .toDate()
                                    .month
                                    .toString() +
                                "/" +
                                widget.vaccine.vaccine1day3date
                                    .toDate()
                                    .year
                                    .toString(),
                            widget.vaccine.vaccine1day3available),
                        if (widget.vaccine.vaccine1day3available != 0)
                          Container(
                              height: height * 0.04,
                              width: width * 0.08,
                              decoration: BoxDecoration(
                                  color: Colors.blueGrey,
                                  borderRadius: BorderRadius.circular(5)),
                              child: Text(
                                      widget.vaccine.vaccine1day3available
                                          .toString(),
                                      style: GoogleFonts.comfortaa(
                                          fontWeight: FontWeight.w700,
                                          color: Colors.white))
                                  .centered())
                        else
                          Text("out of stock"),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        __vaccine1dateChoice(
                            widget.vaccine.vaccine1day4date
                                    .toDate()
                                    .day
                                    .toString() +
                                "/" +
                                widget.vaccine.vaccine1day4date
                                    .toDate()
                                    .month
                                    .toString() +
                                "/" +
                                widget.vaccine.vaccine1day4date
                                    .toDate()
                                    .year
                                    .toString(),
                            widget.vaccine.vaccine1day4available),
                        if (widget.vaccine.vaccine1day4available != 0)
                          Container(
                              height: height * 0.04,
                              width: width * 0.08,
                              decoration: BoxDecoration(
                                  color: Colors.blueGrey,
                                  borderRadius: BorderRadius.circular(5)),
                              child: Text(
                                      widget.vaccine.vaccine1day4available
                                          .toString(),
                                      style: GoogleFonts.comfortaa(
                                          fontWeight: FontWeight.w700,
                                          color: Colors.white))
                                  .centered())
                        else
                          Text("out of stock"),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        __vaccine1dateChoice(
                            widget.vaccine.vaccine1day5date
                                    .toDate()
                                    .day
                                    .toString() +
                                "/" +
                                widget.vaccine.vaccine1day5date
                                    .toDate()
                                    .month
                                    .toString() +
                                "/" +
                                widget.vaccine.vaccine1day5date
                                    .toDate()
                                    .year
                                    .toString(),
                            widget.vaccine.vaccine1day5available),
                        if (widget.vaccine.vaccine1day5available != 0)
                          Container(
                              height: height * 0.04,
                              width: width * 0.08,
                              decoration: BoxDecoration(
                                  color: Colors.blueGrey,
                                  borderRadius: BorderRadius.circular(5)),
                              child: Text(
                                      widget.vaccine.vaccine1day5available
                                          .toString(),
                                      style: GoogleFonts.comfortaa(
                                          fontWeight: FontWeight.w700,
                                          color: Colors.white))
                                  .centered())
                        else
                          Text("out of stock"),
                      ],
                    ),
                  ]),

                ///
                ///
                ///
                ///
                if (widget.vaccine.vaccine2 == selectedChoice)
                  VStack([
                    Text("Select Schedule",
                            style: GoogleFonts.comfortaa(
                                fontSize: 15.0, fontWeight: FontWeight.w700))
                        .p1(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        __vaccine2dateChoice(
                            widget.vaccine.vaccine2day1date
                                    .toDate()
                                    .day
                                    .toString() +
                                "/" +
                                widget.vaccine.vaccine2day1date
                                    .toDate()
                                    .month
                                    .toString() +
                                "/" +
                                widget.vaccine.vaccine2day1date
                                    .toDate()
                                    .year
                                    .toString(),
                            widget.vaccine.vaccine2day1available),
                        if (widget.vaccine.vaccine2day1available != 0)
                          Container(
                              height: height * 0.04,
                              width: width * 0.08,
                              decoration: BoxDecoration(
                                  color: Colors.blueGrey,
                                  borderRadius: BorderRadius.circular(5)),
                              child: Text(
                                      widget.vaccine.vaccine2day1available
                                          .toString(),
                                      style: GoogleFonts.comfortaa(
                                          fontWeight: FontWeight.w700,
                                          color: Colors.white))
                                  .centered())
                        else
                          Text("out of stock"),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        __vaccine2dateChoice(
                            widget.vaccine.vaccine2day2date
                                    .toDate()
                                    .day
                                    .toString() +
                                "/" +
                                widget.vaccine.vaccine2day2date
                                    .toDate()
                                    .month
                                    .toString() +
                                "/" +
                                widget.vaccine.vaccine2day2date
                                    .toDate()
                                    .year
                                    .toString(),
                            widget.vaccine.vaccine2day2available),
                        if (widget.vaccine.vaccine2day2available != 0)
                          Container(
                              height: height * 0.04,
                              width: width * 0.08,
                              decoration: BoxDecoration(
                                  color: Colors.blueGrey,
                                  borderRadius: BorderRadius.circular(5)),
                              child: Text(
                                      widget.vaccine.vaccine2day2available
                                          .toString(),
                                      style: GoogleFonts.comfortaa(
                                          fontWeight: FontWeight.w700,
                                          color: Colors.white))
                                  .centered())
                        else
                          Text("out of stock"),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        __vaccine2dateChoice(
                            widget.vaccine.vaccine2day3date
                                    .toDate()
                                    .day
                                    .toString() +
                                "/" +
                                widget.vaccine.vaccine2day3date
                                    .toDate()
                                    .month
                                    .toString() +
                                "/" +
                                widget.vaccine.vaccine2day3date
                                    .toDate()
                                    .year
                                    .toString(),
                            widget.vaccine.vaccine2day3available),
                        if (widget.vaccine.vaccine2day3available != 0)
                          Container(
                              height: height * 0.04,
                              width: width * 0.08,
                              decoration: BoxDecoration(
                                  color: Colors.blueGrey,
                                  borderRadius: BorderRadius.circular(5)),
                              child: Text(
                                      widget.vaccine.vaccine2day3available
                                          .toString(),
                                      style: GoogleFonts.comfortaa(
                                          fontWeight: FontWeight.w700,
                                          color: Colors.white))
                                  .centered())
                        else
                          Text("out of stock"),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        __vaccine2dateChoice(
                            widget.vaccine.vaccine2day4date
                                    .toDate()
                                    .day
                                    .toString() +
                                "/" +
                                widget.vaccine.vaccine2day4date
                                    .toDate()
                                    .month
                                    .toString() +
                                "/" +
                                widget.vaccine.vaccine2day4date
                                    .toDate()
                                    .year
                                    .toString(),
                            widget.vaccine.vaccine2day4available),
                        if (widget.vaccine.vaccine2day4available != 0)
                          Container(
                              height: height * 0.04,
                              width: width * 0.08,
                              decoration: BoxDecoration(
                                  color: Colors.blueGrey,
                                  borderRadius: BorderRadius.circular(5)),
                              child: Text(
                                      widget.vaccine.vaccine2day4available
                                          .toString(),
                                      style: GoogleFonts.comfortaa(
                                          fontWeight: FontWeight.w700,
                                          color: Colors.white))
                                  .centered())
                        else
                          Text("out of stock"),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        __vaccine2dateChoice(
                            widget.vaccine.vaccine2day5date
                                    .toDate()
                                    .day
                                    .toString() +
                                "/" +
                                widget.vaccine.vaccine2day5date
                                    .toDate()
                                    .month
                                    .toString() +
                                "/" +
                                widget.vaccine.vaccine2day5date
                                    .toDate()
                                    .year
                                    .toString(),
                            widget.vaccine.vaccine2day5available),
                        if (widget.vaccine.vaccine2day5available != 0)
                          Container(
                              height: height * 0.04,
                              width: width * 0.08,
                              decoration: BoxDecoration(
                                  color: Colors.blueGrey,
                                  borderRadius: BorderRadius.circular(5)),
                              child: Text(
                                      widget.vaccine.vaccine2day5available
                                          .toString(),
                                      style: GoogleFonts.comfortaa(
                                          fontWeight: FontWeight.w700,
                                          color: Colors.white))
                                  .centered())
                        else
                          Text("out of stock"),
                      ],
                    ),
                  ]),

                ///
                ///
                ///
                ///
                ///
                ///
                if (widget.vaccine.vaccine3 == selectedChoice)
                  VStack([
                    Text("Select Schedule",
                            style: GoogleFonts.comfortaa(
                                fontSize: 15.0, fontWeight: FontWeight.w700))
                        .p1(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        __vaccine3dateChoice(
                            widget.vaccine.vaccine3day1date
                                    .toDate()
                                    .day
                                    .toString() +
                                "/" +
                                widget.vaccine.vaccine3day1date
                                    .toDate()
                                    .month
                                    .toString() +
                                "/" +
                                widget.vaccine.vaccine3day1date
                                    .toDate()
                                    .year
                                    .toString(),
                            widget.vaccine.vaccine3day1available),
                        if (widget.vaccine.vaccine3day1available != 0)
                          Container(
                              height: height * 0.04,
                              width: width * 0.08,
                              decoration: BoxDecoration(
                                  color: Colors.blueGrey,
                                  borderRadius: BorderRadius.circular(5)),
                              child: Text(
                                      widget.vaccine.vaccine3day1available
                                          .toString(),
                                      style: GoogleFonts.comfortaa(
                                          fontWeight: FontWeight.w700,
                                          color: Colors.white))
                                  .centered())
                        else
                          Text("out of stock"),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        __vaccine3dateChoice(
                            widget.vaccine.vaccine3day2date
                                    .toDate()
                                    .day
                                    .toString() +
                                "/" +
                                widget.vaccine.vaccine3day2date
                                    .toDate()
                                    .month
                                    .toString() +
                                "/" +
                                widget.vaccine.vaccine3day2date
                                    .toDate()
                                    .year
                                    .toString(),
                            widget.vaccine.vaccine3day2available),
                        if (widget.vaccine.vaccine3day2available != 0)
                          Container(
                              height: height * 0.04,
                              width: width * 0.08,
                              decoration: BoxDecoration(
                                  color: Colors.blueGrey,
                                  borderRadius: BorderRadius.circular(5)),
                              child: Text(
                                      widget.vaccine.vaccine3day2available
                                          .toString(),
                                      style: GoogleFonts.comfortaa(
                                          fontWeight: FontWeight.w700,
                                          color: Colors.white))
                                  .centered())
                        else
                          Text("out of stock"),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        __vaccine3dateChoice(
                            widget.vaccine.vaccine3day3date
                                    .toDate()
                                    .day
                                    .toString() +
                                "/" +
                                widget.vaccine.vaccine3day3date
                                    .toDate()
                                    .month
                                    .toString() +
                                "/" +
                                widget.vaccine.vaccine3day3date
                                    .toDate()
                                    .year
                                    .toString(),
                            widget.vaccine.vaccine3day3available),
                        if (widget.vaccine.vaccine3day3available != 0)
                          Container(
                              height: height * 0.04,
                              width: width * 0.08,
                              decoration: BoxDecoration(
                                  color: Colors.blueGrey,
                                  borderRadius: BorderRadius.circular(5)),
                              child: Text(
                                      widget.vaccine.vaccine3day3available
                                          .toString(),
                                      style: GoogleFonts.comfortaa(
                                          fontWeight: FontWeight.w700,
                                          color: Colors.white))
                                  .centered())
                        else
                          Text("out of stock"),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        __vaccine3dateChoice(
                            widget.vaccine.vaccine3day4date
                                    .toDate()
                                    .day
                                    .toString() +
                                "/" +
                                widget.vaccine.vaccine3day4date
                                    .toDate()
                                    .month
                                    .toString() +
                                "/" +
                                widget.vaccine.vaccine3day4date
                                    .toDate()
                                    .year
                                    .toString(),
                            widget.vaccine.vaccine3day4available),
                        if (widget.vaccine.vaccine3day4available != 0)
                          Container(
                              height: height * 0.04,
                              width: width * 0.08,
                              decoration: BoxDecoration(
                                  color: Colors.blueGrey,
                                  borderRadius: BorderRadius.circular(5)),
                              child: Text(
                                      widget.vaccine.vaccine3day4available
                                          .toString(),
                                      style: GoogleFonts.comfortaa(
                                          fontWeight: FontWeight.w700,
                                          color: Colors.white))
                                  .centered())
                        else
                          Text("out of stock"),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        __vaccine3dateChoice(
                            widget.vaccine.vaccine3day5date
                                    .toDate()
                                    .day
                                    .toString() +
                                "/" +
                                widget.vaccine.vaccine3day5date
                                    .toDate()
                                    .month
                                    .toString() +
                                "/" +
                                widget.vaccine.vaccine3day5date
                                    .toDate()
                                    .year
                                    .toString(),
                            widget.vaccine.vaccine3day5available),
                        if (widget.vaccine.vaccine3day5available != 0)
                          Container(
                              height: height * 0.04,
                              width: width * 0.08,
                              decoration: BoxDecoration(
                                  color: Colors.blueGrey,
                                  borderRadius: BorderRadius.circular(5)),
                              child: Text(
                                      widget.vaccine.vaccine3day5available
                                          .toString(),
                                      style: GoogleFonts.comfortaa(
                                          fontWeight: FontWeight.w700,
                                          color: Colors.white))
                                  .centered())
                        else
                          Text("out of stock"),
                      ],
                    ),
                  ])
                else
                  SizedBox(
                    height: height * 0.01,
                  ),
////
                ///
                ///
                ///
                ///
                ///
                ///
                SizedBox(
                  height: 15.0,
                ),
                Text("Under Age",
                        style: GoogleFonts.comfortaa(
                            fontSize: 13.0, fontWeight: FontWeight.w700))
                    .p1(),
                Container(
                  child: Wrap(
                    spacing: 8.0,
                    children: <Widget>[
                      _ageChoiceList("18+"),
                      _ageChoiceList("45+"),
                    ],
                  ),
                ),
                // if (widget.vaccine.vaccine1day1available != 0)
                //   Text(widget.vaccine.vaccine1day1available.toString())
                // else
                //   Text("out of stock"),
                SizedBox(
                  height: 15.0,
                ),

                Text("Gender",
                        style: GoogleFonts.comfortaa(
                            fontSize: 13.0, fontWeight: FontWeight.w700))
                    .p1(),
                // SizedBox(
                //   height: height * 0.01,
                // ),
                HStack([
                  _genderChoiceList("Male"),
                  _genderChoiceList("Female"),
                ]),

                SizedBox(
                  height: height * 0.01,
                ),
                Text("Select Season",
                        style: GoogleFonts.comfortaa(
                            fontSize: 13.0, fontWeight: FontWeight.w700))
                    .p1(),
                Wrap(
                  children: [
                    __seasonChoice("Morning"),
                    __seasonChoice("Afternoon"),
                  ],
                ),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //   children: [
                //     // GestureDetector(
                //     //     onTap: () => selectTimePicker(context),
                //     //     child: Container(
                //     //         height: height * 0.05,
                //     //         width: width * 0.25,
                //     //         child: Material(
                //     //             borderRadius: BorderRadius.circular(12.0),
                //     //             color: Color(0xFF2877ed),
                //     //             elevation: 0.0,
                //     //             child: Center(
                //     //               child: Text(
                //     //                   dateTime.day.toString() +
                //     //                       '/' +
                //     //                       dateTime.month.toString() +
                //     //                       '/' +
                //     //                       dateTime.year.toString(),
                //     //                   style: GoogleFonts.comfortaa(
                //     //                       color: Colors.white,
                //     //                       fontWeight: FontWeight.w600,
                //     //                       fontSize: 15.0)),
                //     //             )))),
                //     Container(
                //       child: Wrap(
                //         spacing: 8.0,
                //         children: <Widget>[

                //         ],
                //       ),
                //     ),
                //   ],
                // ),
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
                                              widget.vaccine.docnumber,
                                              _aadharNumberController.text
                                                  .trim(),
                                              context,
                                              widget.vaccine.organization);
                                          //sendSms();
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
