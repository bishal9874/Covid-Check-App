import 'package:covidcheck/counter/booking_counter.dart';
import 'package:covidcheck/models/orgServiecs.dart';
import 'package:covidcheck/services/ser.dart';
import 'package:covidcheck/widgets/link_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:flutter_progress_button/flutter_progress_button.dart';

// ignore: must_be_immutable
class DoctorDetails extends StatefulWidget {
  OrgModel doctorDetails;
  final fee, doctorName, doctordes, herotag, image, orgname;
  DoctorDetails(
      {this.doctorDetails,
      this.fee,
      this.doctorName,
      this.doctordes,
      this.herotag,
      this.image,
      this.orgname});

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
                        controller: _birthyearController,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.blue[80],
                          hintText: " Age",
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
                        if (checkFields())
                          checkdoctorBookCart(doctorid, context, widget.orgname,
                              widget.doctorName, widget.fee.toString());
                      },
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
                      style: GoogleFonts.raleway(
                          fontSize: 19.0, fontWeight: FontWeight.w600),
                    ),
                    SizedBox(
                      height: 5.0,
                    ),
                    Text(
                      description,
                      style: GoogleFonts.raleway(
                          fontSize: 15.0,
                          textStyle: TextStyle(
                            color: Colors.white,
                          )),
                    ),
                    Text(
                      "₹ " + fee.toString(),
                      style: GoogleFonts.notoSans(
                          fontSize: 16.0,
                          color: Colors.yellow,
                          fontWeight: FontWeight.w600),
                    ),
                    Text(
                      widget.doctorDetails.status,
                      style: GoogleFonts.notoSans(
                          fontSize: 16.0,
                          color: Colors.lightGreenAccent,
                          fontWeight: FontWeight.w600),
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

  _seasonChoice(String name) {
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

  void checkdoctorBookCart(
    String doc,
    BuildContext context,
    String orgName,
    String docname,
    String docFee,
  ) {
    CovidCheckApp.sharedPreferences
            .getStringList(CovidCheckApp.userCartList)
            .contains(doc)
        ? Fluttertoast.showToast(msg: "Appoint Booking is Already in Cart")
        : addBookToCart(doc, context, orgName, docname, docFee);
  }

  addBookToCart(
    String org,
    BuildContext context,
    String oranizationName,
    String doctorname,
    String doctorFee,
  ) {
    List doctorList = CovidCheckApp.sharedPreferences
        .getStringList(CovidCheckApp.userCartList);
    doctorList.add(org);

    CovidCheckApp.firestore
        .collection("DoctorAppoint")
        .doc(_phonenumberController.text.trim())
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
    });
    CovidCheckApp.firestore
        .collection(CovidCheckApp.collectionUser)
        .doc(CovidCheckApp.sharedPreferences.getString(CovidCheckApp.userUID))
        .update({
      CovidCheckApp.userCartList: doctorList,
    }).then((value) {
      Fluttertoast.showToast(msg: "Appoint Book Added to Cart Successfully");
      CovidCheckApp.sharedPreferences
          .setStringList(CovidCheckApp.userCartList, doctorList);
      Provider.of<BookItemCounter>(context, listen: false).displayResult();
    });
    setState(() {
      _nameController.clear();
      _birthyearController.clear();
      _phonenumberController.clear();
    });
  }
}