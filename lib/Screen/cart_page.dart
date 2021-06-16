import 'package:covidcheck/counter/totalamount.dart';
import 'package:covidcheck/services/ser.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

class CartPage extends StatefulWidget {
  const CartPage({Key key}) : super(key: key);

  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  double totalAmount;

  @override
  void initState() {
    super.initState();
    totalAmount = 0;
    Provider.of<TotalAmount>(context, listen: false).display(0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          if (CovidCheckApp.sharedPreferences
                  .getStringList(CovidCheckApp.userCartList)
                  .length ==
              1) {
            Fluttertoast.showToast(msg: "Cart is empty");
          }
        },
      ),
      appBar: AppBar(),
    );
  }
}
