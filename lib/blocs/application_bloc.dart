import 'package:covidcheck/services/geolocator.dart';
import 'package:flutter/cupertino.dart';
import 'package:geolocator/geolocator.dart';

class ApplicationBlocs with ChangeNotifier {
  final geoLocatorService = GeolocatorService();

  // variable
  Position currentLoaction;
  ApplicationBlocs() {
    setCurrentLocation();
  }
  setCurrentLocation() async {
    currentLoaction = await geoLocatorService.getCurrentLocation();
    notifyListeners();
  }
}
