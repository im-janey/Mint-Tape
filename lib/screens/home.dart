import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/all.dart';
import 'package:flutter_application_1/screens/banner1.dart';
import 'package:flutter_application_1/screens/map/cafe.dart';
import 'package:flutter_application_1/screens/map/display.dart';
import 'package:flutter_application_1/screens/map/food.dart';
import 'package:flutter_application_1/screens/map/park.dart';
import 'package:flutter_application_1/screens/map/play.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Widget _buildIconButton(String asset, Widget destination) {
    return TextButton(
      onPressed: () => Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => destination),
      ),
      child: Image.asset(asset, height: 55, width: 50),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        toolbarHeight: 120,
        title: Image.asset('assets/logo.png', width: 200, height: 100),
        actions: [
          Stack(
            children: [
              Builder(
                builder: (context) => IconButton(
                  onPressed: () => Scaffold.of(context).openEndDrawer(),
                  icon: Icon(Icons.menu, size: 30),
                  padding: EdgeInsets.only(top: 20, right: 30),
                ),
              ),
              Positioned(
                right: 27,
                top: 18,
                child: Container(
                  width: 8,
                  height: 8,
                  decoration: BoxDecoration(
                    color: Colors.red,
                    shape: BoxShape.circle,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
      endDrawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
              ),
              child: Text(
                'Menu',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Home'),
              onTap: () {
                // Handle Home tap
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text('My Page'),
              onTap: () {
                // Handle My Page tap
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Settings'),
              onTap: () {
                // Handle Settings tap
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.logout),
              title: Text('Logout'),
              onTap: () {
                // Handle Logout tap
                Navigator.pop(context);
              },
            ),
            SizedBox(height: 20),
            Image.asset('assets/Group 317.png'),
          ],
        ),
      ),
      body: Column(
        children: [
          SizedBox(height: 30),
          Banner1(),
          SizedBox(height: 6),
          Card(
            child: Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: '어디로 갈까요?',
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        children: [
                          _buildIconButton('assets/bob.png', Frame()),
                          SizedBox(height: 13),
                          _buildIconButton(
                              'assets/display.png', DisplayFrame()),
                        ],
                      ),
                      Column(
                        children: [
                          _buildIconButton('assets/cafe.png', CafeFrame()),
                          SizedBox(height: 13),
                          _buildIconButton('assets/play.png', PlayFrame()),
                        ],
                      ),
                      Column(
                        children: [
                          _buildIconButton('assets/park.png', ParkFrame()),
                          SizedBox(height: 13),
                          _buildIconButton('assets/all.png', AllPlacesFrame()),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
