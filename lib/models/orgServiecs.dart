import 'package:cloud_firestore/cloud_firestore.dart';

class OrgModel {
  String organization;
  Timestamp publishedDate;
  String thumbnailUrl;
  String doctor1;
  String doc1des;
  int doc1fees;
  Timestamp doctor1day1date;
  int doctor1day1view;
  String doctor1day1schedule;
  Timestamp doctor1day2date;
  int doctor1day2view;
  String doctor1day2schedule;
  Timestamp doctor1day3date;
  int doctor1day3view;
  String doctor1day3schedule;
  int covidquarantinebed;

  ///
  ///
  ///
  String doctor2;
  String doc2des;
  int doc2fees;
  Timestamp doctor2day1date;
  int doctor2day1view;
  String doctor2day1schedule;
  Timestamp doctor2day2date;
  int doctor2day2view;
  String doctor2day2schedule;
  Timestamp doctor2day3date;
  int doctor2day3view;
  String doctor2day3schedule;

  ///
  ///
  ///
  String doctor3;
  String doc3des;
  int doc3fees;
  Timestamp doctor3day1date;
  int doctor3day1view;
  String doctor3day1schedule;
  Timestamp doctor3day2date;
  int doctor3day2view;
  String doctor3day2schedule;
  Timestamp doctor3day3date;
  int doctor3day3view;
  String doctor3day3schedule;

  ///
  ///
  ///
  ///
  String status;
  String vaccine1;
  int vaccine1day1available;
  Timestamp vaccine1day1date;
  int vaccine1day2available;
  Timestamp vaccine1day2date;
  int vaccine1day3available;
  Timestamp vaccine1day3date;
  int vaccine1day4available;
  Timestamp vaccine1day4date;
  int vaccine1day5available;
  Timestamp vaccine1day5date;
  String vaccine2;
  int vaccine2day1available;
  Timestamp vaccine2day1date;
  int vaccine2day2available;
  Timestamp vaccine2day2date;
  int vaccine2day3available;
  Timestamp vaccine2day3date;
  int vaccine2day4available;
  Timestamp vaccine2day4date;
  int vaccine2day5available;
  Timestamp vaccine2day5date;
  String vaccine3;
  int vaccine3day1available;
  Timestamp vaccine3day1date;
  int vaccine3day2available;
  Timestamp vaccine3day2date;
  int vaccine3day3available;
  Timestamp vaccine3day3date;
  int vaccine3day4available;
  Timestamp vaccine3day4date;
  int vaccine3day5available;
  Timestamp vaccine3day5date;
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

  int minimumAppointprice;
  int minimumvaccineprice;
  int minimumbedprice;
  int minimumbloodprice;
  int normalbedAvailable;
  int emergencybedAvailable;
  int minimumoygenprice;
  int ambulanceNumber;

  String docnumber;

  OrgModel(
      {this.organization,
      this.doctor1,
      this.doc1des,
      this.doc1fees,
      this.doctor1day1date,
      this.doctor1day1view,
      this.doctor1day1schedule,
      this.doctor1day2date,
      this.doctor1day2view,
      this.doctor1day2schedule,
      this.doctor1day3date,
      this.doctor1day3view,
      this.doctor1day3schedule,
      this.publishedDate,
      this.thumbnailUrl,
      this.doctor2,
      this.doc2des,
      this.doc2fees,
      this.doctor2day1date,
      this.doctor2day1view,
      this.doctor2day1schedule,
      this.doctor2day2date,
      this.doctor2day2view,
      this.doctor2day2schedule,
      this.doctor2day3date,
      this.doctor2day3view,
      this.doctor2day3schedule,
      this.status,
      this.doctor3,
      this.doc3des,
      this.doc3fees,
      this.doctor3day1date,
      this.doctor3day1view,
      this.doctor3day1schedule,
      this.doctor3day2date,
      this.doctor3day2view,
      this.doctor3day2schedule,
      this.doctor3day3date,
      this.doctor3day3view,
      this.doctor3day3schedule,
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
      this.ambulanceNumber,
      this.emergencybedAvailable,
      this.minimumAppointprice,
      this.minimumbedprice,
      this.minimumbloodprice,
      this.minimumoygenprice,
      this.minimumvaccineprice,
      this.normalbedAvailable,
      this.vaccine1day1available,
      this.vaccine1day1date,
      this.vaccine1day2available,
      this.vaccine1day2date,
      this.vaccine1day3available,
      this.vaccine1day3date,
      this.vaccine1day4available,
      this.vaccine1day4date,
      this.vaccine1day5available,
      this.vaccine1day5date,
      this.vaccine2day1available,
      this.vaccine2day1date,
      this.vaccine2day2available,
      this.vaccine2day2date,
      this.vaccine2day3available,
      this.vaccine2day3date,
      this.vaccine2day4available,
      this.vaccine2day4date,
      this.vaccine2day5available,
      this.vaccine2day5date,
      this.vaccine3day1available,
      this.vaccine3day1date,
      this.vaccine3day2available,
      this.vaccine3day2date,
      this.vaccine3day3available,
      this.vaccine3day3date,
      this.vaccine3day4available,
      this.vaccine3day4date,
      this.vaccine3day5available,
      this.vaccine3day5date,
      this.docnumber,
      this.covidquarantinebed});

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

