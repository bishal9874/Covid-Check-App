import 'package:covidcheck/Screen/search.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class SearchBoxDelegate extends SliverPersistentHeaderDelegate {
  @override
  Widget build(
          BuildContext context, double shrinkOffset, bool overlapsContent) =>
      InkWell(
        onTap: () {
          Get.to(SearchOrg());
        },
        child: Container(
          alignment: Alignment.center,
          width: MediaQuery.of(context).size.width,
          height: 80.0,
          child: InkWell(
            child: Container(
              margin: EdgeInsets.only(left: 15.0, right: 15.0),
              width: MediaQuery.of(context).size.width,
              height: 50.0,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20.0)),
              child: Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 8.0),
                    child: Icon(
                      Icons.search,
                      color: Colors.blueGrey,
                    ),
                  ),
                  Padding(
                      padding: EdgeInsets.only(left: 8.0),
                      child: Text(
                        "Search Using Pin Code",
                        style: GoogleFonts.raleway(
                            fontSize: 21.0, color: Colors.black),
                      )),
                ],
              ),
            ),
          ),
        ),
      );

  @override
  double get maxExtent => 80;

  @override
  double get minExtent => 80;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) => true;
}
