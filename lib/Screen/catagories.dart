import 'package:covidcheck/Screen/bedBooking.dart';
import 'package:covidcheck/Screen/bloodbook.dart';
import 'package:covidcheck/Screen/contactUs.dart';
import 'package:covidcheck/Screen/doctor_list.dart';
import 'package:covidcheck/Screen/oxyzenServies.dart';
import 'package:covidcheck/Screen/vaccineDetails.dart';
import 'package:covidcheck/counter/booking_counter.dart';
import 'package:covidcheck/models/orgServiecs.dart';
import 'package:covidcheck/models/vaccinationModel.dart';
import 'package:covidcheck/services/ser.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:velocity_x/velocity_x.dart';

class OrgDetailPage extends StatefulWidget {
  final OrgModel orgModel;
  VaccineModel vaccineModel;

  OrgDetailPage({this.orgModel, this.vaccineModel});
  @override
  _OrgDetailPageState createState() => _OrgDetailPageState();
}

class _OrgDetailPageState extends State<OrgDetailPage> {
  @override
  Widget build(
    BuildContext context,
  ) {
    return Scaffold(
        backgroundColor: Colors.blueGrey[900],
        appBar: AppBar(
          title: Text(
            widget.orgModel.organization,
            style: GoogleFonts.raleway(
              fontSize: 22.0,
            ),
          ),
          centerTitle: true,
          leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Icon(Icons.arrow_back_ios),
          ),
        ),
        body: Container(
          child: VStack([
            HStack([vaccines(context), doctorAppointMent(context)]),
            HStack([bedBooking(context), oxygenbooking(context)]),
            bloodbankservies(context),
            ambulanceservices(context),
            contactUs(context)
          ]).scrollVertical(),
        ));
  }

  vaccines(BuildContext context, {Color background, removeCartFunction}) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return InkWell(
        onTap: () {
          Get.to(VaccineDetails(vaccine: widget.orgModel));
        },
        splashColor: Colors.grey,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            height: height * 0.35,
            width: width * 0.40,
            margin: EdgeInsets.all(10.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              image: DecorationImage(
                  fit: BoxFit.cover, image: AssetImage("assets/vaccine.jpg")),
            ),
            child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    gradient: LinearGradient(
                        begin: Alignment.bottomRight,
                        stops: [
                          0.1,
                          0.9
                        ],
                        colors: [
                          Colors.black.withOpacity(.8),
                          Colors.black.withOpacity(.1)
                        ])),
                child: Align(
                  alignment: Alignment.bottomLeft,
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Text(
                      "Vaccine",
                      style: GoogleFonts.comfortaa(
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                          fontSize: 20),
                    ),
                  ),
                )),
          ),
        ));
  }

  doctorAppointMent(BuildContext context,
      {Color background, removeCartFunction}) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return InkWell(
        onTap: () {
          Get.to(DoctorList(doctorList: widget.orgModel));
        },
        splashColor: Colors.grey,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            height: height * 0.35,
            width: width * 0.40,
            margin: EdgeInsets.all(10.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage("assets/Doctor Appointment.jpg")),
            ),
            child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    gradient: LinearGradient(
                        begin: Alignment.bottomRight,
                        stops: [
                          0.1,
                          0.9
                        ],
                        colors: [
                          Colors.black.withOpacity(.8),
                          Colors.black.withOpacity(.1)
                        ])),
                child: Align(
                  alignment: Alignment.bottomLeft,
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Text(
                      "Dcotor Appointments",
                      style: GoogleFonts.comfortaa(
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                          fontSize: 16),
                    ),
                  ),
                )),
          ),
        ));
  }

  bedBooking(BuildContext context, {Color background, removeCartFunction}) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return InkWell(
        onTap: () {
          Get.to(BedBooking(
            bedbooking: widget.orgModel,
          ));
        },
        splashColor: Colors.grey,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            height: height * 0.35,
            width: width * 0.40,
            margin: EdgeInsets.all(10.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              image: DecorationImage(
                  fit: BoxFit.cover, image: AssetImage("assets/bed.jpg")),
            ),
            child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    gradient: LinearGradient(
                        begin: Alignment.bottomRight,
                        stops: [
                          0.1,
                          0.9
                        ],
                        colors: [
                          Colors.black.withOpacity(.8),
                          Colors.black.withOpacity(.1)
                        ])),
                child: Align(
                  alignment: Alignment.bottomLeft,
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Text(
                      "Bed Booking",
                      style: GoogleFonts.comfortaa(
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                          fontSize: 16),
                    ),
                  ),
                )),
          ),
        ));
  }

  oxygenbooking(BuildContext context, {Color background, removeCartFunction}) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return InkWell(
        onTap: () {
          Get.to(OxygenServices(
            oxygen: widget.orgModel,
          ));
        },
        splashColor: Colors.grey,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            height: height * 0.35,
            width: width * 0.40,
            margin: EdgeInsets.all(10.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              image: DecorationImage(
                  fit: BoxFit.cover, image: AssetImage("assets/oxygen.jpg")),
            ),
            child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    gradient: LinearGradient(
                        begin: Alignment.bottomRight,
                        stops: [
                          0.1,
                          0.9
                        ],
                        colors: [
                          Colors.black.withOpacity(.8),
                          Colors.black.withOpacity(.1)
                        ])),
                child: Align(
                  alignment: Alignment.bottomLeft,
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Text(
                      "Oxygen Services",
                      style: GoogleFonts.comfortaa(
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                          fontSize: 16),
                    ),
                  ),
                )),
          ),
        ));
  }

  ambulanceservices(BuildContext context,
      {Color background, removeCartFunction}) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return InkWell(
        onTap: () {
          // Get.to(VaccineDetails(vaccine: widget.orgModel));
        },
        splashColor: Colors.grey,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            height: height * 0.30,
            width: width * 0.90,
            margin: EdgeInsets.all(10.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              image: DecorationImage(
                  fit: BoxFit.cover, image: AssetImage("assets/ambulance.jpg")),
            ),
            child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    gradient: LinearGradient(
                        begin: Alignment.bottomRight,
                        stops: [
                          0.1,
                          0.9
                        ],
                        colors: [
                          Colors.black.withOpacity(.8),
                          Colors.black.withOpacity(.1)
                        ])),
                child: Align(
                  alignment: Alignment.bottomLeft,
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Text(
                      "Ambulance",
                      style: GoogleFonts.comfortaa(
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                          fontSize: 20),
                    ),
                  ),
                )),
          ),
        ));
  }

  bloodbankservies(BuildContext context,
      {Color background, removeCartFunction}) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return InkWell(
        onTap: () {
          Get.to(BloodServices(
            bloodservice: widget.orgModel,
          ));
        },
        splashColor: Colors.grey,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            height: height * 0.20,
            width: width * 0.90,
            margin: EdgeInsets.all(10.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              image: DecorationImage(
                  fit: BoxFit.cover, image: AssetImage("assets/blood.jpg")),
            ),
            child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    gradient: LinearGradient(
                        begin: Alignment.bottomRight,
                        stops: [
                          0.1,
                          0.9
                        ],
                        colors: [
                          Colors.black.withOpacity(.8),
                          Colors.black.withOpacity(.1)
                        ])),
                child: Align(
                  alignment: Alignment.bottomLeft,
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Text(
                      "Blood Bank",
                      style: GoogleFonts.comfortaa(
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                          fontSize: 16),
                    ),
                  ),
                )),
          ),
        ));
  }

  contactUs(BuildContext context, {Color background, removeCartFunction}) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return InkWell(
        onTap: () {
          Get.to(ContactUS(contact: widget.orgModel));
        },
        splashColor: Colors.grey,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            height: height * 0.10,
            width: width * 0.90,
            margin: EdgeInsets.all(10.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              image: DecorationImage(
                  fit: BoxFit.cover, image: AssetImage("assets/ContactUs.jpg")),
            ),
            child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    gradient: LinearGradient(
                        begin: Alignment.bottomRight,
                        stops: [
                          0.1,
                          0.9
                        ],
                        colors: [
                          Colors.black.withOpacity(.8),
                          Colors.black.withOpacity(.1)
                        ])),
                child: Align(
                  alignment: Alignment.bottomLeft,
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Text(
                      "Contact Us",
                      style: GoogleFonts.comfortaa(
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                          fontSize: 16),
                    ),
                  ),
                )),
          ),
        ));
  }
}
