import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class SearchService {}

class SearchOrg extends StatefulWidget {
  @override
  _SearchOrgState createState() => new _SearchOrgState();
}

class _SearchOrgState extends State<SearchOrg> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(),
    );
  }
}

Widget buildResultCard(data) {
  return Card();
}
