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
  final fee,
      doctorName,
      doctordes,
      herotag,
      image,
      orgname,
      day1date,
      day1view,
      day1schedule,
      day2date,
      day2view,
      day2schedule,
      day3date,
      day3view,
      day3schedule;
  DoctorDetails(
      {this.doctorDetails,
      this.fee,
      this.doctorName,
      this.doctordes,
      this.herotag,
      this.image,
      this.orgname,
      this.day1date,
      this.day1view,
      this.day1schedule,
      this.day2date,
      this.day2view,
      this.day2schedule,
      this.day3date,
      this.day3view,
      this.day3schedule});

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
  String daydatechoice = "";
  int viewingPatient;
  String daySchedule = "";
  bool appointmentApproval = false;
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
                    Text("Selected Schedule",
                            style: GoogleFonts.comfortaa(
                                fontSize: 15.0, fontWeight: FontWeight.w700))
                        .p1(),
                    SizedBox(
                      height: height * 0.01,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        if (viewingPatient != null)
                          HStack([
                            Container(
                                height: height * 0.04,
                                width: width * 0.20,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12.0),
                                  color: Color(0xFF11bd0b),
                                ),
                                child: Center(
                                  child: Text(daydatechoice,
                                      style: GoogleFonts.comfortaa(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w600,
                                          fontSize: 15.0)),
                                )),
                            SizedBox(
                              width: width * 0.02,
                            ),
                            Container(
                                height: height * 0.04,
                                width: width * 0.30,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12.0),
                                  color: Color(0xFF079aab),
                                ),
                                child: Center(
                                  child: Text(daySchedule,
                                      style: GoogleFonts.comfortaa(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w600,
                                          fontSize: 15.0)),
                                )),
                          ])
                        else
                          Container(
                            height: height * 0.04,
                            width: width * 0.30,
                            decoration: BoxDecoration(
                                color: Colors.red,
                                borderRadius: BorderRadius.circular(5.0)),
                            child: Center(
                              child: Text("Not Selected",
                                  style: GoogleFonts.comfortaa(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 15.0)),
                            ),
                          ),
                      ],
                    ),
                    SizedBox(
                      height: height * 0.03,
                    ),

                    GestureDetector(
                      onTap: () {
                        if (checkFields()) if (viewingPatient != 0)
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
                        else
                          VxToast.show(context,
                              msg:
                                  "Doctor Not Available or Patient's are Full Filled",
                              position: VxToastPosition.center,
                              bgColor: Colors.red[400],
                              showTime: 9000,
                              textColor: Colors.white);
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
                      height: height * .01,
                    ),
                    Text(
                      description,
                      style: GoogleFonts.comfortaa(
                          fontSize: 15.0,
                          textStyle: TextStyle(
                            color: Colors.white,
                          )),
                    ),
                    SizedBox(
                      height: height * .01,
                    ),
                    Text(
                      "₹ " + fee.toString(),
                      style: GoogleFonts.comfortaa(
                          fontSize: 16.0,
                          color: Colors.yellow,
                          fontWeight: FontWeight.w600),
                    ),
                  ],
                )
              ],
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                  //margin: EdgeInsets.only(right: 10.0),
                  child: Text("Availablity",
                      style: GoogleFonts.comfortaa(
                          color: Colors.cyanAccent,
                          fontWeight: FontWeight.w600))),
              IconButton(
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (c) {
                        return AlertDialog(
                          contentPadding: EdgeInsets.all(10.0),
                          content: Container(
                              height: height * 0.30,
                              width: width * 0.50,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text("Select Schedule",
                                          style: GoogleFonts.comfortaa(
                                              color: Colors.orangeAccent,
                                              fontSize: 18.0,
                                              fontWeight: FontWeight.w700))
                                      .p1(),
                                  SizedBox(
                                    height: height * 0.01,
                                  ),
                                  Row(
                                    children: [
                                      __daydateChoice(widget.day1date,
                                          widget.day1view, widget.day1schedule),
                                      SizedBox(
                                        width: width * .01,
                                      ),
                                      if (widget.day1view != 0)
                                        HStack([
                                          Container(
                                              height: height * 0.04,
                                              width: width * 0.30,
                                              decoration: BoxDecoration(
                                                  color: Colors.blueGrey,
                                                  borderRadius:
                                                      BorderRadius.circular(5)),
                                              child: Text(widget.day1schedule,
                                                      style:
                                                          GoogleFonts.comfortaa(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w700,
                                                              color:
                                                                  Colors.white))
                                                  .centered()),
                                          SizedBox(
                                            width: width * .01,
                                          ),
                                          Container(
                                              height: height * 0.04,
                                              width: width * 0.08,
                                              decoration: BoxDecoration(
                                                  color: Colors.lightGreen,
                                                  borderRadius:
                                                      BorderRadius.circular(5)),
                                              child: Text(
                                                      widget.day1view
                                                          .toString(),
                                                      style:
                                                          GoogleFonts.comfortaa(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w700,
                                                              color:
                                                                  Colors.white))
                                                  .centered())
                                        ])
                                      else
                                        Container(
                                            height: height * 0.04,
                                            width: width * 0.40,
                                            decoration: BoxDecoration(
                                                color: Colors.red,
                                                borderRadius:
                                                    BorderRadius.circular(5)),
                                            child: Text("Patient's Full Field",
                                                    style:
                                                        GoogleFonts.comfortaa(
                                                            fontWeight:
                                                                FontWeight.w700,
                                                            color:
                                                                Colors.white))
                                                .centered())
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      __daydateChoice(widget.day2date,
                                          widget.day2view, widget.day2schedule),
                                      SizedBox(
                                        width: width * .01,
                                      ),
                                      if (widget.day2view != 0)
                                        HStack([
                                          Container(
                                              height: height * 0.04,
                                              width: width * 0.30,
                                              decoration: BoxDecoration(
                                                  color: Colors.blueGrey,
                                                  borderRadius:
                                                      BorderRadius.circular(5)),
                                              child: Text(widget.day2schedule,
                                                      style:
                                                          GoogleFonts.comfortaa(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w700,
                                                              color:
                                                                  Colors.white))
                                                  .centered()),
                                          SizedBox(
                                            width: width * .01,
                                          ),
                                          Container(
                                              height: height * 0.04,
                                              width: width * 0.08,
                                              decoration: BoxDecoration(
                                                  color: Colors.lightGreen,
                                                  borderRadius:
                                                      BorderRadius.circular(5)),
                                              child: Text(
                                                      widget.day2view
                                                          .toString(),
                                                      style:
                                                          GoogleFonts.comfortaa(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w700,
                                                              color:
                                                                  Colors.white))
                                                  .centered())
                                        ])
                                      else
                                        Container(
                                            height: height * 0.04,
                                            width: width * 0.40,
                                            decoration: BoxDecoration(
                                                color: Colors.red,
                                                borderRadius:
                                                    BorderRadius.circular(5)),
                                            child: Text("Patient Full Field",
                                                    style:
                                                        GoogleFonts.comfortaa(
                                                            fontWeight:
                                                                FontWeight.w700,
                                                            color:
                                                                Colors.white))
                                                .centered())
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      __daydateChoice(widget.day3date,
                                          widget.day3view, widget.day3schedule),
                                      SizedBox(
                                        width: width * .01,
                                      ),
                                      if (widget.day3view != 0)
                                        HStack([
                                          Container(
                                              height: height * 0.04,
                                              width: width * 0.30,
                                              decoration: BoxDecoration(
                                                  color: Colors.blueGrey,
                                                  borderRadius:
                                                      BorderRadius.circular(5)),
                                              child: Text(widget.day3schedule,
                                                      style:
                                                          GoogleFonts.comfortaa(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w700,
                                                              color:
                                                                  Colors.white))
                                                  .centered()),
                                          SizedBox(
                                            width: width * .01,
                                          ),
                                          Container(
                                              height: height * 0.04,
                                              width: width * 0.08,
                                              decoration: BoxDecoration(
                                                  color: Colors.lightGreen,
                                                  borderRadius:
                                                      BorderRadius.circular(5)),
                                              child: Text(
                                                      widget.day3view
                                                          .toString(),
                                                      style:
                                                          GoogleFonts.comfortaa(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w700,
                                                              color:
                                                                  Colors.white))
                                                  .centered())
                                        ])
                                      else
                                        Container(
                                            height: height * 0.04,
                                            width: width * 0.40,
                                            decoration: BoxDecoration(
                                                color: Colors.red,
                                                borderRadius:
                                                    BorderRadius.circular(5)),
                                            child: Text("Patient Full Field",
                                                    style:
                                                        GoogleFonts.comfortaa(
                                                            fontWeight:
                                                                FontWeight.w700,
                                                            color:
                                                                Colors.white))
                                                .centered())
                                    ],
                                  ),

                                  SizedBox(
                                    height: height * 0.02,
                                  ),

                                  SizedBox(
                                    height: height * 0.01,
                                  ),
                                  // Text(
                                  //   "After click pay Button wait for few Second",
                                  //   style: GoogleFonts.comfortaa(
                                  //       fontSize: 12.0,
                                  //       fontWeight: FontWeight.w200),
                                  // ),
                                ],
                              )),
                        );
                      });
                },
                icon: Icon(
                  FontAwesomeIcons.calendarAlt,
                  color: Colors.lightGreen,
                  size: 30.0,
                ),
              )
            ],
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

  ///
  ///
  ///
  ///
  ///
  __daydateChoice(String name, int patientView, String schedule) {
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
        selected: daydatechoice == name,
        onSelected: (selected) {
          setState(() {
            daydatechoice = name;
            viewingPatient = patientView;
            daySchedule = schedule;
            print(daydatechoice);
            print(viewingPatient);
            print(daySchedule);
            Navigator.pop(context);
          });
        },
      ),
    );
  }

  // __day2dateChoice(String name, int patientView, String schedule) {
  //   return Container(
  //     padding: const EdgeInsets.all(2.0),
  //     child: ChoiceChip(
  //       label: Text(name),
  //       labelStyle: GoogleFonts.comfortaa(
  //           color: Colors.black, fontSize: 14.0, fontWeight: FontWeight.bold),
  //       shape: RoundedRectangleBorder(
  //         borderRadius: BorderRadius.circular(30.0),
  //       ),
  //       backgroundColor: Color(0xffededed),
  //       selectedColor: Color(0xff9ee892),
  //       selected: day2datechoice == name,
  //       onSelected: (selected) {
  //         setState(() {
  //           day2datechoice = name;
  //           viewing2Patient = patientView;
  //           day2Schedule = schedule;
  //           print(day2datechoice);
  //           print(viewing2Patient);
  //           print(day2Schedule);
  //         });
  //       },
  //     ),
  //   );
  // }

  // __day3dateChoice(String name, int patientView, String schedule) {
  //   return Container(
  //     padding: const EdgeInsets.all(2.0),
  //     child: ChoiceChip(
  //       label: Text(name),
  //       labelStyle: GoogleFonts.comfortaa(
  //           color: Colors.black, fontSize: 14.0, fontWeight: FontWeight.bold),
  //       shape: RoundedRectangleBorder(
  //         borderRadius: BorderRadius.circular(30.0),
  //       ),
  //       backgroundColor: Color(0xffededed),
  //       selectedColor: Color(0xff9ee892),
  //       selected: day3datechoice == name,
  //       onSelected: (selected) {
  //         setState(() {
  //           day3datechoice = name;
  //           viewing3Patient = patientView;
  //           day3Schedule = schedule;
  //           print(day3datechoice);
  //           print(viewing3Patient);
  //           print(day3Schedule);
  //         });
  //       },
  //     ),
  //   );
  // }
  ////
  ///
  ///
  ///
  ///
  ///
  ///

  addBookToCart(
    String org,
    BuildContext context,
    String oranizationName,
    String doctorname,
    String doctorFee,
  ) {
    CovidCheckApp.firestore
        .collection("Details")
        .doc(widget.doctorDetails.docnumber + oranizationName)
        .update({
      if (widget.doctorName == widget.doctorDetails.doctor1 &&
          daydatechoice ==
              widget.doctorDetails.doctor1day1date.toDate().day.toString() +
                  "/" +
                  widget.doctorDetails.doctor1day1date
                      .toDate()
                      .month
                      .toString() +
                  "/" +
                  widget.doctorDetails.doctor1day1date
                      .toDate()
                      .year
                      .toString() &&
          daySchedule == widget.day1schedule &&
          viewingPatient == widget.day1view)
        "doctor1day1view": widget.day1view - 1
      else if (widget.doctorName == widget.doctorDetails.doctor1 &&
          daydatechoice ==
              widget.doctorDetails.doctor1day2date.toDate().day.toString() +
                  "/" +
                  widget.doctorDetails.doctor1day2date
                      .toDate()
                      .month
                      .toString() +
                  "/" +
                  widget.doctorDetails.doctor1day2date
                      .toDate()
                      .year
                      .toString() &&
          daySchedule == widget.day2schedule &&
          viewingPatient == widget.day2view)
        "doctor1day2view": widget.day2view - 1
      else if (widget.doctorName == widget.doctorDetails.doctor1 &&
          daydatechoice ==
              widget.doctorDetails.doctor1day3date.toDate().day.toString() +
                  "/" +
                  widget.doctorDetails.doctor1day3date
                      .toDate()
                      .month
                      .toString() +
                  "/" +
                  widget.doctorDetails.doctor1day3date
                      .toDate()
                      .year
                      .toString() &&
          daySchedule == widget.day3schedule &&
          viewingPatient == widget.day3view)
        "doctor1day3view": widget.day3view - 1
      else if (widget.doctorName == widget.doctorDetails.doctor2 &&
          daydatechoice ==
              widget.doctorDetails.doctor2day1date.toDate().day.toString() +
                  "/" +
                  widget.doctorDetails.doctor2day1date
                      .toDate()
                      .month
                      .toString() +
                  "/" +
                  widget.doctorDetails.doctor2day1date
                      .toDate()
                      .year
                      .toString() &&
          daySchedule == widget.day1schedule &&
          viewingPatient == widget.day1view)
        "doctor2day1view": widget.day1view - 1
      else if (widget.doctorName == widget.doctorDetails.doctor2 &&
          daydatechoice ==
              widget.doctorDetails.doctor2day2date.toDate().day.toString() +
                  "/" +
                  widget.doctorDetails.doctor2day2date
                      .toDate()
                      .month
                      .toString() +
                  "/" +
                  widget.doctorDetails.doctor2day2date
                      .toDate()
                      .year
                      .toString() &&
          daySchedule == widget.day2schedule &&
          viewingPatient == widget.day2view)
        "doctor2day2view": widget.day2view - 1
      else if (widget.doctorName == widget.doctorDetails.doctor2 &&
          daydatechoice ==
              widget.doctorDetails.doctor2day3date.toDate().day.toString() +
                  "/" +
                  widget.doctorDetails.doctor2day3date
                      .toDate()
                      .month
                      .toString() +
                  "/" +
                  widget.doctorDetails.doctor2day3date
                      .toDate()
                      .year
                      .toString() &&
          daySchedule == widget.day3schedule &&
          viewingPatient == widget.day3view)
        "doctor2day3view": widget.day3view - 1
      else if (widget.doctorName == widget.doctorDetails.doctor3 &&
          daydatechoice ==
              widget.doctorDetails.doctor3day1date.toDate().day.toString() +
                  "/" +
                  widget.doctorDetails.doctor3day1date
                      .toDate()
                      .month
                      .toString() +
                  "/" +
                  widget.doctorDetails.doctor3day1date
                      .toDate()
                      .year
                      .toString() &&
          daySchedule == widget.day1schedule &&
          viewingPatient == widget.day1view)
        "doctor3day1view": widget.day1view - 1
      else if (widget.doctorName == widget.doctorDetails.doctor3 &&
          daydatechoice ==
              widget.doctorDetails.doctor3day2date.toDate().day.toString() +
                  "/" +
                  widget.doctorDetails.doctor3day2date
                      .toDate()
                      .month
                      .toString() +
                  "/" +
                  widget.doctorDetails.doctor3day2date
                      .toDate()
                      .year
                      .toString() &&
          daySchedule == widget.day2schedule &&
          viewingPatient == widget.day2view)
        "doctor3day2view": widget.day2view - 1
      else if (widget.doctorName == widget.doctorDetails.doctor3 &&
          daydatechoice ==
              widget.doctorDetails.doctor3day3date.toDate().day.toString() +
                  "/" +
                  widget.doctorDetails.doctor3day3date
                      .toDate()
                      .month
                      .toString() +
                  "/" +
                  widget.doctorDetails.doctor3day3date
                      .toDate()
                      .year
                      .toString() &&
          daySchedule == widget.day3schedule &&
          viewingPatient == widget.day3view)
        "doctor3day3view": widget.day3view - 1
    });
    CovidCheckApp.firestore
        .collection("apppointment")
        .doc(CovidCheckApp.sharedPreferences.getString(CovidCheckApp.userUID) +
            doctorid)
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
      "seasonChoice": daySchedule,
      "gender": genderChoice,
      "dateSelection": daydatechoice,
      "doctorName": doctorname,
      "doctorFee": doctorFee,
      "submit_time": doctorid,
      "docnumber": widget.doctorDetails.docnumber,
      "adminApproval": appointmentApproval,
    });

    CovidCheckApp.firestore
        .collection(CovidCheckApp.collectionUser)
        .doc(CovidCheckApp.sharedPreferences.getString(CovidCheckApp.userUID))
        .collection(CovidCheckApp.appointmentcollection)
        .doc(doctorid + _nameController.text.trim())
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
      "seasonChoice": daySchedule,
      "gender": genderChoice,
      "dateSelection": daydatechoice,
      "doctorName": doctorname,
      "doctorFee": doctorFee,
      "submit_time": doctorid,
      "docnumber": widget.doctorDetails.docnumber,
      "adminApproval": appointmentApproval,
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
