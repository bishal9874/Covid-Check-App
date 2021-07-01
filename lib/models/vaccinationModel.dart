import 'package:cloud_firestore/cloud_firestore.dart';

class VaccineModel {
  String organization;
  Timestamp publishedDate;
  String dateTime;
  String userUid;
  String useremail;
  String username;
  String genderChoice;
  int aadherNumber;
  int birthyr;
  String underag;
  String season;
  String nameofvacciner;
  String vacineChoice;

  VaccineModel(
      {this.organization,
      this.nameofvacciner,
      this.publishedDate,
      this.aadherNumber,
      this.birthyr,
      this.dateTime,
      this.season,
      this.underag,
      this.userUid,
      this.useremail,
      this.username,
      this.vacineChoice,
      this.genderChoice});

  VaccineModel.fromJson(Map<String, dynamic> json) {
    organization = json['vaccineCentre_Name'];
    publishedDate = json['publishDate'];
    username = json['username'];
    userUid = json['userUI'];
    useremail = json['useremail'];
    nameofvacciner = json['name'];
    aadherNumber = json['aadharnumber'];
    birthyr = json['birthyear'];
    vacineChoice = json['vaccineChoice'];
    underag = json['underAge'];
    season = json['seasonChoice'];
    dateTime = json['dateSelection'];
    genderChoice = json['genderChoice'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['vaccineCentre_Name'] = this.organization;
    data['username'] = this.username;
    data['userUI'] = this.userUid;
    data['useremail'] = this.useremail;
    data['name'] = this.nameofvacciner;
    data['aadharnumber'] = this.aadherNumber;
    data['birthyear'] = this.birthyr;
    data['vaccineChoice'] = this.vacineChoice;
    data['underAge'] = this.underag;
    data['seasonChoice'] = this.season;
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
