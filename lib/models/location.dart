import 'package:geolocator/geolocator.dart';

class Location {
  double latitude;
  double longitude;
  Future <void> getCurrentLocation() async {
    try{
      Position position = await getCurrentPosition(desiredAccuracy: LocationAccuracy.low,
      );
      latitude = position.latitude;
      longitude = position.longitude;
    }
    catch (e){
      print(e);
      // getPermission();
      }
    }
  // Future<void> getPermission() async{
  //   LocationPermission permission = await checkPermission();
  //   if(permission == LocationPermission.denied){
  //     await openLocationSettings();
  //   }
  // }
  }
  // _showFormInDialog(BuildContext context) {
  //   return showDialog(
  //       context: context,
  //       barrierDismissible: true,
  //       builder: (param) {
  //         return AlertDialog(
  //           actions: [
  //             FlatButton(
  //               onPressed: () async {
  //                 print('ok');
  //               },
  //               child: Text('OK'),
  //             )
  //           ],
  //           content: SingleChildScrollView(
  //             child: Column(
  //               children: [
  //                 Center(
  //                   child: Text(
  //                     'Please go to settings and Turn on the Location.',
  //                     style: TextStyle(
  //                         fontFamily: 'Montserrat',
  //                         fontSize: MediaQuery
  //                             .of(context)
  //                             .size
  //                             .height * .025,
  //                         color: Color(0xff7a9bee),
  //                         fontWeight: FontWeight.w600),
  //                   ),
  //                 ),
  //               ],
  //             ),
  //           ),
  //         );
  //       });
  // }