    minimumAppointprice = json["minimumAppointprice"];
    minimumvaccineprice = json["minimumvaccineprice"];
    minimumbedprice = json["minimumbedprice"];
    minimumbloodprice = json["minimumbloodprice"];
    minimumoygenprice = json["minimumoygenprice"];
    normalbedAvailable = json["normalbedAvailable"];
    emergencybedAvailable = json["emergencybedAvailable"];
    covidquarantinebed = json["covidquarantinebed"];
    ambulanceNumber = json["AmbulanceNumber"];
    //
    vaccine1day1available = json["vaccine1day1available"];
    vaccine1day1date = json["vaccine1day1date"];
    vaccine1day2available = json["vaccine1day2available"];
    vaccine1day2date = json["vaccine1day2date"];
    vaccine1day3available = json["vaccine1day3available"];
    vaccine1day3date = json["vaccine1day3date"];
    vaccine1day4available = json["vaccine1day4available"];
    vaccine1day4date = json["vaccine1day4date"];
    vaccine1day5available = json["vaccine1day5available"];
    vaccine1day5date = json["vaccine1day5date"];
    //
    vaccine2day1available = json["vaccine2day1available"];
    vaccine2day1date = json["vaccine2day1date"];
    vaccine2day2available = json["vaccine2day2available"];
    vaccine2day2date = json["vaccine2day2date"];
    vaccine2day3available = json["vaccine2day3available"];
    vaccine2day3date = json["vaccine2day3date"];
    vaccine2day4available = json["vaccine2day4available"];
    vaccine2day4date = json["vaccine2day4date"];
    vaccine2day5available = json["vaccine2day5available"];
    vaccine2day5date = json["vaccine2day5date"];
    //
    vaccine3day1available = json["vaccine3day1available"];
    vaccine3day1date = json["vaccine3day1date"];
    vaccine3day2available = json["vaccine3day2available"];
    vaccine3day2date = json["vaccine3day2date"];
    vaccine3day3available = json["vaccine3day3available"];
    vaccine3day3date = json["vaccine3day3date"];
    vaccine3day4available = json["vaccine3day4available"];
    vaccine3day4date = json["vaccine3day4date"];
    vaccine3day5available = json["vaccine3day5available"];
    vaccine3day5date = json["vaccine3day5date"];
    docnumber = json['docnumber'];
    doctor1day1date = json['doctor1day1date'];
    doctor1day1view = json['doctor1day1view'];
    doctor1day1schedule = json['doctor1day1schedule'];
    doctor1day2date = json['doctor1day2date'];
    doctor1day2view = json['doctor1day2view'];
    doctor1day2schedule = json['doctor1day2schedule'];
    doctor1day3date = json['doctor1day3date'];
    doctor1day3view = json['doctor1day3view'];
    doctor1day3schedule = json['doctor1day3schedule'];

    ///
    ///
    doctor2day1date = json['doctor2day1date'];
    doctor2day1view = json['doctor2day1view'];
    doctor2day1schedule = json['doctor2day1schedule'];
    doctor2day2date = json['doctor2day2date'];
    doctor2day2view = json['doctor2day2view'];
    doctor2day2schedule = json['doctor2day2schedule'];
    doctor2day3date = json['doctor2day3date'];
    doctor2day3view = json['doctor2day3view'];
    doctor2day3schedule = json['doctor2day3schedule'];

    ///
    ///
    doctor3day1date = json['doctor3day1date'];
    doctor3day1view = json['doctor3day1view'];
    doctor3day1schedule = json['doctor3day1schedule'];
    doctor3day2date = json['doctor3day2date'];
    doctor3day2view = json['doctor3day2view'];
    doctor3day2schedule = json['doctor3day2schedule'];
    doctor3day3date = json['doctor3day3date'];
    doctor3day3view = json['doctor3day3view'];
    doctor3day3schedule = json['doctor3day3schedule'];
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

    data['minimumAppointprice'] = this.minimumAppointprice;
    data['minimumvaccineprice'] = this.minimumvaccineprice;
    data['minimumbedprice'] = this.minimumbedprice;
    data['minimumbloodprice'] = this.minimumbloodprice;
    data['normalbedAvailable'] = this.normalbedAvailable;
    data['covidquarantinebed'] = this.covidquarantinebed;
    data['emergencybedAvailable'] = this.emergencybedAvailable;
    data['minimumoygenprice'] = this.minimumoygenprice;
    data['minimumbloodprice'] = this.minimumbloodprice;
    data['AmbulanceNumber'] = this.ambulanceNumber;
    data['vaccine1day1available'] = this.vaccine1day1available;

