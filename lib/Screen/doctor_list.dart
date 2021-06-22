import 'package:covidcheck/Screen/doctorDetails.dart';
import 'package:covidcheck/models/orgServiecs.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:velocity_x/velocity_x.dart';

class DoctorList extends StatefulWidget {
  OrgModel doctorList;
  DoctorList({this.doctorList});

  @override
  _DoctorListState createState() => _DoctorListState();
}

class _DoctorListState extends State<DoctorList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.doctorList.organization + " " + "Doctor List",
          style: GoogleFonts.raleway(fontSize: 18.0),
        ),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.all(8.0),
        child: VStack([
          _doctors(
              widget.doctorList.doctor1,
              widget.doctorList.doc1des,
              widget.doctorList.doc1fees,
              "assets/doc.jpg",
              context,
              widget.doctorList,
              widget.doctorList.organization),
          _doctors(
              widget.doctorList.doctor2,
              widget.doctorList.doc2des,
              widget.doctorList.doc2fees,
              "assets/dcotor2.jpg",
              context,
              widget.doctorList,
              widget.doctorList.organization),
          _doctors(
              widget.doctorList.doctor3,
              widget.doctorList.doc3des,
              widget.doctorList.doc3fees,
              "assets/doctor3.jpg",
              context,
              widget.doctorList,
              widget.doctorList.organization)
        ]),
      ),
    );
  }

  Widget _doctors(String name, String description, int fee, String imgeurl,
      BuildContext context, OrgModel orgModel, String orgname) {
    return InkWell(
      onTap: () => Get.to(DoctorDetails(
        doctorDetails: orgModel,
        doctorName: name,
        doctordes: description,
        herotag: name,
        fee: fee,
        image: imgeurl,
        orgname: orgname,
      )),
      child: Container(
        padding: EdgeInsets.all(5.0),
        margin: EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          color: Color(0xFF48544c),
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(15.0),
              child: Row(
                children: <Widget>[
                  Container(
                    height: 60.0,
                    width: 60.0,
                    decoration: BoxDecoration(
                      color: Colors.blue[900],
                      shape: BoxShape.circle,
                      // boxShadow: [
                      //   BoxShadow(
                      //     color: Colors.grey,
                      //     blurRadius: 1.0,
                      //     spreadRadius: 1.0,
                      //     offset: Offset(0.0, 2.3),
                      //   )
                      // ],
                    ),
                    child: Container(
                      padding: EdgeInsets.all(3.0),
                      child: Center(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(40.0),
                          child: Image(
                            height: 85.0,
                            width: 85.0,
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
                            fontSize: 16.0, fontWeight: FontWeight.w600),
                      ),
                      SizedBox(
                        height: 5.0,
                      ),
                      Row(
                        children: <Widget>[
                          Text(
                            description,
                            style: GoogleFonts.raleway(
                                fontSize: 12.0,
                                textStyle: TextStyle(
                                  color: Colors.white,
                                )),
                          ),
                        ],
                      )
                    ],
                  )
                ],
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(
                FontAwesomeIcons.bookMedical,
                color: Colors.blueAccent,
                size: 30.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
