import 'package:covidcheck/counter/booking_counter.dart';
import 'package:covidcheck/models/orgServiecs.dart';
import 'package:covidcheck/services/ser.dart';
import 'package:covidcheck/widgets/link_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:toast/toast.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:flutter_progress_button/flutter_progress_button.dart';

// ignore: must_be_immutable
class DoctorDetails extends StatefulWidget {
  OrgModel doctorDetails;
  final fee, doctorName, doctordes, herotag, image, orgname, avail;
  DoctorDetails(
      {this.doctorDetails,
      this.fee,
      this.doctorName,
      this.doctordes,
      this.herotag,
      this.image,
      this.orgname,
      this.avail});

  @override
  _DoctorDetailsState createState() => _DoctorDetailsState();
}

class _DoctorDetailsState extends State<DoctorDetails> {
  final formKey = new GlobalKey<FormState>();
  final TextEditingController _nameController = new TextEditingController();
  final TextEditingController _birthyearController =
      new TextEditingController();
  final TextEditingController _phonenumberController =
      new TextEditingController();
  String genderChoice = "";
  String seasonChoice = "";
  String name, birthyear, phonenumber;
  DateTime dateTime = DateTime.now();
  String doctorid = DateTime.now().millisecondsSinceEpoch.toString();
  @override
  Widget build(BuildContext context) {
    return Hero(
        tag: widget.image,
        child: Scaffold(
          appBar: _buildAppBar(context),
          backgroundColor: Colors.blueGrey[700],

          // appBar: _buildAppBar(context),
          body: Form(
            key: formKey,
            child: Stack(
              fit: StackFit.expand,
              children: <Widget>[
                // _buildBackground(),
                VStack(
                  [
                    _buildHeading(context, widget.doctorName, widget.doctordes,
                        widget.fee, widget.image),
                    _buildCoursePanel(context),
                  ],
                ),
                //_buildCourseFooter(),
              ],
            ),
          ),
        ));
  }

