import 'package:covidcheck/Screen/normalbedBooking.dart';
import 'package:covidcheck/models/orgServiecs.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:velocity_x/velocity_x.dart';

// ignore: must_be_immutable
class BedBooking extends StatefulWidget {
  OrgModel bedbooking;
  BedBooking({Key key, this.bedbooking}) : super(key: key);

  @override
  _BedBookingState createState() => _BedBookingState();
}

class _BedBookingState extends State<BedBooking> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: VStack([
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _choiceBed(
              "Normal Ward",
              Color(0xff00b36e),
              context,
              widget.bedbooking.minimumbedprice.toString(),
              widget.bedbooking.normalbedAvailable.toString(),
            ),
            _choiceBed(
              "Emergency/ICU Ward",
              Colors.redAccent,
              context,
              widget.bedbooking.minimumbedprice.toString(),
              widget.bedbooking.emergencybedAvailable.toString(),
            ),
            _choiceBed(
              "Covid Quarantine Ward",
              Colors.orange,
              context,
              widget.bedbooking.minimumbedprice.toString(),
              widget.bedbooking.covidquarantinebed.toString(),
            ),
          ],
        ).centered(),
      ]).scrollVertical(),
    );
  }

  _buildAppBar(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.blueGrey[800],
      automaticallyImplyLeading: false,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          IconButton(
              onPressed: () {
                Get.back();
              },
              icon: Icon(FontAwesomeIcons.chevronLeft)),
          Text(
            "Bed Booking ",
            style: GoogleFonts.comfortaa(),
          ),
          IconButton(onPressed: () {}, icon: Icon(Icons.more_vert_rounded)),
        ],
      ),
    );
  }

  Widget _choiceBed(
    String bedname,
    Color bgcolor,
    BuildContext context,
    String bedbookingcharge,
    String bedAvailable,
  ) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return InkWell(
      onTap: () {
        Get.to(NormalBed(
          wardname: bedname,
          bedavailable: bedAvailable,
          minimumBookingPrice: bedbookingcharge,
          bedInfo: widget.bedbooking,
        ));
      },
      child: Container(
        height: height * 0.18,
        width: width * 1.0,
        padding: EdgeInsets.all(5.0),
        margin: EdgeInsets.all(20.0),
        decoration: BoxDecoration(
          color: Color(0xFF48544c),
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Container(
            padding: EdgeInsets.all(10.0),
            margin: EdgeInsets.all(10.0),
            decoration: BoxDecoration(
              color: bgcolor,
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  VStack([
                    Container(
                      margin: EdgeInsets.only(left: 20.0),
                      child: Text(bedname,
                          style: GoogleFonts.comfortaa(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                              fontSize: 17.0)),
                    ),
                    SizedBox(
                      height: height * 0.01,
                    ),
                    Container(
                        height: height * 0.03,
                        width: width * 0.30,
                        margin: EdgeInsets.only(left: 20.0),
                        decoration: BoxDecoration(
                          color: Colors.blueGrey[800],
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: Center(
                          child: RichText(
                            text: TextSpan(
                              style: TextStyle(fontSize: 12.0),
                              children: <TextSpan>[
                                TextSpan(
                                    text: 'Availablity: ',
                                    style: GoogleFonts.comfortaa(
                                        fontWeight: FontWeight.w700,
                                        color: Colors.white)),
                                TextSpan(
                                    text: bedAvailable,
                                    style: GoogleFonts.notoSans(
                                        fontWeight: FontWeight.w700,
                                        color: Colors.orange)),
                              ],
                            ),
                          ),
                        )),
                  ]),
                  Container(
                    height: height * 0.25,
                    width: width * 0.10,
                    padding: EdgeInsets.all(5.0),
                    margin: EdgeInsets.all(5.0),
                    decoration: BoxDecoration(
                      color: Color(0xFF48544c),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  )
                ])),
      ),
    );
  }
}
