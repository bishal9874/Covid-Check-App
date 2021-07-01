import 'package:covidcheck/models/orgServiecs.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class OxygenServices extends StatefulWidget {
  OrgModel oxygen;
  OxygenServices({Key key, this.oxygen}) : super(key: key);

  @override
  _OxygenServicesState createState() => _OxygenServicesState();
}

class _OxygenServicesState extends State<OxygenServices> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: VStack([
        SizedBox(
          height: height * 0.10,
        ),
        Text(widget.oxygen.vaccine1day1available.toString()),
        Text(widget.oxygen.vaccine1day1date.toDate().day.toString() +
            "/" +
            widget.oxygen.vaccine1day1date.toDate().month.toString() +
            "/" +
            widget.oxygen.vaccine1day1date.toDate().year.toString()),
        Text(widget.oxygen.vaccine1day2available.toString()),
        Text(widget.oxygen.vaccine1day2date.toDate().day.toString() +
            "/" +
            widget.oxygen.vaccine1day2date.toDate().month.toString() +
            "/" +
            widget.oxygen.vaccine1day2date.toDate().year.toString()),
        Text(widget.oxygen.vaccine1day3available.toString()),
        Text(widget.oxygen.vaccine1day3date.toDate().day.toString() +
            "/" +
            widget.oxygen.vaccine1day3date.toDate().month.toString() +
            "/" +
            widget.oxygen.vaccine1day3date.toDate().year.toString()),
        Text(widget.oxygen.vaccine1day4available.toString()),
        Text(widget.oxygen.vaccine1day4date.toDate().day.toString() +
            "/" +
            widget.oxygen.vaccine1day4date.toDate().month.toString() +
            "/" +
            widget.oxygen.vaccine1day4date.toDate().year.toString()),
        Text(widget.oxygen.vaccine1day5available.toString()),
        Text(widget.oxygen.vaccine1day5date.toDate().day.toString() +
            "/" +
            widget.oxygen.vaccine1day5date.toDate().month.toString() +
            "/" +
            widget.oxygen.vaccine1day5date.toDate().year.toString()),
      ]),
    );
  }
}
