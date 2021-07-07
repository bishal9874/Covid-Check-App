import 'package:cloud_firestore/cloud_firestore.dart';

class OxygenModel {
  String organization;
  String submitTime;
  Timestamp dateTime;
  String userUid;
  String useremail;
  String username;
  String bookingName;
  String phonenumber;
  String rentOrbuy;
  String selectLtorMl;
  String docNumber;
  String areaname;
  int pinCode;
  String reason;
  String verificationUrl;
  bool adminApproval;

  OxygenModel(
      {this.organization,
      this.bookingName,
      this.submitTime,
      this.pinCode,
      this.dateTime,
      this.phonenumber,
      this.userUid,
      this.useremail,
      this.username,
      this.docNumber,
      this.verificationUrl,
      this.rentOrbuy,
      this.adminApproval,
      this.areaname,
      this.selectLtorMl,
      this.reason});

  OxygenModel.fromJson(Map<String, dynamic> json) {
    organization = json['oxygenCentre'];
    submitTime = json['submit_time'];
    username = json['username'];
    userUid = json['userUI'];
    useremail = json['useremail'];
    bookingName = json['name'];
    pinCode = json['pin'];
    phonenumber = json['phone_number'];
    docNumber = json['docnumber'];
    verificationUrl = json['verificationUrl'];
    dateTime = json['dateSelected'];
    rentOrbuy = json['rentorbuy'];
    selectLtorMl = json['selectLt/ml'];
    reason = json['Reason'];
    areaname = json['areaName'];
    adminApproval = json['adminApproval'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['oxygenCentre'] = this.organization;
    data['username'] = this.username;
    data['userUI'] = this.userUid;
    data['useremail'] = this.useremail;
    data['name'] = this.bookingName;
    data['areaName'] = this.areaname;
    data['pin'] = this.pinCode;
    data['phone_number'] = this.phonenumber;
    data['rentorbuy'] = this.rentOrbuy;
    data['selectLt/ml'] = this.selectLtorMl;
    data['verificationUrl'] = this.verificationUrl;
    data['adminApproval'] = this.adminApproval;
    data['Reason'] = this.reason;
    data['docnumber'] = this.docNumber;
    data['dateSelected'] = this.dateTime;

    // data['price'] = this.price;
    if (this.submitTime != null) {
      data['submit_time'] = this.submitTime;
    }
    return data;
  }
}

class PublishedDate {
  String date;

  PublishedDate({this.date});

  PublishedDate.fromJson(Map<String, dynamic> json) {
    date = json['$date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['$date'] = this.date;
    return data;
  }
}
