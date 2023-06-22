import 'package:location/location.dart';

import 'globals.dart';

class LocationDataAccess{

  Location location = new Location();

  bool? _serviceEnabled;
  PermissionStatus? _permissionGranted;
  LocationData? _locationData;

  Future<LocationData?> getLocationData() async {
    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled!) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled!) {
        Future.value(false);
        return _locationData;
      }
    }

    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        Future.value(false);
        return _locationData;
      }
    }

    _locationData = await location.getLocation();
    //print('loc data - ${_locationData!.latitude}');

    try{
      currentLatitude = _locationData!.latitude ?? 0.0;
      currentLongitude = _locationData!.longitude ?? 0.0;
    }catch(_){
      currentLatitude = 0.0;
      currentLongitude = 0.0;
    }

    Future.value(_locationData);

    return _locationData;
  }

  Future<bool> chechLocatioinPermission() async{
    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled!) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled!) {
        return false;
      }
    }

    _permissionGranted = await location.hasPermission();
    //print('permmdd - ${_permissionGranted}');
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return false;
      }else{
        return true;
      }
    }
    return true;
  }
}