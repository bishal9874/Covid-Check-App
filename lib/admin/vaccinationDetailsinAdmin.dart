// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:covidcheck/models/orgServiecs.dart';
// import 'package:covidcheck/models/vaccinationModel.dart';

// import 'package:flutter/material.dart';
// import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
// import 'package:velocity_x/velocity_x.dart';

// class Vaccineadmin extends StatefulWidget {
//   @override
//   _VaccineadminState createState() => _VaccineadminState();
// }

// class _VaccineadminState extends State<Vaccineadmin> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(),
//       body: CustomScrollView(
//         slivers: [
//           StreamBuilder<QuerySnapshot>(
//             stream: FirebaseFirestore.instance
//                 .collection("Details")
//                 .limit(10)
//                 .orderBy("publishedDate", descending: true)
//                 .snapshots(),
//             builder: (context, dataShot) {
//               return !dataShot.hasData
//                   ? SliverToBoxAdapter(
//                       child: Center(
//                         child: CircularProgressIndicator(),
//                       ),
//                     )
//                   : SliverStaggeredGrid.countBuilder(
//                       crossAxisCount: 1,
//                       staggeredTileBuilder: (c) => StaggeredTile.fit(1),
//                       itemBuilder: (context, index) {
//                         OrgModel model =
//                             OrgModel.fromJson(dataShot.data.docs[index].data());
//                         return vaccineinfo(model, context);
//                       },
//                       itemCount: dataShot.data.docs.length);
//             },
//           )
//         ],
//       ),
//     );
//   }

//   vaccineinfo(OrgModel model, BuildContext context,
//       {Color background, removeCartFunction}) {
//     return InkWell(
//         onTap: () {
//           //Get.to(OrgDetailPage(orgModel: model));
//         },
//         splashColor: Colors.grey,
//         child: Padding(
//             padding: const EdgeInsets.all(10.0),
//             child: Container(
//               child: VStack([
//                 Text(model.organization),
//                 // Text(widget.vaccineModel.username),
//                 // Text(widget.vaccineModel.organization),
//                 // Text(widget.vaccineModel.nameofvacciner),
//                 // Text(widget.vaccineModel.aadherNumber),
//                 // Text(widget.vaccineModel.birthyr),
//               ]),
//             )));
//   }
// }

// beginbuildCart() {}
