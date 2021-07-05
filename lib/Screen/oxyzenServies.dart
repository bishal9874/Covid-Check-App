import 'dart:io';

import 'package:covidcheck/models/orgServiecs.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:velocity_x/velocity_x.dart';

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
  final TextEditingController _districtController = new TextEditingController();
  final TextEditingController _cityController = new TextEditingController();
  final TextEditingController _pinController = new TextEditingController();
  final TextEditingController _phonenumberController =
      new TextEditingController();
  final TextEditingController _reasonsController = new TextEditingController();

  String literOrMlChoice = "";
  String rentOrbuyChoice = "";
  String address, name, reason, phonenumber, pin, city, district;

  DateTime birthDate = DateTime.now();
  DateTime dateTime = DateTime.now();
  String bedbookingID = DateTime.now().millisecondsSinceEpoch.toString();
  File _file;
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
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
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
                // Column(
                //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //   children: [
                //     TextFormField(
                //         controller: _addressController,
                //         decoration: InputDecoration(
                //           filled: true,
                //           fillColor: Colors.blue[80],
                //           hintText: "Area Name",
                //           hintStyle: GoogleFonts.comfortaa(),
                //           errorBorder: OutlineInputBorder(
                //               borderRadius:
                //                   BorderRadius.all(Radius.circular(10)),
                //               borderSide:
                //                   BorderSide(width: 1, color: Colors.red)),
                //           focusedErrorBorder: OutlineInputBorder(
                //             borderRadius: BorderRadius.all(Radius.circular(10)),
                //           ),
                //           border: OutlineInputBorder(
                //             borderSide: BorderSide(color: Colors.white),
                //             borderRadius: const BorderRadius.all(
                //               const Radius.circular(10.0),
                //             ),
                //           ),
                //         ),
                //         onChanged: (value) {
                //           this.address = value;
                //         },
                //         validator: (value) =>
                //             value.isEmpty ? 'Address is required' : null),
                //     SizedBox(
                //       height: height * 0.01,
                //     ),
                //     TextFormField(
                //         controller: _phonenumberController,
                //         decoration: InputDecoration(
                //           filled: true,
                //           fillColor: Colors.blue[80],
                //           hintText: "District",
                //           hintStyle: GoogleFonts.comfortaa(),
                //           errorBorder: OutlineInputBorder(
                //               borderRadius:
                //                   BorderRadius.all(Radius.circular(10)),
                //               borderSide:
                //                   BorderSide(width: 1, color: Colors.red)),
                //           focusedErrorBorder: OutlineInputBorder(
                //             borderRadius: BorderRadius.all(Radius.circular(10)),
                //           ),
                //           border: OutlineInputBorder(
                //             borderSide: BorderSide(color: Colors.white),
                //             borderRadius: const BorderRadius.all(
                //               const Radius.circular(10.0),
                //             ),
                //           ),
                //         ),
                //         keyboardType: TextInputType.number,
                //         inputFormatters: <TextInputFormatter>[
                //           FilteringTextInputFormatter.digitsOnly
                //         ],
                //         onChanged: (value) {
                //           this.district = value;
                //         },
                //         validator: (value) {
                //           if (value.isEmpty) {
                //             return "Address Required";
                //           }
                //           return null;
                //         }),
                //   ],
                // ),
                // Text("Select Vaccine",
                //         style: GoogleFonts.comfortaa(
                //             fontSize: 15.0, fontWeight: FontWeight.w700))
                //     .p1(),
                // Container(
                //   child: Wrap(
                //     spacing: 8.0,
                //     children: <Widget>[
                //       _buildChoiceList(widget.vaccine.vaccine1),
                //       _buildChoiceList(widget.vaccine.vaccine2),
                //       _buildChoiceList(widget.vaccine.vaccine3),
                //     ],
                //   ),
                // ),

                ///
                ///
                ///
                ///
                ///

////
                ///
                ///
                ///
                ///
                ///
                ///
                // SizedBox(
                //   height: 15.0,
                // ),
                // Text("Under Age",
                //         style: GoogleFonts.comfortaa(
                //             fontSize: 13.0, fontWeight: FontWeight.w700))
                //     .p1(),
                // Container(
                //   child: Wrap(
                //     spacing: 8.0,
                //     children: <Widget>[
                //       _ageChoiceList("18+"),
                //       _ageChoiceList("45+"),
                //     ],
                //   ),
                // ),
                // if (widget.vaccine.vaccine1day1available != 0)
                //   Text(widget.vaccine.vaccine1day1available.toString())
                // else
                //   Text("out of stock"),
                SizedBox(
                  height: 15.0,
                ),

                Text("Select Varient",
                        style: GoogleFonts.comfortaa(
                            fontSize: 13.0, fontWeight: FontWeight.w700))
                    .p1(),
                // SizedBox(
                //   height: height * 0.01,
                // ),
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
                      (_file != null)
                          ? (rentOrbuyChoice != "")
                              ? (literOrMlChoice != "")
                                  ? showDialog(
                                      context: context,
                                      builder: (c) {
                                        return AlertDialog(
                                          contentPadding: EdgeInsets.all(8.0),
                                          content: Container(
                                              height: height * 0.50,
                                              width: width * 0.80,
                                              child: Column(
                                                // mainAxisAlignment:
                                                //     MainAxisAlignment.center,
                                                children: [
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
                                                  SizedBox(
                                                    height: height * 0.01,
                                                  ),
                                                  TextFormField(
                                                      controller:
                                                          _cityController,
                                                      decoration:
                                                          InputDecoration(
                                                        filled: true,
                                                        fillColor:
                                                            Colors.blue[80],
                                                        hintText: "City Name",
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
                                                        this.city = value;
                                                      },
                                                      validator: (value) => value
                                                              .isEmpty
                                                          ? 'Field is required'
                                                          : null),
                                                  SizedBox(
                                                    height: height * 0.01,
                                                  ),
                                                  TextFormField(
                                                      controller:
                                                          _districtController,
                                                      decoration:
                                                          InputDecoration(
                                                        filled: true,
                                                        fillColor:
                                                            Colors.blue[80],
                                                        hintText: "District",
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
                                                        this.district = value;
                                                      },
                                                      validator: (value) {
                                                        if (value.isEmpty) {
                                                          return "District Required";
                                                        }
                                                        return null;
                                                      }),
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
                                                  Text(
                                                      "You Just Pay ₹ ${widget.oxygen.minimumoygenprice} for Oxyzen Services"),
                                                  SizedBox(
                                                    height: height * 0.05,
                                                  ),
                                                  GestureDetector(
                                                    onTap: () {
                                                      if (checkFields())
                                                        VxToast.show(context,
                                                            msg: "hello Fucker",
                                                            position:
                                                                VxToastPosition
                                                                    .bottom,
                                                            bgColor:
                                                                Colors.red[400],
                                                            showTime: 5000,
                                                            textColor:
                                                                Colors.white);

                                                      // checkvaccineBookCart(
                                                      //     widget.vaccine.docnumber,
                                                      //     _aadharNumberController.text
                                                      //         .trim(),
                                                      //     context,
                                                      //     widget.vaccine.organization);
                                                      // //sendSms();
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
}
