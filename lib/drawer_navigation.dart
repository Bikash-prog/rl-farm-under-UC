import 'package:flutter/material.dart';
import 'package:rl_farm/drawer_element_screens/farming_update_page.dart';
import 'package:rl_farm/drawer_element_screens/nodemcu_controller_screen.dart';


class DrawerNavigation extends StatefulWidget {
  @override
  _DrawerNavigationState createState() => _DrawerNavigationState();
}

class _DrawerNavigationState extends State<DrawerNavigation> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Drawer(
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
              accountName: Text(
                'RT Farm User',
                style: TextStyle(fontSize: 20),
              ),
              accountEmail:  Text('Bot action control and\nGlobal updates about farming'),
              currentAccountPicture: GestureDetector(
                child: CircleAvatar(
                  backgroundColor: Colors.black54,
                  child: Icon(Icons.verified_user,color: Colors.white,),
                ),
              ),
              decoration: BoxDecoration(
                color: Color(0xff7579e7),
              ),
            ),
            ListTile(
              title: Text('Home'),
              leading: Icon(Icons.home),
              onTap: (){

              },
            ),
            ListTile(
              title: Text('NodeMCU controller'),
              leading: Icon(Icons.adb),
              onTap: (){
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) => NodeMcuController(),
                ));
              },
            ),
            ListTile(
              title: Text('Farming updates'),
              leading: Icon(Icons.update),
              onTap: (){
                Navigator.push(context, MaterialPageRoute(
                    builder: (context) => FarmingUpdatePage(),
                ));
              },
            ),
          ],
        ),
      ),
    );
  }
}