    ///
    ///
    ///
    ///
    data['doctor1day1date'] = this.doctor1day1date;
    data['doctor1day1view'] = this.doctor1day1view;
    data['doctor1day1schedule'] = this.doctor1day1schedule;
    data['doctor1day2date'] = this.doctor1day2date;
    data['doctor1day2view'] = this.doctor1day2view;
    data['doctor1day2schedule'] = this.doctor1day2schedule;
    data['doctor1day3date'] = this.doctor1day3date;
    data['doctor1day3view'] = this.doctor1day3view;
    data['doctor1day3schedule'] = this.doctor1day3schedule;
    //
    data['doctor2day1date'] = this.doctor2day1date;
    data['doctor2day1view'] = this.doctor2day1view;
    data['doctor2day1schedule'] = this.doctor2day1schedule;
    data['doctor2day2date'] = this.doctor2day2date;
    data['doctor2day2view'] = this.doctor2day2view;
    data['doctor2day2schedule'] = this.doctor2day2schedule;
    data['doctor2day3date'] = this.doctor2day3date;
    data['doctor2day3view'] = this.doctor2day3view;
    data['doctor2day3schedule'] = this.doctor2day3schedule;
    //
    data['doctor3day1date'] = this.doctor3day1date;
    data['doctor3day1view'] = this.doctor3day1view;
    data['doctor3day1schedule'] = this.doctor3day1schedule;
    data['doctor3day2date'] = this.doctor3day2date;
    data['doctor3day2view'] = this.doctor3day2view;
    data['doctor3day2schedule'] = this.doctor3day2schedule;
    data['doctor3day3date'] = this.doctor3day3date;
    data['doctor3day3view'] = this.doctor3day3view;
    data['doctor3day3schedule'] = this.doctor3day3schedule;

    if (this.vaccine1day1date != null) {
      data['vaccine1day1date'] = this.vaccine1day1date;
    }
    data['vaccine1day2available'] = this.vaccine1day2available;
    if (this.vaccine1day2date != null) {
      data['vaccine1day2date'] = this.vaccine1day2date;
    }
    data['vaccine1day3available'] = this.vaccine1day3available;
    if (this.vaccine1day3date != null) {
      data['vaccine1day3date'] = this.vaccine1day3date;
    }
    data['vaccine1day4available'] = this.vaccine1day4available;
    if (this.vaccine1day4date != null) {
      data['vaccine1day4date'] = this.vaccine1day4date;
    }
    data['vaccine1day5available'] = this.vaccine1day5available;
    if (this.vaccine1day5date != null) {
      data['vaccine1day5date'] = this.vaccine1day5date;
    }
    // data['price'] = this.price;
    data['vaccine2day1available'] = this.vaccine2day1available;
    if (this.vaccine2day1date != null) {
      data['vaccine2day1date'] = this.vaccine2day1date;
    }
    data['vaccine2day2available'] = this.vaccine2day2available;
    if (this.vaccine2day2date != null) {
      data['vaccine2day2date'] = this.vaccine2day2date;
    }
    data['vaccine2day3available'] = this.vaccine2day3available;
    if (this.vaccine2day3date != null) {
      data['vaccine2day3date'] = this.vaccine2day3date;
    }
    data['vaccine2day4available'] = this.vaccine2day4available;
    if (this.vaccine2day4date != null) {
      data['vaccine2day4date'] = this.vaccine2day4date;
    }
    data['vaccine2day5available'] = this.vaccine2day5available;
    if (this.vaccine2day5date != null) {
      data['vaccine2day5date'] = this.vaccine2day5date;
    }
    //
    data['vaccine3day1available'] = this.vaccine3day1available;
    if (this.vaccine3day1date != null) {
      data['vaccine3day1date'] = this.vaccine3day1date;
    }
    data['vaccine3day2available'] = this.vaccine3day2available;
    if (this.vaccine3day2date != null) {
      data['vaccine3day2date'] = this.vaccine3day2date;
    }
    data['vaccine3day3available'] = this.vaccine3day3available;
    if (this.vaccine3day3date != null) {
      data['vaccine3day3date'] = this.vaccine3day3date;
    }
    data['vaccine3day4available'] = this.vaccine3day4available;
    if (this.vaccine3day4date != null) {
      data['vaccine3day4date'] = this.vaccine3day4date;
    }
    data['vaccine3day5available'] = this.vaccine3day5available;
    if (this.vaccine3day5date != null) {
      data['vaccine3day5date'] = this.vaccine3day5date;
    }

    if (this.publishedDate != null) {
      data['publishedDate'] = this.publishedDate;
    }
    data['thumbnailUrl'] = this.thumbnailUrl;
    data['docnumber'] = this.docnumber;

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
