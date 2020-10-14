import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'home_page.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:rl_farm/models/networking.dart';
import 'models/location.dart';


const apiKey = 'Here you have to add your own apiKey.';

Map<int, Color> color =
{
  50:Color.fromRGBO(117,121,231, 1),
  100:Color.fromRGBO(117,121,231, 1),
  200:Color.fromRGBO(117,121,231, 1),
  300:Color.fromRGBO(117,121,231, 1),
  400:Color.fromRGBO(117,121,231, 1),
  500:Color.fromRGBO(117,121,231, 1),
  600:Color.fromRGBO(117,121,231, 1),
  700:Color.fromRGBO(117,121,231, 1),
  800:Color.fromRGBO(117,121,231, 1),
  900:Color.fromRGBO(117,121,231, 1),
};


class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    MaterialColor customColor = MaterialColor(0xff7579e7,color);

    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp]
    );
    return MaterialApp(
      debugShowCheckedModeBanner: false,
         theme: ThemeData(
           primarySwatch: customColor,
         ),
        home: LoadingScreen(),
    );
  }
}
class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {

  @override
  void initState() {
    super.initState();
    getLocationData();
  }

  void getLocationData() async {
    Location location = Location();
    await location.getCurrentLocation();
    NetworkHelper networkHelper = NetworkHelper('https://api.openweathermap.org/data/2.5/weather?lat=${location.latitude}&lon=${location.longitude}&appid=$apiKey&units=metric');
    var weatherData = await networkHelper.getData();
    Navigator.push(context, MaterialPageRoute(
        builder: (context) => HomePage(locationWeather: weatherData),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SpinKitWave(
          color: Color(0xff7a9bee),
          size: 50.0,
        ),
      ),
    );
  }
}

