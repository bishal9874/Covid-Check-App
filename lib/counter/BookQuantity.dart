import 'package:flutter/foundation.dart';

class BookQuantity with ChangeNotifier {
  int _numberOfBooking = 0;
  int get numberOfbooking => _numberOfBooking;
  display(int no) {
    _numberOfBooking = no;
    notifyListeners();
  }
}
