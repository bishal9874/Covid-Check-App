import 'package:cloud_firestore/cloud_firestore.dart';

class BloodModel {
  String organization;
  Timestamp publishedDate;
  Timestamp dateTime;
  String userUid;
  String useremail;
  String username;
  int aadherNumber;
  int phonenumber;
  String genderChoice;
  String nameofpatient;
  String bloodChoice;
  String prescriptionProve;
  bool adminApproval;

  BloodModel(
      {this.organization,
      this.nameofpatient,
      this.publishedDate,
      this.aadherNumber,
      this.dateTime,
      this.phonenumber,
      this.userUid,
      this.useremail,
      this.username,
      this.bloodChoice,
      this.prescriptionProve,
      this.genderChoice,
      this.adminApproval});

  BloodModel.fromJson(Map<String, dynamic> json) {
    organization = json['bloodCentre_Name'];
    publishedDate = json['publishDate'];
    username = json['username'];
    userUid = json['userUI'];
    useremail = json['useremail'];
    nameofpatient = json['name'];
    aadherNumber = json['aadharnumber'];
    phonenumber = json['phoneNumber'];
    bloodChoice = json['bloodchoice'];
    prescriptionProve = json['precriptionProve'];
    dateTime = json['dateSelection'];
    genderChoice = json['gender'];
    //adminApproval = json['adminApproval'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['vaccineCentre_Name'] = this.organization;
    data['username'] = this.username;
    data['userUI'] = this.userUid;
    data['useremail'] = this.useremail;
    data['name'] = this.nameofpatient;
    data['aadharnumber'] = this.aadherNumber;
    data['phoneNumber'] = this.phonenumber;
    data['bloodchoice'] = this.bloodChoice;
    data['precriptionProve'] = this.prescriptionProve;
    //data['adminApproval'] = this.adminApproval;
    data['genderChoice'] = this.genderChoice;

    data['dateSelection'] = this.dateTime;

    // data['price'] = this.price;
    if (this.publishedDate != null) {
      data['publishDate'] = this.publishedDate;
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
