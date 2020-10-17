import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:rl_farm/drawer_navigation.dart';
import 'package:rl_farm/models/weather_containers.dart';
import 'package:rl_farm/models/weather.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:firebase_database/firebase_database.dart';

class HomePage extends StatefulWidget {
  HomePage({this.locationWeather});

  final locationWeather;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  WeatherModel weather = WeatherModel();
  var temperature;
  var humidity;
  var description;
  var windSpeed;
  String cityName;


  @override
  void initState() {
    super.initState();
    updateContainerUi(widget.locationWeather);
  }

  void updateContainerUi(dynamic weatherData) {
    setState(() {
      if(weatherData==null){
        temperature =0;
        humidity = 0;
        description = 'Error';
        windSpeed = 0;
        cityName = 'Null';
        return;
      }
    });
    temperature = weatherData['main']['temp'];
    humidity = weatherData['main']['humidity'];
    description = weatherData['weather'][0]['description'];
    windSpeed = weatherData['wind']['speed'];
    cityName = weatherData['name'];


    // To upload data
    // final database = FirebaseDatabase.instance;
    // database
    //     .reference()
    //     .child("Data")
    //     .push()
    //     .child("Location2")
    //     .set(cityName)
    //     .asStream();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: RichText(
          text: TextSpan(children: [
            TextSpan(
              text: 'RT',
              style: TextStyle(
                  shadows: [
                    Shadow(
                        color: Color(0xfff0a500),
                        offset: Offset(-1, -1),
                        blurRadius: 1)
                  ],
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Color(0xffffffff)),
            ),
            TextSpan(
              text: ' Farm',
              style: TextStyle(
                  shadows: [
                    Shadow(
                        color: Colors.white,
                        offset: Offset(-1, -1),
                        blurRadius: 1)
                  ],
                  fontSize: 33,
                  fontWeight: FontWeight.bold,
                  color: Color(0xfff0a500)),
            ),
          ]),
        ),
        actions: [
          IconButton(
              icon: Icon(
                Icons.search,
                color: Colors.white,
              ),
              onPressed: () {}),
        ],
      ),
      drawer: DrawerNavigation(),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                weatherContainer(
                  cityName,
                  temperature,
                  humidity,
                  windSpeed,
                  description,
                  MediaQuery
                      .of(context)
                      .size
                      .height * .50,
                  MediaQuery
                      .of(context)
                      .size
                      .width * .98,
                ),
              ],
            ),
            Center(
                child: Text(
                  'Suitable Crops',
                  style: TextStyle(
                      color: Color(0xfff0a500),
                      fontSize: 25,
                      fontWeight: FontWeight.bold),
                )),
            Container(
              height: MediaQuery
                  .of(context)
                  .size
                  .height * .25,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  SizedBox(
                    width: 10,
                  ),
                  _weatherCard('Wheat', 'Rabi or Winter'),
                  SizedBox(
                    width: 10,
                  ),
                  _weatherCard('Rice', 'Different Types In different Season'),
                  SizedBox(
                    width: 10,
                  ),
                  _weatherCard('Millet', 'Between Early October to November'),
                  SizedBox(
                    width: 10,
                  ),
                  _weatherCard('Maize', 'June to July'),
                  SizedBox(
                    width: 10,
                  ),
                  _weatherCard('Mustard', 'Early Summer'),
                  SizedBox(
                    width: 10,
                  ),
                  _weatherCard('Potato', 'Cool But Frost-free Growing Season'),
                  SizedBox(
                    width: 10,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _weatherCard(String cropName, String suitablePeriod) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 500),
      curve: Curves.easeIn,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Color(0xff7a9bee),
        border: Border.all(
            color: Colors.transparent, style: BorderStyle.solid, width: 0.75),
      ),
      height: MediaQuery
          .of(context)
          .size
          .height * .25,
      width: MediaQuery
          .of(context)
          .size
          .width * .6,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListTile(
              leading: Text(
                'Crop:',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
              trailing: Text(
                cropName,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              suitablePeriod,
              style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontSize: MediaQuery
                      .of(context)
                      .size
                      .height * .025,
                  color: Colors.white,
                  fontWeight: FontWeight.w600),
            ),
          ),
        ],
      ),
    );
  }
}
