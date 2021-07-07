import 'package:covidcheck/services/ser.dart';
import 'package:flutter/foundation.dart';

class BookItemCounter extends ChangeNotifier {
  int _counter = CovidCheckApp.sharedPreferences
          .getStringList(CovidCheckApp.userCartList)
          .length -
      1;
  int get count => _counter;

  Future<void> displayResult() async {
    // ignore: unused_local_variable
    int _counter = CovidCheckApp.sharedPreferences
            .getStringList(CovidCheckApp.userCartList)
            .length -
        1;
    await Future.delayed(const Duration(milliseconds: 100), () {
      notifyListeners();
    });
  }
}
