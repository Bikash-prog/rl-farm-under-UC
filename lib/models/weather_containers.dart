import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
Widget weatherContainer(String cityName, var temperature, var humidity, var windSpeed, var description,  double height, double width) {
  return Padding(
    padding: const EdgeInsets.only(top: 8),
    child: Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
          color: Color(0xff7a9bee),
          borderRadius: BorderRadius.circular(10)
      ),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text('$cityName',style: TextStyle(color: Colors.white,fontSize: 25, fontWeight: FontWeight.bold),),
            ListTile(
              leading: FaIcon(FontAwesomeIcons.thermometerHalf,color: Colors.white,),
              title: Text('Temperature',style: TextStyle(color: Colors.white,fontSize: 20, fontWeight: FontWeight.bold),),
              trailing: Text('$temperature°C',style: TextStyle(color: Colors.white,fontSize: 25, fontWeight: FontWeight.bold),),
            ),
            ListTile(
              leading: FaIcon(FontAwesomeIcons.handHoldingWater,color: Colors.white,),
              title: Text('Humidity',style: TextStyle(color: Colors.white,fontSize: 20, fontWeight: FontWeight.bold),),
              trailing: Text('$humidity%',style: TextStyle(color: Colors.white,fontSize: 20, fontWeight: FontWeight.bold),),
            ),
            ListTile(
              leading: FaIcon(FontAwesomeIcons.wind,color: Colors.white,),
              title: Text('Wind Speed',style: TextStyle(color: Colors.white,fontSize: 20, fontWeight: FontWeight.bold),),
              trailing: Text('$windSpeed',style: TextStyle(color: Colors.white,fontSize: 20, fontWeight: FontWeight.bold),),
            ),
            ListTile(
              leading: FaIcon(FontAwesomeIcons.cloud,color: Colors.white,),
              title: Text('Weather',style: TextStyle(color: Colors.white,fontSize: 20, fontWeight: FontWeight.bold),),
              trailing: Text('$description',style: TextStyle(color: Colors.white,fontSize: 20, fontWeight: FontWeight.bold),),
            ),

          ],
        ),
      ),
    ),
  );
}