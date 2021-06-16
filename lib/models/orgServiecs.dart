import 'package:cloud_firestore/cloud_firestore.dart';

class OrgModel {
  String organization;
  Timestamp publishedDate;
  String thumbnailUrl;
  String doctor1;
  String doc1des;
  int doc1fees;
  String doctor2;
  String doc2des;
  int doc2fees;
  String doctor3;
  String doc3des;
  int doc3fees;
  String status;
  String vaccine1;
  String vaccine2;
  String vaccine3;
  String orgaddress;
  String orgCity;
  String orgDistrict;
  String email;
  int pinNumber;
  int contact;

  OrgModel({
    this.organization,
    this.doctor1,
    this.doc1des,
    this.doc1fees,
    this.publishedDate,
    this.thumbnailUrl,
    this.doctor2,
    this.doc2des,
    this.doc2fees,
    this.status,
    this.doctor3,
    this.doc3des,
    this.doc3fees,
    this.vaccine1,
    this.vaccine2,
    this.vaccine3,
    this.orgaddress,
    this.orgCity,
    this.orgDistrict,
    this.pinNumber,
    this.contact,
    this.email,
  });

  OrgModel.fromJson(Map<String, dynamic> json) {
    organization = json['organization'];
    publishedDate = json['publishedDate'];
    thumbnailUrl = json['thumbnailUrl'];
    status = json['status'];
    doctor1 = json['doctor1'];
    doc1des = json['doctor1des'];
    doc1fees = json['doctor1fees'];
    doctor2 = json['doctor2'];
    doc2des = json['doctor2des'];
    doc2fees = json['doctor2fees'];
    doctor3 = json['doctor3'];
    doc3des = json['doctor3des'];
    doc3fees = json['doctor3fees'];
    vaccine1 = json['vaccine1'];
    vaccine2 = json['vaccine2'];
    vaccine3 = json['vaccine3'];
    orgaddress = json['address'];
    orgCity = json['city'];
    orgDistrict = json['district'];
    pinNumber = json['pin_number'];
    contact = json['contact'];
    email = json['email'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['organization'] = this.organization;
    data['doctor1'] = this.doctor1;
    data['doctor1des'] = this.doc1des;
    data['doctor1fees'] = this.doc1fees;
    data['doctor2'] = this.doctor2;
    data['doctor2des'] = this.doc2des;
    data['doctor2fees'] = this.doc2fees;
    data['doctor3'] = this.doctor3;
    data['doctor3des'] = this.doc3des;
    data['doctor3fees'] = this.doc3fees;
    data['vaccine1'] = this.vaccine1;
    data['vaccine2'] = this.vaccine2;
    data['vaccine3'] = this.vaccine3;
    data['address'] = this.orgaddress;
    data['city'] = this.orgCity;
    data['district'] = this.orgDistrict;
    data['pin_number'] = this.pinNumber;
    data['contact'] = this.contact;
    data['email'] = this.email;
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
