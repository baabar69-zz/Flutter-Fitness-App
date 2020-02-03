import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../models/user_data.dart';
import '../screens/activity_screen.dart';
import '../screens/create_post_screen.dart';
import '../screens/feed_screen.dart';
import '../screens/profile_screen.dart';
import '../screens/search_screen.dart';
import '../services/auth_service.dart';
import '../water.dart';
import '../worklanding.dart';
import 'package:provider/provider.dart';

import '../caloriecount.dart';
import '../test.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentTab = 0;
  PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  Widget build(BuildContext context) {
    final String currentUserId = Provider.of<UserData>(context).currentUserId;
    return Scaffold(
      body: PageView(
        controller: _pageController,
        children: <Widget>[
          FeedScreen(currentUserId: currentUserId),
          //SearchScreen(),
          CreatePostScreen(),
          ActivityScreen(currentUserId: currentUserId),
          ProfileScreen(
            currentUserId: currentUserId,
            userId: currentUserId,
          ),
        ],
        onPageChanged: (int index) {
          setState(() {
            _currentTab = index;
          });
        },
      ),
      bottomNavigationBar: CurvedNavigationBar(
          height: 50.0,
          color: Colors.white,
          backgroundColor: Colors.black,
          buttonBackgroundColor: Colors.white,
          items: <Widget>[
            Icon(
              Icons.apps,
              size: 20,
              color: Colors.black,
            ),
            Icon(
              Icons.search,
              size: 25.0,
              color: Colors.black,
            ),
            Icon(
              Icons.home,
              size: 20,
              color: Colors.black,
            ),
            Icon(
              Icons.battery_full,
              size: 20,
              color: Colors.black,
            ),
            Icon(
              Icons.fastfood,
              size: 20,
              color: Colors.black,
            ),
          ],
          index: 0,
          animationDuration: Duration(
            milliseconds: 250,
          ),
          animationCurve: Curves.easeInOutBack,
          onTap: (index) {
            if (index == 1) {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => SearchScreen()));
            }
            else if (index == 2) {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => WorkLanding()));
            }
            else if (index == 3) {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Water()));
            }
            else if (index == 4) {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => CalorieCount()));
            }
          },
        ),
    );
  }
}
