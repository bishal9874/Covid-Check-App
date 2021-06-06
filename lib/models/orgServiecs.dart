import 'package:cloud_firestore/cloud_firestore.dart';

class OrgModel {
  String organization;
  String doctor1;
  Timestamp publishedDate;
  String thumbnailUrl;
  String doctor2;
  String status;
  String doctor3;
  String vaccine1;
  String vaccine2;
  String vaccine3;

  int price;

  OrgModel(
      {this.organization,
      this.doctor1,
      this.publishedDate,
      this.thumbnailUrl,
      this.doctor2,
      this.status,
      this.doctor3,
      this.vaccine1,
      this.vaccine2,
      this.vaccine3});

  OrgModel.fromJson(Map<String, dynamic> json) {
    organization = json['organization'];
    doctor1 = json['doctor1'];
    publishedDate = json['publishedDate'];
    thumbnailUrl = json['thumbnailUrl'];

    status = json['status'];
    // price = json['price'];
    doctor1 = json['doctor1'];
    doctor2 = json['doctor2'];
    doctor3 = json['doctor3'];
    vaccine1 = json['vaccine1'];
    vaccine2 = json['vaccine2'];
    vaccine3 = json['vaccine3'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['organization'] = this.organization;
    data['doctor1'] = this.doctor1;
    data['doctor2'] = this.doctor2;
    data['doctor3'] = this.doctor3;
    data['vaccine1'] = this.vaccine1;
    data['vaccine2'] = this.vaccine2;
    data['vaccine3'] = this.vaccine3;
    // data['price'] = this.price;

    if (this.publishedDate != null) {
      data['publishedDate'] = this.publishedDate;
    }
    data['thumbnailUrl'] = this.thumbnailUrl;

    data['status'] = this.status;
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
