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
  String blood1Choice;
  String blood2Choice;
  String blood3Choice;
  String blood4Choice;
  String blood5Choice;
  String blood6Choice;
  String blood7Choice;
  String blood8Choice;
  String doctor1schedule;
  String doctor2schedule;
  String doctor3schedule;
  int minimumAppointprice;
  int minimumvaccineprice;
  int minimumbedprice;
  int minimumbloodprice;
  int normalbedAvailable;
  int emergencybedAvailable;
  int minimumoygenprice;
  int ambulanceNumber;

  OrgModel(
      {this.organization,
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
      this.blood1Choice,
      this.blood2Choice,
      this.blood3Choice,
      this.blood4Choice,
      this.blood5Choice,
      this.blood6Choice,
      this.blood7Choice,
      this.blood8Choice,
      this.doctor1schedule,
      this.doctor2schedule,
      this.doctor3schedule,
      this.ambulanceNumber,
      this.emergencybedAvailable,
      this.minimumAppointprice,
      this.minimumbedprice,
      this.minimumbloodprice,
      this.minimumoygenprice,
      this.minimumvaccineprice,
      this.normalbedAvailable});

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
    blood1Choice = json["blood1Choice"];
    blood2Choice = json["blood2Choice"];
    blood3Choice = json["blood3Choice"];
    blood4Choice = json["blood4Choice"];
    blood5Choice = json["blood5Choice"];
    blood6Choice = json["blood6Choice"];
    blood7Choice = json["blood7Choice"];
    blood8Choice = json["blood8Choice"];
    doctor1schedule = json["doctor1schedule"];
    doctor2schedule = json["doctor2schedule"];
    doctor3schedule = json["doctor3schedule"];
    minimumAppointprice = json["minimumAppointprice"];
    minimumvaccineprice = json["minimumvaccineprice"];
    minimumbedprice = json["minimumbedprice"];
    minimumbloodprice = json["minimumbloodprice"];
    minimumoygenprice = json["minimumoygenprice"];
    normalbedAvailable = json["normalbedAvailable"];
    emergencybedAvailable = json["emergencybedAvailable"];
    ambulanceNumber = json["AmbulanceNumber"];
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
    data['blood1Choice'] = this.blood1Choice;
    data['blood2Choice'] = this.blood2Choice;
    data['blood3Choice'] = this.blood3Choice;
    data['blood4Choice'] = this.blood4Choice;
    data['blood5Choice'] = this.blood5Choice;
    data['blood6Choice'] = this.blood6Choice;
    data['blood7Choice'] = this.blood7Choice;
    data['blood8Choice'] = this.blood8Choice;
    data['doctor1schedule'] = this.doctor1schedule;
    data['doctor2schedule'] = this.doctor2schedule;
    data['doctor3schedule'] = this.doctor3schedule;
    data['minimumAppointprice'] = this.minimumAppointprice;
    data['minimumvaccineprice'] = this.minimumvaccineprice;
    data['minimumbedprice'] = this.minimumbedprice;
    data['minimumbloodprice'] = this.minimumbloodprice;
    data['normalbedAvailable'] = this.normalbedAvailable;
    data['emergencybedAvailable'] = this.emergencybedAvailable;
    data['minimumoygenprice'] = this.minimumoygenprice;
    data['minimumbloodprice'] = this.minimumbloodprice;
    data['AmbulanceNumber'] = this.ambulanceNumber;

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
