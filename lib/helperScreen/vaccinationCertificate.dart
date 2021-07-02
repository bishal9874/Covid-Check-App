import 'package:covidcheck/helperScreen/appointment.dart';
import 'package:covidcheck/models/vaccinationModel.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:velocity_x/velocity_x.dart';

class VaccinationCertificate extends StatefulWidget {
  final VaccineModel vaccineModel;

  VaccinationCertificate({Key key, this.vaccineModel}) : super(key: key);

  @override
  _VaccinationCertificateState createState() => _VaccinationCertificateState();
}

class _VaccinationCertificateState extends State<VaccinationCertificate> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: _buildAppBar(context), body: _buildBody(context));
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
          Text("Vaccination Certifiacte",
              style: GoogleFonts.comfortaa(fontSize: 18.0)),
          IconButton(onPressed: () {}, icon: Icon(Icons.more_vert_rounded)),
        ],
      ),
    );
  }

  _buildBody(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Container(
      height: height * 0.90,
      width: width * 1.0,
      margin: EdgeInsets.all(8.0),
      padding: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(5.0)),
      child: VStack([
        Container(
          height: height * 0.17,
          decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.cover, image: AssetImage("assets/govt.jpg")),
          ),
        ),
        Text("Provisional Certificate for COVID-19 Vaccination",
            style: GoogleFonts.comfortaa(
              fontSize: 14.0,
              color: Colors.blue[700],
              fontWeight: FontWeight.w700,
            )).centered(),
        SizedBox(
          height: height * 0.02,
        ),
        Text("Beneficiary Deatails",
                style: GoogleFonts.comfortaa(
                    fontSize: 13.0,
                    color: Colors.blue[700],
                    fontWeight: FontWeight.w700,
                    decoration: TextDecoration.underline))
            .marginOnly(left: 5.0),
        SizedBox(
          height: height * 0.01,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              margin: EdgeInsets.only(left: 5.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Beneficiary Name / সুিবধােভাগীর নাম",
                      style: GoogleFonts.comfortaa(
                        fontSize: 13.0,
                        color: Colors.black,
                      )),
                  SizedBox(
                    height: height * 0.01,
                  ),
                  Text("Birth Year / জন্ম সাল",
                      style: GoogleFonts.comfortaa(
                        fontSize: 13.0,
                        color: Colors.black,
                      )),
                  SizedBox(
                    height: height * 0.01,
                  ),
                  Text("Gender/ লিঙ্গ ",
                      style: GoogleFonts.comfortaa(
                        fontSize: 13.0,
                        color: Colors.black,
                      )),
                  SizedBox(
                    height: height * 0.01,
                  ),
                  Text("Aadhar ID / আধার আই িড ",
                      style: GoogleFonts.comfortaa(
                        fontSize: 13.0,
                        color: Colors.black,
                      )),
                  SizedBox(
                    height: height * 0.01,
                  ),
                  Text("Beneficiary Reference ID ",
                      style: GoogleFonts.comfortaa(
                        fontSize: 13.0,
                        color: Colors.black,
                      )),
                  SizedBox(
                    height: height * 0.01,
                  ),
                ],
              ),
            ),
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(widget.vaccineModel.nameofvacciner,
                      style: GoogleFonts.comfortaa(
                          fontSize: 13.0,
                          color: Colors.black,
                          fontWeight: FontWeight.w800)),
                  SizedBox(
                    height: height * 0.01,
                  ),
                  Text(widget.vaccineModel.birthyr.toString(),
                      style: GoogleFonts.comfortaa(
                          fontSize: 13.0,
                          color: Colors.black,
                          fontWeight: FontWeight.w800)),
                  SizedBox(
                    height: height * 0.01,
                  ),
                  Text(widget.vaccineModel.genderChoice,
                      style: GoogleFonts.comfortaa(
                          fontSize: 13.0,
                          color: Colors.black,
                          fontWeight: FontWeight.w800)),
                  SizedBox(
                    height: height * 0.01,
                  ),
                  Text(widget.vaccineModel.aadherNumber.toString(),
                      style: GoogleFonts.comfortaa(
                          fontSize: 13.0,
                          color: Colors.black,
                          fontWeight: FontWeight.w800)),
                  SizedBox(
                    height: height * 0.01,
                  ),
                  Text(
                      widget.vaccineModel.publishedDate
                          .toDate()
                          .millisecondsSinceEpoch
                          .toString(),
                      style: GoogleFonts.comfortaa(
                          fontSize: 13.0,
                          color: Colors.black,
                          fontWeight: FontWeight.w800)),
                  SizedBox(
                    height: height * 0.01,
                  ),
                ],
              ),
            )
          ],
        ),
        SizedBox(
          height: height * 0.02,
        ),
        Text("Vaccination Deatails",
                style: GoogleFonts.comfortaa(
                    fontSize: 13.0,
                    color: Colors.blue[700],
                    fontWeight: FontWeight.w700,
                    decoration: TextDecoration.underline))
            .marginOnly(left: 5.0),
        SizedBox(
          height: height * 0.01,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              margin: EdgeInsets.only(left: 5.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Vaccine Name / ভ্যাকসিন নাম ",
                      style: GoogleFonts.comfortaa(
                        fontSize: 13.0,
                        color: Colors.black,
                      )),
                  SizedBox(
                    height: height * 0.01,
                  ),
                  Text("Dose Age /ডোজ বয়স",
                      style: GoogleFonts.comfortaa(
                        fontSize: 13.0,
                        color: Colors.black,
                      )),
                  SizedBox(
                    height: height * 0.01,
                  ),
                  Text("Date of Dose / ডোজ তারিখ",
                      style: GoogleFonts.comfortaa(
                        fontSize: 13.0,
                        color: Colors.black,
                      )),
                  SizedBox(
                    height: height * 0.01,
                  ),
                  Text("Vaccination centre/ টিকা কেন্দ্র",
                      style: GoogleFonts.comfortaa(
                        fontSize: 13.0,
                        color: Colors.black,
                      )),
                  SizedBox(
                    height: height * 0.01,
                  ),
                ],
              ),
            ),
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(widget.vaccineModel.vacineChoice,
                      style: GoogleFonts.comfortaa(
                          fontSize: 13.0,
                          color: Colors.black,
                          fontWeight: FontWeight.w800)),
                  SizedBox(
                    height: height * 0.01,
                  ),
                  Text(widget.vaccineModel.underag,
                      style: GoogleFonts.comfortaa(
                          fontSize: 13.0,
                          color: Colors.black,
                          fontWeight: FontWeight.w800)),
                  SizedBox(
                    height: height * 0.01,
                  ),
                  Text(widget.vaccineModel.dateTime,
                      style: GoogleFonts.comfortaa(
                          fontSize: 13.0,
                          color: Colors.black,
                          fontWeight: FontWeight.w800)),
                  SizedBox(
                    height: height * 0.01,
                  ),
                  Text(widget.vaccineModel.organization,
                      style: GoogleFonts.comfortaa(
                          fontSize: 13.0,
                          color: Colors.black,
                          fontWeight: FontWeight.w800)),
                  SizedBox(
                    height: height * 0.01,
                  ),
                ],
              ),
            )
          ],
        ),
        SizedBox(
          height: height * 0.02,
        ),
        Container(
          height: height * 0.22,
          decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.cover, image: AssetImage("assets/modi.jpg")),
          ),
        ),
        SizedBox(
          height: height * 0.01,
        ),
        RichText(
          text: TextSpan(
            style: TextStyle(fontSize: 20.0),
            children: <TextSpan>[
              TextSpan(
                  text: 'Covid',
                  style: GoogleFonts.comfortaa(
                      fontWeight: FontWeight.w600, color: Colors.black)),
              TextSpan(
                  text: 'Check!',
                  style: GoogleFonts.comfortaa(
                      fontWeight: FontWeight.w600, color: Colors.blue)),
            ],
          ),
        ).centered(),
      ]).scrollVertical(),
    );
  }
}
