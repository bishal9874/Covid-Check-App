import 'package:covidcheck/Screen/doctorDetails.dart';
import 'package:covidcheck/models/orgServiecs.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
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
      //backgroundColor: Colors.blueGrey[1000],
      appBar: AppBar(
        backgroundColor: Colors.blueGrey[700],
        title: Text(
          widget.doctorList.organization + " " + "Doctor List",
          style: GoogleFonts.comfortaa(fontSize: 18.0),
        ),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.all(8.0),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          _doctors(
            widget.doctorList.doctor1,
            widget.doctorList.doc1des,
            widget.doctorList.doc1fees,
            "assets/doc.jpg",
            context,
            widget.doctorList,
            widget.doctorList.organization,
            widget.doctorList.doctor1day1date.toDate().day.toString() +
                "/" +
                widget.doctorList.doctor1day1date.toDate().month.toString() +
                "/" +
                widget.doctorList.doctor1day1date.toDate().year.toString(),
            widget.doctorList.doctor1day1view,
            widget.doctorList.doctor1day1schedule,
            widget.doctorList.doctor1day2date.toDate().day.toString() +
                "/" +
                widget.doctorList.doctor1day2date.toDate().month.toString() +
                "/" +
                widget.doctorList.doctor1day2date.toDate().year.toString(),
            widget.doctorList.doctor1day2view,
            widget.doctorList.doctor1day2schedule,
            widget.doctorList.doctor1day3date.toDate().day.toString() +
                "/" +
                widget.doctorList.doctor1day3date.toDate().month.toString() +
                "/" +
                widget.doctorList.doctor1day3date.toDate().year.toString(),
            widget.doctorList.doctor1day3view,
            widget.doctorList.doctor1day3schedule,
          ),
          _doctors(
            widget.doctorList.doctor2,
            widget.doctorList.doc2des,
            widget.doctorList.doc2fees,
            "assets/dcotor2.jpg",
            context,
            widget.doctorList,
            widget.doctorList.organization,
            widget.doctorList.doctor2day1date.toDate().day.toString() +
                "/" +
                widget.doctorList.doctor2day1date.toDate().month.toString() +
                "/" +
                widget.doctorList.doctor2day1date.toDate().year.toString(),
            widget.doctorList.doctor2day1view,
            widget.doctorList.doctor2day1schedule,
            widget.doctorList.doctor2day2date.toDate().day.toString() +
                "/" +
                widget.doctorList.doctor2day2date.toDate().month.toString() +
                "/" +
                widget.doctorList.doctor2day2date.toDate().year.toString(),
            widget.doctorList.doctor2day2view,
            widget.doctorList.doctor2day2schedule,
            widget.doctorList.doctor2day3date.toDate().day.toString() +
                "/" +
                widget.doctorList.doctor2day3date.toDate().month.toString() +
                "/" +
                widget.doctorList.doctor2day3date.toDate().year.toString(),
            widget.doctorList.doctor2day3view,
            widget.doctorList.doctor2day3schedule,
          ),
          _doctors(
            widget.doctorList.doctor3,
            widget.doctorList.doc3des,
            widget.doctorList.doc3fees,
            "assets/doctor3.jpg",
            context,
            widget.doctorList,
            widget.doctorList.organization,
            widget.doctorList.doctor3day1date.toDate().day.toString() +
                "/" +
                widget.doctorList.doctor3day1date.toDate().month.toString() +
                "/" +
                widget.doctorList.doctor3day1date.toDate().year.toString(),
            widget.doctorList.doctor3day1view,
            widget.doctorList.doctor3day1schedule,
            widget.doctorList.doctor3day2date.toDate().day.toString() +
                "/" +
                widget.doctorList.doctor3day2date.toDate().month.toString() +
                "/" +
                widget.doctorList.doctor3day2date.toDate().year.toString(),
            widget.doctorList.doctor3day2view,
            widget.doctorList.doctor3day2schedule,
            widget.doctorList.doctor3day3date.toDate().day.toString() +
                "/" +
                widget.doctorList.doctor3day3date.toDate().month.toString() +
                "/" +
                widget.doctorList.doctor2day3date.toDate().year.toString(),
            widget.doctorList.doctor3day3view,
            widget.doctorList.doctor3day3schedule,
          )
        ]),
      ),
    );
  }

  Widget _doctors(
    String name,
    String description,
    int fee,
    String imgeurl,
    BuildContext context,
    OrgModel orgModel,
    String orgname,
    String day1time,
    int day1view,
    String day1schedule,
    String day2time,
    int day2view,
    String day2schedule,
    String day3time,
    int day3view,
    String day3schedule,
  ) {
    return InkWell(
      onTap: () => Get.to(DoctorDetails(
        doctorDetails: orgModel,
        doctorName: name,
        doctordes: description,
        herotag: name,
        fee: fee,
        image: imgeurl,
        orgname: orgname,
        day1date: day1time,
        day1view: day1view,
        day1schedule: day1schedule,
        day2date: day2time,
        day2view: day2view,
        day2schedule: day2schedule,
        day3date: day3time,
        day3view: day3view,
        day3schedule: day3schedule,
      )),
      child: Container(
        padding: EdgeInsets.all(5.0),
        margin: EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          color: Colors.blueGrey[800],
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
                        style: GoogleFonts.comfortaa(
                            fontSize: 16.0, fontWeight: FontWeight.w600),
                      ),
                      SizedBox(
                        height: 5.0,
                      ),
                      Row(
                        children: <Widget>[
                          Text(
                            description,
                            style: GoogleFonts.comfortaa(
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
