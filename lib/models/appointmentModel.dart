import 'package:cloud_firestore/cloud_firestore.dart';

class AppointModel {
  String organization;
  String refaranceID;
  String dayselected;
  String userUid;
  String useremail;
  String username;
  String genderChoice;
  String phoneNumber;
  String age;
  String doctorFee;
  String doctorName;
  String nameofpatient;
  String docnumber;
  String daySchedule;

  AppointModel(
      {this.organization,
      this.nameofpatient,
      this.refaranceID,
      this.age,
      this.dayselected,
      this.doctorName,
      this.doctorFee,
      this.userUid,
      this.useremail,
      this.username,
      this.docnumber,
      this.genderChoice,
      this.phoneNumber,
      this.daySchedule});

  AppointModel.fromJson(Map<String, dynamic> json) {
    organization = json['doctorAppointCentre'];
    refaranceID = json['submit_time'];
    username = json['username'];
    userUid = json['userUI'];
    useremail = json['useremail'];
    nameofpatient = json['name'];
    age = json['age'];
    docnumber = json['docnumber'];
    doctorFee = json['doctorFee'];
    doctorName = json['doctorName'];
    dayselected = json['dateSelection'];
    genderChoice = json['gender'];
    phoneNumber = json['phone_number'];
    daySchedule = json['seasonChoice'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['doctorAppointCentre'] = this.organization;
    data['username'] = this.username;
    data['userUI'] = this.userUid;
    data['useremail'] = this.useremail;
    data['name'] = this.nameofpatient;
    data['age'] = this.age;
    data['docnumber'] = this.docnumber;
    data['doctorFee'] = this.doctorFee;
    data['doctorName'] = this.doctorName;
    data['gender'] = this.genderChoice;
    data['dateSelection'] = this.dayselected;
    data['submit_time'] = this.refaranceID;
    data['phone_number'] = this.phoneNumber;
    data['seasonChoice'] = this.daySchedule;
    // data['price'] = this.price;

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
