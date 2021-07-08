import 'package:cloud_firestore/cloud_firestore.dart';

class BedModel {
  String organization;
  String referID;
  Timestamp dateTime;
  String userUid;
  String useremail;
  String username;
  int aadherNumber;
  int phonenumber;
  String genderChoice;
  String nameofpatient;
  String symptoms;
  Timestamp birthdate;
  String wardName;
  bool adminApproval;

  BedModel(
      {this.organization,
      this.nameofpatient,
      this.referID,
      this.aadherNumber,
      this.dateTime,
      this.phonenumber,
      this.userUid,
      this.useremail,
      this.username,
      this.symptoms,
      this.birthdate,
      this.genderChoice,
      this.adminApproval,
      this.wardName});

  BedModel.fromJson(Map<String, dynamic> json) {
    organization = json['Hospital/health_home'];
    referID = json['bedreferID'];
    username = json['username'];
    userUid = json['userUI'];
    useremail = json['useremail'];
    nameofpatient = json['name'];
    aadherNumber = json['aadharnumber'];
    phonenumber = json['phoneNumber'];
    symptoms = json['reason'];
    birthdate = json['Birthdate'];
    dateTime = json['dateTime'];
    genderChoice = json['gender'];
    adminApproval = json['adminapproval'];
    wardName = json['bedVerient'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Hospital/health_home'] = this.organization;
    data['username'] = this.username;
    data['userUI'] = this.userUid;
    data['useremail'] = this.useremail;
    data['name'] = this.nameofpatient;
    data['aadharnumber'] = this.aadherNumber;
    data['phoneNumber'] = this.phonenumber;
    data['reason'] = this.symptoms;
    data['Birthdate'] = this.birthdate;
    data['adminapproval'] = this.adminApproval;
    data['genderChoice'] = this.genderChoice;
    data['bedVerient'] = this.wardName;

    data['dateTime'] = this.dateTime;

    // data['price'] = this.price;
    if (this.referID != null) {
      data['bedreferID'] = this.referID;
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
