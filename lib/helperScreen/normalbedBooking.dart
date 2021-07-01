import 'package:covidcheck/models/orgServiecs.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:velocity_x/velocity_x.dart';

class NormalBed extends StatefulWidget {
  OrgModel normalbed;
  final wardname, bedavailable, minimumBookingPrice;
  NormalBed({
    Key key,
    this.bedavailable,
    this.minimumBookingPrice,
    this.normalbed,
    this.wardname,
  }) : super(key: key);

  @override
  _NormalBedState createState() => _NormalBedState();
}

class _NormalBedState extends State<NormalBed> {
  int bed;

  final formKey = new GlobalKey<FormState>();
  final TextEditingController _nameController = new TextEditingController();
  final TextEditingController _aadharNumberController =
      new TextEditingController();
  final TextEditingController _phonenumberController =
      new TextEditingController();
  final TextEditingController _symptomsController = new TextEditingController();
  String selectedChoice = "";
  String ageselectedChoice = "";
  String genderChoice = "";
  String aadharNumber, name, reason, phonenumber;
  DateTime birthDate = DateTime.now();
  DateTime dateTime = DateTime.now();
  String bedbookingID = DateTime.now().millisecondsSinceEpoch.toString();

  checkFields() {
    final form = formKey.currentState;
    if (form.validate()) {
      form.save();
      return true;
    }
    return false;
  }

  Future<Null> selectbirthPicker(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: dateTime,
        firstDate: DateTime(1920),
        lastDate: DateTime(2050));
    if (picked != null && picked != dateTime) {
      setState(() {
        birthDate = picked;
        print(birthDate.toString());
      });
    }
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
  void initState() {
    // TODO: implement initState
    bed = int.parse(widget.bedavailable);
    super.initState();
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
            widget.wardname,
            style: GoogleFonts.raleway(),
          ),
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
          SizedBox(
            height: height * 0.02,
          ),
          VStack(
            [
              Container(
                  height: height * 0.03,
                  width: width * 0.30,
                  margin: EdgeInsets.only(left: 20.0),
                  decoration: BoxDecoration(
                    color: Colors.blueGrey[800],
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Center(
                    child: RichText(
                      text: TextSpan(
                        style: TextStyle(fontSize: 12.0),
                        children: <TextSpan>[
                          TextSpan(
                              text: 'Availablity: ',
                              style: GoogleFonts.raleway(
                                  fontWeight: FontWeight.w700,
                                  color: Colors.white)),
                          TextSpan(
                              text: "$bed",
                              style: GoogleFonts.notoSans(
                                  fontWeight: FontWeight.w700,
                                  color: Colors.orange)),
                        ],
                      ),
                    ),
                  )).centered(),
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
                    controller: _phonenumberController,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.blue[80],
                      hintText: "Phone Number",
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
                      this.phonenumber = value;
                    },
                    validator: (value) {
                      if (value.isEmpty) {
                        return "please enter your Phone Number";
                      } else if (value.length != 10) {
                        return "please enter your valid Phone Number";
                      }
                      return null;
                    }),
                SizedBox(
                  height: height * 0.01,
                ),
                TextFormField(
                    maxLines: 4,
                    controller: _symptomsController,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.blue[80],
                      hintText: "Symptoms",
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
                    onChanged: (value) {
                      this.reason = value;
                    },
                    validator: (value) {
                      if (value.isEmpty) {
                        return "please enter your Symptoms for Hospital Bed Registration";
                      }
                      return null;
                    }),
                SizedBox(
                  height: height * 0.01,
                ),

                // SizedBox(
                //   height: height * 0.01,
                // ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      child: VStack([
                        Text("Gender",
                                style: GoogleFonts.raleway(
                                    fontSize: 15.0,
                                    fontWeight: FontWeight.w700))
                            .p1(),
                        HStack([
                          _genderChoiceList("Male"),
                          _genderChoiceList("Female"),
                        ]),
                      ]),
                    ),
                    Container(
                      child: VStack([
                        Text("Date of Birth",
                                style: GoogleFonts.raleway(
                                    fontSize: 15.0,
                                    fontWeight: FontWeight.w700))
                            .p1(),
                        SizedBox(
                          height: height * 0.02,
                        ),
                        GestureDetector(
                            onTap: () => selectbirthPicker(context),
                            child: Container(
                                height: height * 0.05,
                                width: width * 0.25,
                                child: Material(
                                    borderRadius: BorderRadius.circular(12.0),
                                    color: Colors.blue[800],
                                    elevation: 0.0,
                                    child: Center(
                                      child: Text(
                                          birthDate.day.toString() +
                                              '/' +
                                              birthDate.month.toString() +
                                              '/' +
                                              birthDate.year.toString(),
                                          style: GoogleFonts.montserrat(
                                              color: Colors.white,
                                              fontWeight: FontWeight.w600,
                                              fontSize: 15.0)),
                                    )))),
                      ]),
                    ),
                  ],
                ),

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
                      child: Wrap(
                        spacing: 8.0,
                        children: <Widget>[
                          // __seasonChoice("Morning"),
                          // __seasonChoice("Afternoon"),
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
                                          "You Just Pay ₹ ${widget.minimumBookingPrice} for Vaccination"),
                                      SizedBox(
                                        height: height * 0.05,
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          // setState(() {
                                          //   bed--;
                                          // });
                                          // print(bed);
                                          // checkvaccineBookCart(
                                          //     _aadharNumberController.text
                                          //         .trim(),
                                          //     context,
                                          //     widget.vaccine.organization);
                                          // Navigator.of(context).pop();
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
                                                        style:
                                                            GoogleFonts.raleway(
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

  counter() {}
}
