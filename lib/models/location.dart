import 'package:geolocator/geolocator.dart';

class Location {
  double latitude;
  double longitude;
  Future <void> getCurrentLocation() async {
    try {
      Position position = await getCurrentPosition(
        desiredAccuracy: LocationAccuracy.low,
      );
      latitude = position.latitude;
      longitude = position.longitude;
    } catch (e) {
      print(e);
      //requestPermission();
    }
  }

// Future<void> getPermission() async{
//
//   LocationPermission permission = await checkPermission();
//
//   if(permission == LocationPermission.denied ){
//     await openLocationSettings();
//   }
// }
}