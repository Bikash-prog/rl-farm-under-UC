import 'dart:convert';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:rl_farm/apikey.dart';
import 'package:rl_farm/models/location.dart';
import 'package:rl_farm/models/networking.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart' as http;

//const apiKey = 'you have to add your own api key here';
const apiKey = apiKeyDipankar;

// {
// "name":"Polygon Sample",
// "geo_json":{
// "type":"Feature",
// "properties":{
//
// },
// "geometry":{
// "type":"Polygon",
// "coordinates":[
// [
// [91.18378,25.99461],
// [91.18378,26.27302],
// [92.58563,26.27302],
// [92.58563,25.99461],
// [91.18378,25.99461]
// ]
// ]
// }
// }
// }
class NodeMcuController extends StatefulWidget {
  @override
  _NodeMcuControllerState createState() => _NodeMcuControllerState();
}

class _NodeMcuControllerState extends State<NodeMcuController> {
  //final database = FirebaseDatabase.instance;
  bool isClicked = false;

  var location;
  var soilTemperature;
  var soilTemperatureV;
  var moisture;

  void getData() async {
    const url = "https://arduino-96878.firebaseio.com/Data.json";

    try {
      final response = await http.get(url);
      final extractedData = json.decode(response.body);

      location = extractedData['Location'];
      moisture = extractedData['Moisture'];
      soilTemperature = extractedData['Soil Temperature'];
      soilTemperatureV = extractedData['Soil Temperature v'];

      print(location);
      print(moisture);
      print(soilTemperature);
      print(soilTemperatureV);
    } catch (err) {
      throw err;
    }

    // await database
    //      .reference()
    //      .child("Data")
    //      .child("Soil Temperature")
    //      .once()
    //      .then((DataSnapshot data) {
    //    setState(() {
    //      soilTemperature = data.value;
    //    });
    //  });
  }

  void getSoilData() async {
    Location location = Location();
    NetworkHelper networkHelper = NetworkHelper(
        'http://api.agromonitoring.com/agro/1.0/soil?polyid=5aaa8052cbbbb5000b73ff66&appid=$apiKey');
    var getData = await networkHelper.getData();
  }

  @override
  void initState() {
    getData();
    super.initState();
  }

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        centerTitle: true,
        title: RichText(
          text: TextSpan(children: [
            TextSpan(
              text: 'RL',
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
      body: Padding(
        padding: const EdgeInsets.only(left: 16, right: 16),
        child: Container(
          child: Column(
            children: [
              SizedBox(
                height: 10,
              ),
              Container(
                height: MediaQuery
                    .of(context)
                    .size
                    .height * .50,
                width: MediaQuery
                    .of(context)
                    .size
                    .width * .98,
                decoration: BoxDecoration(
                    color: Color(0xff7a9bee),
                    borderRadius: BorderRadius.circular(10)),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        'Soil Condition',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 25,
                            fontWeight: FontWeight.bold),
                      ),
                      ListTile(
                        leading: FaIcon(
                          FontAwesomeIcons.thermometerHalf,
                          color: Colors.white,
                        ),
                        title: Text(
                          'Soil Temperature',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                        trailing: Text(
                          '$soilTemperature°C', //6
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 25,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      ListTile(
                        leading: FaIcon(
                          FontAwesomeIcons.handHoldingWater,
                          color: Colors.white,
                        ),
                        title: Text(
                          'Soil Moisture',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                        trailing: Text(
                          '$moisture%', //17.3
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      ListTile(
                        leading: FaIcon(
                          FontAwesomeIcons.thermometerEmpty,
                          color: Colors.white,
                        ),
                        title: Text(
                          'Soil Temperature ⊻ 10cm',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                        trailing: Text(
                          '$soilTemperatureV °C', //9
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        isClicked = !isClicked;
                      });
                    },
                    child: Container(
                      height: MediaQuery
                          .of(context)
                          .size
                          .height * .1,
                      width: MediaQuery
                          .of(context)
                          .size
                          .width * .4,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Color(0xff7a9bee),
                      ),
                      child: Center(
                        child: isClicked
                            ? Icon(Icons.close, size: 30, color: Colors.white)
                            : FaIcon(FontAwesomeIcons.water,
                            color: Colors.white),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      height: MediaQuery
                          .of(context)
                          .size
                          .height * .1,
                      width: MediaQuery
                          .of(context)
                          .size
                          .width * .4,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Color(0xff7a9bee),
                      ),
                      child: Center(
                        child:
                        Icon(Icons.refresh, size: 30, color: Colors.white),
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 10,
              ),
              GestureDetector(
                onTap: () {},
                child: Container(
                  height: MediaQuery
                      .of(context)
                      .size
                      .height * .15,
                  width: MediaQuery
                      .of(context)
                      .size
                      .width * .92,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Color(0xff7a9bee),
                  ),
                  child: Center(
                    child: FaIcon(
                      FontAwesomeIcons.infinity,
                      color: Colors.white,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
