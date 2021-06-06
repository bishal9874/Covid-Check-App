import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:covidcheck/Screen/Auth/login.dart';
import 'package:covidcheck/counter/booking_counter.dart';
import 'package:covidcheck/models/orgServiecs.dart';
import 'package:covidcheck/services/authservices.dart';
import 'package:covidcheck/services/ser.dart';
import 'package:covidcheck/widgets/drawer.dart';
import 'package:covidcheck/widgets/provider_widgets.dart';
import 'package:covidcheck/widgets/searchBox.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: RichText(
          text: TextSpan(
            style: TextStyle(fontSize: 30.0),
            children: <TextSpan>[
              TextSpan(
                  text: 'Covid',
                  style: GoogleFonts.raleway(
                      fontWeight: FontWeight.w700, color: Colors.white)),
              TextSpan(
                  text: 'Check!',
                  style: GoogleFonts.raleway(
                      fontWeight: FontWeight.w700, color: Colors.orange)),
            ],
          ),
        ).pOnly(left: 35.0),
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        leading: Builder(
            builder: (context) => IconButton(
                  onPressed: () {
                    Scaffold.of(context).openDrawer();
                  },
                  icon: Icon(FontAwesomeIcons.bars, color: Colors.white),
                )),
        actions: [
          Stack(
            children: [
              Icon(
                Icons.brightness_1_rounded,
                size: 20.0,
                color: Colors.red,
              ),
              Positioned(
                top: 2.0,
                bottom: 4.0,
                left: 6.0,
                child:
                    Consumer<BookItemCounter>(builder: (context, counter, _) {
                  return Text(counter.count.toString(),
                      style: GoogleFonts.raleway(
                          fontSize: 12.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white));
                }),
              ),
              IconButton(
                icon: Icon(Icons.shopping_cart_outlined, color: Colors.white),
                onPressed: () {
                  //Get.to(CartPage());
                },
              ),
            ],
          ),
        ],
      ),
      drawer: Drawer(
        child: MainDrawer(),
      ),
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

  Widget sourceInfo(OrgModel model, BuildContext context,
      {Color background, removeCartFunction}) {
    return InkWell(
      splashColor: Colors.grey,
      child: Padding(
          padding: EdgeInsets.all(6.0),
          child: Container(
            height: 250.0,
            width: MediaQuery.of(context).size.width,
            child: Row(
              children: [
                Image.network(
                  model.thumbnailUrl,
                  width: 140.0,
                  height: 140.0,
                ),
                Container(
                  child: VStack([
                    model.organization.text
                        .size(15.0)
                        .textStyle(
                            GoogleFonts.raleway(fontWeight: FontWeight.w700))
                        .make(),
                    Text(model.doctor1),
                    Text(model.doctor2),
                    Text(model.doctor3),
                    Text(model.vaccine1),
                    Text(model.vaccine2),
                    Text(model.vaccine3),
                  ]),
                )
              ],
            ),
          )),
    );
  }
}
