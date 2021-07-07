import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:covidcheck/Screen/home.dart';
import 'package:covidcheck/models/orgServiecs.dart';

import 'package:flutter/material.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class SearchOrg extends StatefulWidget {
  @override
  _SearchOrgState createState() => new _SearchOrgState();
}

class _SearchOrgState extends State<SearchOrg> {
  Future<QuerySnapshot> orgList;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: _buildAppBar(context),
        body: FutureBuilder<QuerySnapshot>(
            future: orgList,
            builder: (context, snap) {
              return snap.hasData
                  ? ListView.builder(
                      itemCount: snap.data.docs.length,
                      itemBuilder: (context, index) {
                        OrgModel model =
                            OrgModel.fromJson(snap.data.docs[index].data());
                        return sourceInfo(model, context);
                      })
                  : Container(
                      child: Center(
                        child: Text("No Data Available"),
                      ),
                    );
            }),
      ),
    );
  }

  _buildAppBar(BuildContext context) {
    return AppBar(
      elevation: 0.0,
      backgroundColor: Colors.blueGrey[700],
      automaticallyImplyLeading: false,
      bottom: PreferredSize(
        child: searchWidget(),
        preferredSize: Size(56.0, 56.0),
      ),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          IconButton(
              onPressed: () {
                Get.back();
              },
              icon: Icon(FontAwesomeIcons.chevronLeft)),
          RichText(
            text: TextSpan(
              style: TextStyle(fontSize: 20.0),
              children: <TextSpan>[
                TextSpan(
                    text: 'Covid',
                    style: GoogleFonts.comfortaa(
                        fontWeight: FontWeight.w600, color: Colors.white)),
                TextSpan(
                    text: 'Check!',
                    style: GoogleFonts.comfortaa(
                        fontWeight: FontWeight.w600, color: Colors.orange)),
              ],
            ),
          ),
          IconButton(onPressed: () {}, icon: Icon(Icons.more_vert_rounded)),
        ],
      ),
    );
  }

  searchWidget() {
    return Container(
      margin: EdgeInsets.all(5.0),
      child: TextField(
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.search),
          filled: true,
          fillColor: Colors.blue[80],
          hintText: "Enter Pincode to search",
          hintStyle: GoogleFonts.comfortaa(),
          errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              borderSide: BorderSide(width: 1, color: Colors.red)),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
            borderRadius: const BorderRadius.all(
              const Radius.circular(10.0),
            ),
          ),
        ),
        // keyboardType: TextInputType.number,
        // inputFormatters: <TextInputFormatter>[
        //   FilteringTextInputFormatter.digitsOnly
        // ],
        // onEditingComplete: ,
        onChanged: (value) {
          startSearching(value);
        },
      ),
    );
  }

  Future startSearching(String query) async {
    orgList = FirebaseFirestore.instance
        .collection("Details")
        .where("city", isGreaterThanOrEqualTo: query)
        .get();
  }
}
