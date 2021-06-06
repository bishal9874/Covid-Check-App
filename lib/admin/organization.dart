import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:velocity_x/velocity_x.dart';

class Organization extends StatefulWidget {
  const Organization({Key key}) : super(key: key);

  @override
  _OrganizationState createState() => _OrganizationState();
}

class _OrganizationState extends State<Organization> {
  String imageUrl = "";
  File _file;
  TextEditingController _organizationName = new TextEditingController();
  TextEditingController _doctor1Name = new TextEditingController();
  TextEditingController _doctor2Name = new TextEditingController();
  TextEditingController _doctor3Name = new TextEditingController();
  TextEditingController _vaccine1Name = new TextEditingController();
  TextEditingController _vaccine2Name = new TextEditingController();
  TextEditingController _vaccine3Name = new TextEditingController();
  String oranizationID = DateTime.now().millisecondsSinceEpoch.toString();
  bool uploading = false;
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: "Add Organization".text.make(),
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: Icon(Icons.arrow_back_ios),
        ),
      ),
      body: Container(
        child: VStack([
          uploading ? CircularProgressIndicator() : Text(""),
          Container(
            child: Column(
              children: [
                InkWell(
                  onTap: captureImage,
                  child: CircleAvatar(
                    radius: width * 0.10,
                    backgroundColor: Colors.white,
                    backgroundImage: _file == null ? null : FileImage(_file),
                    child: _file == null
                        ? Icon(
                            Icons.add_photo_alternate,
                            size: width * 0.08,
                          )
                        : null,
                  ),
                ),
                Divider(),
                "Organization Image".text.size(12.0).make()
              ],
            ).centered(),
          ),
          TextField(
            style: GoogleFonts.raleway(),
            controller: _organizationName,
            decoration: InputDecoration(
              labelText: "Organization Name",
              labelStyle: GoogleFonts.raleway(
                fontSize: 16.0,
              ),
            ),
          ),
          SizedBox(
            height: 15.0,
          ),
          TextField(
            style: GoogleFonts.raleway(),
            controller: _doctor1Name,
            decoration: InputDecoration(
              labelText: "Doctor 1 Name",
              labelStyle: GoogleFonts.raleway(
                fontSize: 16.0,
              ),
            ),
          ),
          SizedBox(
            height: 15.0,
          ),
          TextField(
            style: GoogleFonts.raleway(),
            controller: _doctor2Name,
            decoration: InputDecoration(
              labelText: "Doctor 2 Name",
              labelStyle: GoogleFonts.raleway(
                fontSize: 16.0,
              ),
            ),
          ),
          SizedBox(
            height: 15.0,
          ),
          TextField(
            style: GoogleFonts.raleway(),
            controller: _doctor3Name,
            decoration: InputDecoration(
              labelText: "Doctor 3 Name",
              labelStyle: GoogleFonts.raleway(
                fontSize: 16.0,
              ),
            ),
          ),
          SizedBox(
            height: 15.0,
          ),
          TextField(
            style: GoogleFonts.raleway(),
            controller: _vaccine1Name,
            decoration: InputDecoration(
              labelText: "Vaccine 1 Name",
              labelStyle: GoogleFonts.raleway(
                fontSize: 16.0,
              ),
            ),
          ),
          SizedBox(
            height: 15.0,
          ),
          TextField(
            style: GoogleFonts.raleway(),
            controller: _vaccine2Name,
            decoration: InputDecoration(
              labelText: "Vaccine 2 Name",
              labelStyle: GoogleFonts.raleway(
                fontSize: 16.0,
              ),
            ),
          ),
          SizedBox(
            height: 15.0,
          ),
          TextField(
            style: GoogleFonts.raleway(),
            controller: _vaccine3Name,
            decoration: InputDecoration(
              labelText: "Vaccine 3 Name",
              labelStyle: GoogleFonts.raleway(
                fontSize: 16.0,
              ),
            ),
          ),
          SizedBox(
            height: 15.0,
          ),
          GestureDetector(
            onTap: () => upload_data(),
            child: Container(
                height: height * 0.06,
                width: width * 0.20,
                child: Material(
                    borderRadius: BorderRadius.circular(25.0),
                    color: Color(0xFF2877ed),
                    elevation: 0.0,
                    child: Center(
                        child: Text('Add',
                            style: GoogleFonts.raleway(
                                color: Colors.white, fontSize: 18.0))))),
          ).centered(),
        ]).scrollVertical(),
      ).p(8.0),
    );
  }

  Future<void> captureImage() async {
    _file = File(await ImagePicker()
        .getImage(source: ImageSource.gallery)
        .then((pickedFile) => pickedFile.path));
  }

  clearFormInfo() {
    setState(() {
      _file = null;
      _organizationName.clear();
      _doctor1Name.clear();
      _doctor2Name.clear();
      _doctor3Name.clear();
      _vaccine1Name.clear();
      _vaccine2Name.clear();
      _vaccine3Name.clear();
    });
  }

  upload_data() async {
    String imageDownURl = await uploadImage();
    updateDetails(imageDownURl);
  }

  Future<String> uploadImage() async {
    final Reference ref = FirebaseStorage.instance.ref().child("Organization");
    UploadTask uploadTask =
        ref.child("organization_$oranizationID.jpg").putFile(_file);
    TaskSnapshot taskSnapshot = await uploadTask;
    imageUrl = await taskSnapshot.ref.getDownloadURL();
    return imageUrl;
  }

  updateDetails(String downloadUrl) {
    final details = FirebaseFirestore.instance.collection("Details");
    details.doc(oranizationID).set({
      "organization": _organizationName.text.trim(),
      "doctor1": _doctor1Name.text.trim(),
      "doctor2": _doctor2Name.text.trim(),
      "doctor3": _doctor3Name.text.trim(),
      "vaccine1": _vaccine1Name.text.trim(),
      "vaccine2": _vaccine2Name.text.trim(),
      "vaccine3": _vaccine3Name.text.trim(),
      "thumbnailUrl": downloadUrl,
      "publishedDate": DateTime.now(),
      "status": "available",
    });
    setState(() {
      _file = null;
      oranizationID = DateTime.now().millisecondsSinceEpoch.toString();
      _organizationName.clear();
      _doctor1Name.clear();
      _doctor2Name.clear();
      _doctor3Name.clear();
      _vaccine1Name.clear();
      _vaccine2Name.clear();
      _vaccine3Name.clear();
    });
  }
}
