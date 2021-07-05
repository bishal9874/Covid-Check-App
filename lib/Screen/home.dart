import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:covidcheck/Screen/cart_page.dart';
import 'package:covidcheck/Screen/catagories.dart';
import 'package:covidcheck/counter/booking_counter.dart';
import 'package:covidcheck/models/orgServiecs.dart';
import 'package:covidcheck/services/ser.dart';
import 'package:covidcheck/widgets/drawer.dart';
import 'package:covidcheck/widgets/profile.dart';
import 'package:covidcheck/widgets/searchBox.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[900],
      appBar: _buildAppBar(context),
      // appBar: AppBar(
      //   title: RichText(
      //     text: TextSpan(
      //       style: TextStyle(fontSize: 30.0),
      //       children: <TextSpan>[
      //         TextSpan(
      //             text: 'Covid',
      //             style: GoogleFonts.raleway(
      //                 fontWeight: FontWeight.w700, color: Colors.white)),
      //         TextSpan(
      //             text: 'Check!',
      //             style: GoogleFonts.raleway(
      //                 fontWeight: FontWeight.w700, color: Colors.orange)),
      //       ],
      //     ),
      //   ),
      //   centerTitle: true,
      //   elevation: 0.0,
      //   backgroundColor: Colors.transparent,

      //   // leading: Builder(
      //   //     builder: (context) => IconButton(
      //   //           onPressed: () {
      //   //             Scaffold.of(context).openDrawer();
      //   //           },
      //   //           icon: Icon(FontAwesomeIcons.bars, color: Colors.white),
      //   //         )),
      //   // actions: [
      //   //   Stack(
      //   //     children: [
      //   //       Icon(
      //   //         Icons.brightness_1_rounded,
      //   //         size: 20.0,
      //   //         color: Colors.red,
      //   //       ),
      //   //       Positioned(
      //   //         top: 2.0,
      //   //         bottom: 4.0,
      //   //         left: 6.0,
      //   //         child:
      //   //             Consumer<BookItemCounter>(builder: (context, counter, _) {
      //   //           return Text(
      //   //               (CovidCheckApp.sharedPreferences
      //   //                           .getStringList(CovidCheckApp.userCartList)
      //   //                           .length -
      //   //                       1)
      //   //                   .toString(),
      //   //               style: GoogleFonts.raleway(
      //   //                   fontSize: 12.0,
      //   //                   fontWeight: FontWeight.bold,
      //   //                   color: Colors.white));
      //   //         }),
      //   //       ),
      //   //       IconButton(
      //   //         icon: Icon(Icons.shopping_cart_outlined, color: Colors.white),
      //   //         onPressed: () {
      //   //           // Get.to(CartPage());
      //   //         },
      //   //       ),
      //   //     ],
      //   //   ),
      //   // ],
      // ),
      // drawer: Drawer(
      //   child: MainDrawer(),
      // ),
      body: CustomScrollView(
        slivers: [
          SliverPersistentHeader(pinned: true, delegate: SearchBoxDelegate()),
          StreamBuilder<QuerySnapshot>(
            stream: FirebaseFirestore.instance
                .collection("Details")
                .limit(10)
                .orderBy("publishedDate", descending: true)
                .snapshots(),
            builder: (context, dataShot) {
              return !dataShot.hasData
                  ? SliverToBoxAdapter(
                      child: Center(
                        child: CircularProgressIndicator(),
                      ),
                    )
                  : SliverStaggeredGrid.countBuilder(
                      crossAxisCount: 1,
                      staggeredTileBuilder: (c) => StaggeredTile.fit(1),
                      itemBuilder: (context, index) {
                        OrgModel model =
                            OrgModel.fromJson(dataShot.data.docs[index].data());
                        return sourceInfo(model, context);
                      },
                      itemCount: dataShot.data.docs.length);
            },
          )
        ],
      ),
    );
  }
}

_buildAppBar(BuildContext context) {
  return AppBar(
    elevation: 0,
    backgroundColor: Colors.blueGrey[900],
    automaticallyImplyLeading: false,
    title: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        RichText(
          text: TextSpan(
            style: TextStyle(fontSize: 30.0),
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
        InkWell(
          onTap: () => Get.to(ProfileScreen()),
          child: CircleAvatar(
            radius: 20.0,
            backgroundImage: (CovidCheckApp.userAvatarUrl != null)
                ? NetworkImage(CovidCheckApp.sharedPreferences
                    .getString(CovidCheckApp.userAvatarUrl))
                : AssetImage("assets/av.jpg"),
          ),
        ),
      ],
    ),
  );
}

Widget sourceInfo(OrgModel model, BuildContext context,
    {Color background, removeCartFunction}) {
  return InkWell(
      onTap: () {
        Get.to(OrgDetailPage(orgModel: model));
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
