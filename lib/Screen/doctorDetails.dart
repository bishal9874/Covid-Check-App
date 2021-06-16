import 'package:covidcheck/models/orgServiecs.dart';
import 'package:covidcheck/widgets/link_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:velocity_x/velocity_x.dart';

// ignore: must_be_immutable
class DoctorDetails extends StatefulWidget {
  OrgModel doctorDetails;
  final fee, doctorName, doctordes, herotag, image;
  DoctorDetails(
      {this.doctorDetails,
      this.fee,
      this.doctorName,
      this.doctordes,
      this.herotag,
      this.image});

  @override
  _DoctorDetailsState createState() => _DoctorDetailsState();
}

class _DoctorDetailsState extends State<DoctorDetails> {
  final formKey = new GlobalKey<FormState>();
  final TextEditingController _nameController = new TextEditingController();
  final TextEditingController _aadharNumberController =
      new TextEditingController();
  final TextEditingController _birthyearController =
      new TextEditingController();
  String selectedChoice = "";
  String ageselectedChoice = "";
  String seasonChoice = "";
  String aadharNumber, name, birthyear;
  @override
  Widget build(BuildContext context) {
    return Hero(
        tag: widget.image,
        child: Scaffold(
          appBar: _buildAppBar(context),
          backgroundColor: Colors.blueGrey[700],

          // appBar: _buildAppBar(context),
          body: Stack(
            // fit: StackFit.expand,
            children: <Widget>[
              // _buildBackground(),
              VStack(
                [
                  _buildHeading(context, widget.doctorName, widget.doctordes,
                      widget.fee, widget.image),
                  _buildCoursePanel(context),
                ],
              ),
              //_buildCourseFooter(),
            ],
          ),
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
          IconButton(onPressed: () {}, icon: Icon(Icons.more_vert_rounded)),
        ],
      ),
    );
  }

  _buildCoursePanel(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Expanded(
      child: ClipRRect(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(50),
            topLeft: Radius.circular(50),
          ),
          child: Container(
            color: Colors.black26,
            child: VStack([
              Padding(
                padding: EdgeInsets.only(bottom: 24, top: 25),
                child: Center(
                  child: Text(
                    'Patient Details',
                    style: GoogleFonts.raleway(
                      fontSize: 25,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
              VStack(
                [
                  // VStack([HStack([]).centered()])
                  TextFormField(
                      controller: _nameController,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.blue[80],
                        hintText: " Patient Name",
                        hintStyle: GoogleFonts.raleway(),
                        errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            borderSide:
                                BorderSide(width: 1, color: Colors.red)),
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
                      onChanged: (value) {
                        this.name = value;
                      },
                      validator: (value) =>
                          value.isEmpty ? 'Name is required' : null).p(8.0),
                  SizedBox(
                    height: height * 0.01,
                  ),
                  TextFormField(
                      controller: _birthyearController,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.blue[80],
                        hintText: " Age",
                        hintStyle: GoogleFonts.raleway(),
                        errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            borderSide:
                                BorderSide(width: 1, color: Colors.red)),
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
                      keyboardType: TextInputType.number,
                      inputFormatters: <TextInputFormatter>[
                        FilteringTextInputFormatter.digitsOnly
                      ],
                      onChanged: (value) {
                        this.birthyear = value;
                      },
                      validator: (value) {
                        if (value.isEmpty) {
                          return "please enter your age";
                        } else {
                          return null;
                        }
                      }).p(8.0)
                ],
              ).scrollVertical(),
            ]),
          )),
    );
  }

  _buildHeading(
    BuildContext context,
    String name,
    String description,
    int fee,
    String imgeurl,
  ) {
    return Container(
      margin: EdgeInsets.only(top: 8, bottom: 32),
      padding: EdgeInsets.all(16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(10.0),
            child: Row(
              children: <Widget>[
                Container(
                  height: 90.0,
                  width: 90.0,
                  decoration: BoxDecoration(
                    color: Colors.blue[900],
                    shape: BoxShape.circle,
                  ),
                  child: Container(
                    padding: EdgeInsets.all(3.0),
                    child: Center(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(40.0),
                        child: Image(
                          height: 95.0,
                          width: 95.0,
                          image: AssetImage(imgeurl),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 10.0,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      name,
                      style: GoogleFonts.raleway(
                          fontSize: 19.0, fontWeight: FontWeight.w600),
                    ),
                    SizedBox(
                      height: 5.0,
                    ),
                    Text(
                      description,
                      style: GoogleFonts.raleway(
                          fontSize: 15.0,
                          textStyle: TextStyle(
                            color: Colors.white,
                          )),
                    ),
                    Text(
                      "₹ " + fee.toString(),
                      style: GoogleFonts.notoSans(
                          fontSize: 16.0,
                          color: Colors.yellow,
                          fontWeight: FontWeight.w600),
                    ),
                  ],
                )
              ],
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(
              FontAwesomeIcons.phone,
              color: Colors.red,
              size: 30.0,
            ),
          ),
        ],
      ),
    );
  }
}
