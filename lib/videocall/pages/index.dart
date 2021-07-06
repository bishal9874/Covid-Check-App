import 'dart:async';

import 'package:agora_rtc_engine/rtc_engine.dart';
import 'package:covidcheck/models/appointmentModel.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:velocity_x/velocity_x.dart';
import './call.dart';

// ignore: must_be_immutable
class IndexPage extends StatefulWidget {
  final doctorName;
  IndexPage({this.doctorName});
  @override
  State<StatefulWidget> createState() => IndexState();
}

class IndexState extends State<IndexPage> {
  /// create a channelController to retrieve text value
  final _channelController = TextEditingController();

  /// if channel textField is validated to have error
  bool _validateError = false;

  ClientRole _role = ClientRole.Broadcaster;

  @override
  void dispose() {
    // dispose input controller
    _channelController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: _buildAppBar(context),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        height: 400,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              child: RichText(
                text: TextSpan(
                  style: TextStyle(fontSize: 15.0),
                  children: <TextSpan>[
                    TextSpan(
                        text: 'Appointment with  ',
                        style: GoogleFonts.comfortaa(
                            fontWeight: FontWeight.w700, color: Colors.white)),
                    TextSpan(
                        text: widget.doctorName,
                        style: GoogleFonts.comfortaa(
                            fontWeight: FontWeight.w600, color: Colors.orange)),
                  ],
                ),
              ),
            ).centered(),
            SizedBox(
              height: height * 0.03,
            ),
            Row(
              children: <Widget>[
                Expanded(
                    child: TextField(
                  controller: _channelController,
                  decoration: InputDecoration(
                    errorText:
                        _validateError ? 'Channel name is mandatory' : null,
                    border: UnderlineInputBorder(
                      borderSide: BorderSide(width: 1),
                    ),
                    hintText: 'Channel name',
                  ),
                ))
              ],
            ),
            Column(
              children: [
                ListTile(
                  title: Text(ClientRole.Broadcaster.toString()),
                  leading: Radio(
                    value: ClientRole.Broadcaster,
                    groupValue: _role,
                    onChanged: (ClientRole value) {
                      setState(() {
                        _role = value;
                      });
                    },
                  ),
                ),
                ListTile(
                  title: Text(ClientRole.Audience.toString()),
                  leading: Radio(
                    value: ClientRole.Audience,
                    groupValue: _role,
                    onChanged: (ClientRole value) {
                      setState(() {
                        _role = value;
                      });
                    },
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: ElevatedButton(
                      onPressed: onJoin,
                      child: Text('Join'),
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.blueAccent),
                          foregroundColor:
                              MaterialStateProperty.all(Colors.white)),
                    ),
                  ),
                  // Expanded(
                  //   child: RaisedButton(
                  //     onPressed: onJoin,
                  //     child: Text('Join'),
                  //     color: Colors.blueAccent,
                  //     textColor: Colors.white,
                  //   ),
                  // )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Future<void> onJoin() async {
    // update input validation
    setState(() {
      _channelController.text.isEmpty
          ? _validateError = true
          : _validateError = false;
    });
    if (_channelController.text.isNotEmpty) {
      // await for camera and mic permissions before pushing video page
      await _handleCameraAndMic(Permission.camera);
      await _handleCameraAndMic(Permission.microphone);
      // push video page with given channel name
      await Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => CallPage(
            channelName: _channelController.text,
            role: _role,
          ),
        ),
      );
    }
  }

  Future<void> _handleCameraAndMic(Permission permission) async {
    final status = await permission.request();
    print(status);
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
          Text("CovidCheck Virtual Appointment ",
              style: GoogleFonts.comfortaa(fontSize: 13.0)),
          IconButton(onPressed: () {}, icon: Icon(Icons.more_vert_rounded)),
        ],
      ),
    );
  }
}
