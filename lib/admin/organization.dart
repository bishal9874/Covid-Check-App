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
  String doctor1schedule = "";
  String doctor2schedule = "";
  String doctor3schedule = "";

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
      priceOfvacine,
      priceOfappintment,
      priceOfbed,
      bloodbank,
      oxygen,
      ambulenceNumber;
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
            HStack([
              Wrap(
                spacing: 2.0,
                children: [
                  _doctor1schedule("9am to 2pm"),
                  _doctor1schedule("8am to 4pm"),
                  _doctor1schedule("10am to 3pm"),
                  _doctor1schedule("Not Available"),
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
            HStack([
              Wrap(
                spacing: 2.0,
                children: [
                  _doctor2schedule("7am to 2pm"),
                  _doctor2schedule("10am to 4pm"),
                  _doctor2schedule("12am to 6pm"),
                  _doctor2schedule("not available"),
                ],
              )
            ]).scrollHorizontal(),
            SizedBox(
              height: 15.0,
            ),
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
            HStack([
              Wrap(
                spacing: 2.0,
                children: [
                  _doctor3schedule("7am to 2pm"),
                  _doctor3schedule("10am to 4pm"),
                  _doctor3schedule("12am to 6pm"),
                  _doctor3schedule("Not Available"),
                ],
              )
            ]).scrollHorizontal(),
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
  _doctor1schedule(String time) {
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
        selected: doctor1schedule == time,
        onSelected: (bool val) {
          setState(() {
            doctor1schedule = time;
            print(doctor1schedule);
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
  ///
  _doctor2schedule(String time) {
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
        selected: doctor2schedule == time,
        onSelected: (bool val) {
          setState(() {
            doctor2schedule = time;
            print(doctor2schedule);
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
  _doctor3schedule(String time) {
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
        selected: doctor3schedule == time,
        onSelected: (bool val) {
          setState(() {
            doctor3schedule = time;
            print(doctor3schedule);
          });
        },
      ),
    );
  }

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

    details.doc(oranizationID).set({
      "organization": _organizationName.text.trim(),
      "doctor1": _doctor1Name.text.trim(),
      "doctor1des": _doctor1description.text.trim(),
      "doctor1fees": int.parse(_doctorfees1.text.trim()),
      "doctor2": _doctor2Name.text.trim(),
      "doctor2des": _doctor2description.text.trim(),
      "doctor2fees": int.parse(_doctorfees2.text.trim()),
      "doctor3": _doctor3Name.text.trim(),
      "doctor3des": _doctor3description.text.trim(),
      "doctor3fees": int.parse(_doctorfees3.text.trim()),
      "vaccine1": _vaccine1Name.text.trim(),
      "vaccine2": _vaccine2Name.text.trim(),
      "vaccine3": _vaccine3Name.text.trim(),
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
      "doctor1schedule": doctor1schedule,
      "doctor2schedule": doctor2schedule,
      "doctor3schedule": doctor3schedule,
      "minimumAppointprice":
          int.parse(_minimun_price_of_Appointment.text.trim()),
      "minimumvaccineprice":
          int.parse(_minimun_price_of_vacination.text.trim()),
      "minimumbedprice": int.parse(_minimun_price_of_bedBooking.text.trim()),
      "minimumbloodprice":
          int.parse(_minimun_price_of_bloodbankServices.text.trim()),
      "normalbedAvailable": int.parse(_normalBed.text.trim()),
      "emergencybedAvailable": int.parse(_emergencyBed.text.trim()),
      "minimumoygenprice":
          int.parse(_minimun_price_of_oxygenServices.text.trim()),
      "AmbulanceNumber": int.parse(_phoneNumber_of_ambulance.text.trim())
    });

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
