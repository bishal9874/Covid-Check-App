import 'package:covidcheck/models/orgServiecs.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class DoctorAppointment extends StatefulWidget {
  final OrgModel doctors;
  DoctorAppointment({this.doctors});

  @override
  _DoctorAppointmentState createState() => _DoctorAppointmentState();
}

class _DoctorAppointmentState extends State<DoctorAppointment> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: VStack([
          SizedBox(
            height: 20.0,
          ),
          Text(widget.doctors.doctor1),
          Text(widget.doctors.doctor2),
          Text(widget.doctors.doctor3),
          Text(widget.doctors.doc1des),
          Text(widget.doctors.doc2des),
          Text(widget.doctors.doc3des),
          Text(widget.doctors.doc1fees.toString()),
          Text(widget.doctors.doc2fees.toString()),
          Text(widget.doctors.doc3fees.toString()),
          Text(widget.doctors.orgaddress),
          Text(widget.doctors.orgCity),
          Text(widget.doctors.orgDistrict),
          Text(widget.doctors.email),
          Text(widget.doctors.pinNumber.toString()),
          Text(widget.doctors.contact.toString()),
        ]),
      ),
    );
  }
}
