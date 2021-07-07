import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:covidcheck/admin/admin%20organization/orgdetails.dart';

import 'package:covidcheck/models/orgServiecs.dart';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class AdminOrg extends StatefulWidget {
  @override
  _AdminOrgState createState() => _AdminOrgState();
}

class _AdminOrgState extends State<AdminOrg> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: _buildAppBar(context),
        body: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance
              .collection("Details")
              .orderBy("publishedDate", descending: true)
              .snapshots(),
          builder: (context, dataShot) {
            if (!dataShot.hasData) {
              return Container(
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              );
            } else {
              if (dataShot.data.docs.length == 0) {
                return Container(
                  child: Center(
                    child: Text("Your Organization is Empty"),
                  ),
                );
              } else {
                return ListView.builder(
                  itemCount: dataShot.data.docs.length,
                  itemBuilder: (context, index) {
                    OrgModel model =
                        OrgModel.fromJson(dataShot.data.docs[index].data());

                    return adminsourceInfo(model, context);
                  },
                );
              }
            }
          },
        ));
  }

  _buildAppBar(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.blueGrey[700],
      automaticallyImplyLeading: false,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          IconButton(
              onPressed: () {
                Get.back();
              },
              icon: Icon(FontAwesomeIcons.chevronLeft)),
          Text("Admin View ", style: GoogleFonts.comfortaa(fontSize: 18.0)),
          IconButton(onPressed: () {}, icon: Icon(Icons.more_vert_rounded)),
        ],
      ),
    );
  }

  adminsourceInfo(OrgModel model, BuildContext context,
      {Color background, removeCartFunction}) {
    return InkWell(
        onTap: () {
          Get.to(OrgDetailsUpdate(orgdetailsUpdate: model));
        },
        splashColor: Colors.grey,
        child: Container(
          padding: const EdgeInsets.all(10.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Container(
              height: 150,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(model.thumbnailUrl))),
              child: Container(
                  decoration: BoxDecoration(
                    // borderRadius: BorderRadius.circular(20),
                    gradient: LinearGradient(
                        begin: Alignment.bottomRight,
                        stops: [
                          0.2,
                          0.7
                        ],
                        colors: [
                          Colors.black.withOpacity(.8),
                          Colors.black.withOpacity(.2)
                        ]),
                  ),
                  child: Align(
                    alignment: Alignment.bottomLeft,
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Text(
                        model.organization,
                        style: GoogleFonts.comfortaa(
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                            fontSize: 20),
                      ),
                    ),
                  ))),
        ));
  }
}
