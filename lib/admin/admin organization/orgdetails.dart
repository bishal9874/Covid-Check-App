import 'package:covidcheck/models/orgServiecs.dart';
import 'package:covidcheck/services/ser.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:velocity_x/velocity_x.dart';

// ignore: must_be_immutable
class OrgDetailsUpdate extends StatefulWidget {
  OrgModel orgdetailsUpdate;
  OrgDetailsUpdate({Key key, this.orgdetailsUpdate});

  @override
  _OrgDetailsUpdateState createState() => _OrgDetailsUpdateState();
}

class _OrgDetailsUpdateState extends State<OrgDetailsUpdate> {
  String vaccine1, vaccine2, vaccine3;
  TextEditingController _vaccine1NameUpadte = new TextEditingController();
  TextEditingController _vaccine2NameUpadte = new TextEditingController();
  // TextEditingController _vaccine3NameUpadte = new TextEditingController();
  final formKey = new GlobalKey<FormState>();

  checkFields() {
    final form = formKey.currentState;
    if (form.validate()) {
      form.save();
      return true;
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: _buildupdate(context),
    );
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
          Text(widget.orgdetailsUpdate.organization + " Admin Pannel",
              style: GoogleFonts.comfortaa(fontSize: 18.0)),
          IconButton(onPressed: () {}, icon: Icon(Icons.more_vert_rounded)),
        ],
      ),
    );
  }

  _buildupdate(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Container(
      margin: EdgeInsets.all(10.0),
      padding: EdgeInsets.all(5.0),
      child: VStack([
        Text("Vaccine",
                style:
                    GoogleFonts.comfortaa(color: Colors.orange, fontSize: 18.0))
            .centered(),
        Container(
          decoration: BoxDecoration(
              color: Colors.blueGrey[700],
              borderRadius: BorderRadius.circular(10.0)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text("Vaccine 1",
                      style: GoogleFonts.comfortaa(
                          color: Colors.orangeAccent, fontSize: 18.0))
                  .centered(),
              Text(widget.orgdetailsUpdate.vaccine1,
                      style: GoogleFonts.comfortaa(
                          color: Colors.white, fontSize: 18.0))
                  .centered(),
              IconButton(
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (c) {
                          return Dialog(
                            child: Form(
                                key: formKey,
                                child: Container(
                                  height: height * 0.25,
                                  width: width * 0.80,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        widget.orgdetailsUpdate.vaccine1 +
                                            " Update to",
                                        style: GoogleFonts.comfortaa(
                                            fontSize: 13.0,
                                            color: Colors.orangeAccent),
                                      ),
                                      SizedBox(
                                        height: height * .01,
                                      ),
                                      TextFormField(
                                          controller: _vaccine1NameUpadte,
                                          decoration: InputDecoration(
                                            filled: true,
                                            fillColor: Colors.blue[80],
                                            hintText: "Vaccine 1",
                                            hintStyle: GoogleFonts.comfortaa(
                                              fontSize: 13.0,
                                            ),
                                            errorBorder: OutlineInputBorder(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(10)),
                                                borderSide: BorderSide(
                                                    width: 1,
                                                    color: Colors.red)),
                                            focusedErrorBorder:
                                                OutlineInputBorder(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(10)),
                                            ),
                                            border: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Colors.white),
                                              borderRadius:
                                                  const BorderRadius.all(
                                                const Radius.circular(10.0),
                                              ),
                                            ),
                                          ),
                                          onChanged: (value) {
                                            this.vaccine1 = value;
                                          },
                                          validator: (value) => value.isEmpty
                                              ? 'Vaccine 1 is required'
                                              : null),
                                      SizedBox(
                                        height: height * .01,
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          if (checkFields())
                                            CovidCheckApp.firestore
                                                .collection("Details")
                                                .doc(widget.orgdetailsUpdate
                                                        .docnumber +
                                                    widget.orgdetailsUpdate
                                                        .organization)
                                                .update({
                                              "vaccine1": _vaccine1NameUpadte
                                                  .text
                                                  .trim()
                                            });
                                          Navigator.pop(context);
                                        },
                                        child: Container(
                                            height: height * 0.06,
                                            width: width * 0.20,
                                            child: Material(
                                                borderRadius:
                                                    BorderRadius.circular(5.0),
                                                color: Color(0xFF2877ed),
                                                elevation: 0.0,
                                                child: Center(
                                                    child: Text('Save',
                                                        style:
                                                            GoogleFonts.raleway(
                                                                color: Colors
                                                                    .white,
                                                                fontSize:
                                                                    18.0))))),
                                      ).centered(),
                                    ],
                                  ),
                                )),
                          );
                        });
                    // CovidCheckApp.firestore
                    //     .collection("apppointment")
                    //     .doc(widget.orgdetailsUpdate.docnumber +
                    //         widget.orgdetailsUpdate.organization)
                    //     .update({"vaccine1": model.virtualAppoint});
                  },
                  icon: Icon(Icons.edit))
            ],
          ),
        ),
        SizedBox(height: height * 0.01),
        Container(
          decoration: BoxDecoration(
              color: Colors.blueGrey[700],
              borderRadius: BorderRadius.circular(10.0)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text("Vaccine 2",
                      style: GoogleFonts.comfortaa(
                          color: Colors.orangeAccent, fontSize: 18.0))
                  .centered(),
              Text(widget.orgdetailsUpdate.vaccine2,
                      style: GoogleFonts.comfortaa(
                          color: Colors.white, fontSize: 18.0))
                  .centered(),
              IconButton(
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (c) {
                          return Dialog(
                            child: Form(
                                key: formKey,
                                child: Container(
                                  height: height * 0.25,
                                  width: width * 0.80,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        widget.orgdetailsUpdate.vaccine2 +
                                            " Update to",
                                        style: GoogleFonts.comfortaa(
                                            fontSize: 13.0,
                                            color: Colors.orangeAccent),
                                      ),
                                      SizedBox(
                                        height: height * .01,
                                      ),
                                      TextFormField(
                                          controller: _vaccine2NameUpadte,
                                          decoration: InputDecoration(
                                            filled: true,
                                            fillColor: Colors.blue[80],
                                            hintText: "Vaccine 2",
                                            hintStyle: GoogleFonts.comfortaa(
                                                fontSize: 13.0,
                                                color: Colors.orangeAccent),
                                            errorBorder: OutlineInputBorder(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(10)),
                                                borderSide: BorderSide(
                                                    width: 1,
                                                    color: Colors.red)),
                                            focusedErrorBorder:
                                                OutlineInputBorder(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(10)),
                                            ),
                                            border: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Colors.white),
                                              borderRadius:
                                                  const BorderRadius.all(
                                                const Radius.circular(10.0),
                                              ),
                                            ),
                                          ),
                                          onChanged: (value) {
                                            this.vaccine1 = value;
                                          },
                                          validator: (value) => value.isEmpty
                                              ? 'Vaccine 2 is required'
                                              : null),
                                      SizedBox(
                                        height: height * .01,
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          if (checkFields())
                                            CovidCheckApp.firestore
                                                .collection("Details")
                                                .doc(widget.orgdetailsUpdate
                                                        .docnumber +
                                                    widget.orgdetailsUpdate
                                                        .organization)
                                                .update({
                                              "vaccine2": _vaccine2NameUpadte
                                                  .text
                                                  .trim()
                                            });
                                          Navigator.pop(context);
                                        },
                                        child: Container(
                                            height: height * 0.06,
                                            width: width * 0.20,
                                            child: Material(
                                                borderRadius:
                                                    BorderRadius.circular(5.0),
                                                color: Color(0xFF2877ed),
                                                elevation: 0.0,
                                                child: Center(
                                                    child: Text('Save',
                                                        style:
                                                            GoogleFonts.raleway(
                                                                color: Colors
                                                                    .white,
                                                                fontSize:
                                                                    18.0))))),
                                      ).centered(),
                                    ],
                                  ),
                                )),
                          );
                        });
                    // CovidCheckApp.firestore
                    //     .collection("apppointment")
                    //     .doc(widget.orgdetailsUpdate.docnumber +
                    //         widget.orgdetailsUpdate.organization)
                    //     .update({"vaccine1": model.virtualAppoint});
                  },
                  icon: Icon(Icons.edit))
            ],
          ),
        ),
      ]),
    );
  }
}