  checkFields() {
    final form = formKey.currentState;
    if (form.validate()) {
      form.save();
      return true;
    }
    return false;
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
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(50),
            topLeft: Radius.circular(50),
          ),
          child: Container(
            color: Colors.black26,
            child: VStack([
              Padding(
                padding: EdgeInsets.only(bottom: 24, top: 25),
                child: Center(
                  child: Text(
                    'Patient Details',
                    style: GoogleFonts.comfortaa(
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
                        controller: _birthyearController,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.blue[80],
                          hintText: " Age",
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
                          this.birthyear = value;
                        },
                        validator: (value) {
                          if (value.isEmpty) {
                            return "please enter your age";
                          } else {
                            return null;
                          }
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
                          child: HStack([
                            _seasonChoice("Morning"),
                            _seasonChoice("Afternoon")
                          ]),
                        )
                      ],
                    ),
                    SizedBox(
                      height: height * 0.03,
                    ),
                    // ProgressButton(
                    //   type: ProgressButtonType.Raised,
                    //   color: Color(0xff101beb),
                    //   height: height * 0.07,
                    //   defaultWidget: Text(
                    //     'Book Appointment',
                    //     style: GoogleFonts.comfortaa(
                    //       fontSize: width * 0.05,
                    //       fontWeight: FontWeight.w500,
                    //       letterSpacing: 1,
                    //       color: Colors.white,
                    //     ),
                    //   ),
                    //   progressWidget: CircularProgressIndicator(
                    //     valueColor:
                    //         AlwaysStoppedAnimation<Color>(Colors.orange),
                    //   ),
                    //   width: width * 0.9,
                    //   onPressed: () async {
                    //     if (checkFields())
                    //       addBookToCart(doctorid, context, widget.orgname,
                    //           widget.doctorName, widget.fee.toString());
                    //   },
                    // ).centered(),
                    GestureDetector(
                      onTap: () {
                        if (checkFields())
                          showDialog(
                              context: context,
                              builder: (c) {
                                return AlertDialog(
                                  contentPadding: EdgeInsets.all(10.0),
                                  content: Container(
                                      height: height * 0.25,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Container(
                                            width: width * 0.40,
                                            child: Text(
                                              "You Just Pay ₹ ${widget.doctorDetails.minimumAppointprice} for Appointment Booking",
                                              style: GoogleFonts.comfortaa(
                                                fontSize: 14.0,
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            height: height * 0.02,
                                          ),
                                          GestureDetector(
                                            onTap: () {
                                              if (checkFields())
                                                addBookToCart(
                                                    doctorid,
                                                    context,
                                                    widget.orgname,
                                                    widget.doctorName,
                                                    widget.fee.toString());
                                              Navigator.of(context).pop();
                                            },
                                            child: Container(
                                                height: height * 0.06,
                                                width: width * 0.40,
                                                child: Material(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5.0),
                                                    color: Color(0xFF2877ed),
                                                    elevation: 0.0,
                                                    child: Center(
                                                        child: Text('Pay',
                                                            style: GoogleFonts.raleway(
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
                      },
                      child: Container(
                          height: height * 0.06,
                          width: width * 0.50,
                          child: Material(
                              borderRadius: BorderRadius.circular(5.0),
                              color: Color(0xFF2877ed),
                              elevation: 0.0,
                              child: Center(
                                  child: Text('Book Appointment',
                                      style: GoogleFonts.raleway(
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

  _buildHeading(
    BuildContext context,
    String name,
    String description,
    int fee,
    String imgeurl,
  ) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Container(
      width: width * 1.0,
      margin: EdgeInsets.only(top: 8, bottom: 15),
      padding: EdgeInsets.all(16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(10.0),
            child: Row(
              children: <Widget>[
                Container(
                  height: height * 0.08,
                  width: width * 0.16,
                  decoration: BoxDecoration(
                    color: Colors.blue[900],
                    shape: BoxShape.circle,
                  ),
                  child: Container(
                    padding: EdgeInsets.all(3.0),
                    child: Center(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(40.0),
                        child: Image(
                          height: height * 0.10,
                          width: width * 0.16,
                          image: AssetImage(imgeurl),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 10.0,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      name,
                      style: GoogleFonts.comfortaa(
                          fontSize: 19.0, fontWeight: FontWeight.w600),
                    ),
                    SizedBox(
                      height: 5.0,
                    ),
                    Text(
                      description,
                      style: GoogleFonts.comfortaa(
                          fontSize: 15.0,
                          textStyle: TextStyle(
                            color: Colors.white,
                          )),
                    ),
                    Text(
                      "₹ " + fee.toString(),
                      style: GoogleFonts.comfortaa(
                          fontSize: 16.0,
                          color: Colors.yellow,
                          fontWeight: FontWeight.w600),
                    ),
                    RichText(
                      text: TextSpan(
                        style: TextStyle(fontSize: 15.0),
                        children: <TextSpan>[
                          TextSpan(
                              text: 'Availablity: ',
                              style: GoogleFonts.comfortaa(
                                  fontWeight: FontWeight.w600,
                                  color: Colors.greenAccent)),
                          TextSpan(
                              text: widget.avail,
                              style: GoogleFonts.comfortaa(
                                  fontWeight: FontWeight.w600,
                                  color: Colors.orange)),
                        ],
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(
              FontAwesomeIcons.phone,
              color: Colors.red,
              size: 30.0,
            ),
          ),
        ],
      ),
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

  _seasonChoice(String name) {
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

  // void checkdoctorBookCart(
  //   String doc,
  //   BuildContext context,
  //   String orgName,
  //   String docname,
  //   String docFee,
  // ) {
  //   CovidCheckApp.sharedPreferences
  //           .getStringList(CovidCheckApp.userCartList)
  //           .contains(doc)
  //       ? Toast.show(
  //           "Your Aadhar Card is Already Registration For Vaccination", context,
  //           duration: Toast.LENGTH_SHORT, gravity: Toast.BOTTOM)
  //       : addBookToCart(doc, context, orgName, docname, docFee);
  // }

  addBookToCart(
    String org,
    BuildContext context,
    String oranizationName,
    String doctorname,
    String doctorFee,
  ) {
    CovidCheckApp.firestore
        .collection(CovidCheckApp.collectionUser)
        .doc(CovidCheckApp.sharedPreferences.getString(CovidCheckApp.userUID))
        .collection(CovidCheckApp.appointmentcollection)
        .doc(doctorid)
        .set({
      "doctorAppointCentre": oranizationName,
      "phone_number": _phonenumberController.text.trim(),
      "userUI":
          CovidCheckApp.sharedPreferences.getString(CovidCheckApp.userUID),
      "username":
          CovidCheckApp.sharedPreferences.getString(CovidCheckApp.userName),
      "useremail":
          CovidCheckApp.sharedPreferences.getString(CovidCheckApp.userEmail),
      "name": _nameController.text.trim(),
      "age": _birthyearController.text.trim(),
      "seasonChoice": seasonChoice,
      "gender": genderChoice,
      "dateSelection": dateTime,
      "doctorName": doctorname,
      "doctorFee": doctorFee,
      "submit_time": doctorid,
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
                          "Appointment Booking.........",
                          style: GoogleFonts.comfortaa(),
                        )
                      ]),
                ));
          });
    }).whenComplete(() => showDialog(
            context: context,
            builder: (c) {
              Future.delayed(Duration(seconds: 12), () {
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
                            "Your Appointment Booking Successfully Done!! Please Kindly Visit Our Hospital/Organization on your mentioned Date and Time Thank You",
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
      _nameController.clear();
      _birthyearController.clear();
      _phonenumberController.clear();
    });
  }
}
