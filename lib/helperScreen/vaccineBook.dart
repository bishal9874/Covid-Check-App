import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:covidcheck/models/vaccinationModel.dart';
import 'package:covidcheck/services/ser.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class VaccineBook extends StatefulWidget {
  @override
  _VaccineBookState createState() => _VaccineBookState();
}

class _VaccineBookState extends State<VaccineBook> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance
              .collection(CovidCheckApp.collectionUser)
              .doc(CovidCheckApp.sharedPreferences
                  .getString(CovidCheckApp.userUID))
              .collection(CovidCheckApp.vaccinecollection)
              .orderBy("publishDate", descending: true)
              .snapshots(),
          builder: (context, dataShot) {
            if (!dataShot.hasData) {
              return Container(
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              );
            } else {
              if (dataShot.data.docs.length == 0) {
                return Container(
                  child: Center(
                    child: Text("Your Vaccine Booking is Empty"),
                  ),
                );
              } else {
                return ListView.builder(
                  itemCount: dataShot.data.docs.length,
                  itemBuilder: (context, index) {
                    VaccineModel model =
                        VaccineModel.fromJson(dataShot.data.docs[index].data());

                    return vaccineinfo(model, context);
                  },
                );
              }
            }
          },
        ));
  }

  beginbuildCart() {}

  Widget vaccineinfo(VaccineModel model, BuildContext context,
      {Color background, removeCartFunction}) {
    return InkWell(
        onTap: () {
          //Get.to(OrgDetailPage(orgModel: model));
        },
        splashColor: Colors.grey,
        child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              child: HStack([
                VStack([
                  Text(model.useremail),
                  Text(model.username),
                  Text(model.organization),
                  Text(model.nameofvacciner),
                  Text(model.season),
                  Text(model.dateTime.toDate().toString()),
                  Text(model.aadherNumber.toString()),
                  Text(model.birthyr.toString()),
                  Text(model.genderChoice)
                ]),
                IconButton(
                    onPressed: () {
                      removecart(model.aadherNumber.toString());
                    },
                    icon: Icon(Icons.remove_shopping_cart))
              ]),
            )));
  }

  removecart(String mod) {
    List vaccineList = CovidCheckApp.sharedPreferences
        .getStringList(CovidCheckApp.userCartList);
    vaccineList.remove(mod);

    CovidCheckApp.firestore
        .collection(CovidCheckApp.collectionUser)
        .doc(CovidCheckApp.sharedPreferences.getString(CovidCheckApp.userUID))
        .update({
      CovidCheckApp.userCartList: vaccineList,
    }).then((value) {
      VxToast.show(
        context,
        msg: "Your vaccine Booking Cancel Successfully",
        showTime: 6000,
        position: VxToastPosition.bottom,
      );
      CovidCheckApp.sharedPreferences
          .setStringList(CovidCheckApp.userCartList, vaccineList);
      //Provider.of<BookItemCounter>(context, listen: false).displayResult();
    });
    CovidCheckApp.firestore
        .collection(CovidCheckApp.collectionUser)
        .doc(CovidCheckApp.sharedPreferences.getString(CovidCheckApp.userUID))
        .collection(CovidCheckApp.vaccinecollection)
        .doc(CovidCheckApp.sharedPreferences.getString(CovidCheckApp.userUID) +
            mod)
        .delete();
  }
}
