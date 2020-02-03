import 'dart:io';
import '../screens/home_screen.dart';
import '../screens/search_screen.dart';

import '../caloriecount.dart';
import '../data.dart';
import 'package:flutter/material.dart';
import '../water.dart';
import '../worklanding.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import '../test.dart';

class Workout extends StatelessWidget {
  popUp(context, linked, nameEx, muscleGroup, equipment) {
    showModalBottomSheet(
        backgroundColor: Colors.transparent,
        isScrollControlled: true,
        context: context,
        builder: (BuildContext context) {
          return Container(
            height: 450.0,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20.0),
                topRight: Radius.circular(20.0),
              ),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20.0),
              child: Column(
                children: <Widget>[
                  // Image(
                  //   fit: BoxFit.fill,
                  //   image: NetworkImage(linked),
                  // )
                  Image.network(
                    linked,
                    loadingBuilder: (context, child, loadingProgress) {
                      if (loadingProgress == null) return child;
                      return Center(
                        child: LinearProgressIndicator(
                          valueColor:
                              AlwaysStoppedAnimation<Color>(Colors.black),
                          backgroundColor: Colors.grey,
                          value: loadingProgress.expectedTotalBytes != null
                              ? loadingProgress.cumulativeBytesLoaded /
                                  loadingProgress.expectedTotalBytes
                              : null,
                        ),
                      );
                    },
                  ),

                  Column(
                    children: <Widget>[
                      SizedBox(
                        height: 10.0,
                      ),
                      Align(
                        alignment: Alignment.topCenter,
                        child: Text(
                          nameEx,
                          style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          "MUSCLE GROUPS:",
                          style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.topLeft,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(5.0),
                          child: Container(
                            width: 60.0,
                            height: 30.0,
                            padding: EdgeInsets.only(
                                left: 8.0, right: 8.0, top: 5.0, bottom: 5.0),
                            color: Colors.black,
                            child: Text(
                              muscleGroup,
                              style: TextStyle(
                                fontSize: 16.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),

                      SizedBox(height: 20.0),

                      Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          "EQUIPMENT NEEDED:",
                          style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.topLeft,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(5.0),
                          child: Container(
                            width: 90.0,
                            height: 25.0,
                            padding: EdgeInsets.only(left: 8.0, right: 8.0,top: 2.0,bottom: 2.0),
                            color: Colors.black,
                            child: Text(
                              equipment,
                              style: TextStyle(
                                fontSize: 16.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                      // Text(muscleGroup),
                      //Text(equipment)
                    ],
                  )
                ],
              ),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    // String link;
    return Scaffold(
      //double widt = MediaQuery.of(context).size.width,
      body: Container(
        child: Stack(
          children: <Widget>[
            Image.asset(
              "assets/back.jpg",
              height: height,
              alignment: Alignment.topCenter,
            ),
            Positioned(
                top: 39.0,
                left: 15.0,
                child: InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                  ),
                )),
            Positioned(
              top: 185.0,
              left: 120.0,
              child: Text(
                "Workouts",
                style: TextStyle(
                  color: Colors.white,
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.bold,
                  fontSize: 25.0,
                ),
              ),
            ),
            Positioned(
              bottom: -52,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(30.0),
                child: Container(
                    //alignment: Alignment.topCenter,
                    width: width,
                    height: height / 1.39,
                    color: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.only(
                        top: 0.0,
                        left: 7.0,
                        right: 7.0,
                        bottom: 10.0,
                      ),
                      child: ListView(
                        children: <Widget>[
                          //0
                          Card(
                            elevation: 7.0,
                            child: ListTile(
                              dense: true,
                              leading: Icon(
                                Icons.directions_run,
                              ),
                              subtitle: Text(
                                "really good for core",
                              ),
                              trailing: Icon(Icons.touch_app),
                              title: GestureDetector(
                                onTap: () {
                                  popUp(context, link[0], "SQUAT", "LEGS",
                                      "NONE");
                                },
                                child: Text(
                                  "Squat",
                                  style: TextStyle(
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ),

                          //1
                          SizedBox(
                            height: 10.0,
                          ),
                          Card(
                            elevation: 7.0,
                            child: ListTile(
                              dense: true,
                              leading: Icon(
                                Icons.directions_run,
                              ),
                              subtitle: Text(
                                "really good for core",
                              ),
                              trailing: Icon(Icons.touch_app),
                              title: GestureDetector(
                                onTap: () {
                                  popUp(context, link[1], "Walkout", "Core",
                                      "NONE");
                                },
                                child: Text(
                                  "Walkout",
                                  style: TextStyle(
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          //2
                          SizedBox(
                            height: 10.0,
                          ),
                          Card(
                            elevation: 7.0,
                            child: ListTile(
                              dense: true,
                              leading: Icon(
                                Icons.directions_run,
                              ),
                              subtitle: Text(
                                "really good for core",
                              ),
                              trailing: Icon(Icons.touch_app),
                              title: GestureDetector(
                                onTap: () {
                                  popUp(context, link[2], "Spider Lunges", "Core",
                                      "NONE");
                                },
                                child: Text(
                                  "Spider Lunges",
                                  style: TextStyle(
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          //3
                          SizedBox(
                            height: 10.0,
                          ),
                          Card(
                            elevation: 7.0,
                            child: ListTile(
                              dense: true,
                              leading: Icon(
                                Icons.directions_run,
                              ),
                              subtitle: Text(
                                "really good for chest",
                              ),
                              trailing: Icon(Icons.touch_app),
                              title: GestureDetector(
                                onTap: () {
                                  popUp(context, link[3], "Push Ups", "Pacs",
                                      "NONE");
                                },
                                child: Text(
                                  "Push Ups",
                                  style: TextStyle(
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          //4
                          SizedBox(
                            height: 10.0,
                          ),
                          Card(
                            elevation: 7.0,
                            child: ListTile(
                              dense: true,
                              leading: Icon(
                                Icons.directions_run,
                              ),
                              subtitle: Text(
                                "really good for upper body",
                              ),
                              trailing: Icon(Icons.touch_app),
                              title: GestureDetector(
                                onTap: () {
                                  popUp(context, link[4], "Plank Tap", "Pacs",
                                      "NONE");
                                },
                                child: Text(
                                  "Plank Tap",
                                  style: TextStyle(
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          //5
                          SizedBox(
                            height: 10.0,
                          ),
                          Card(
                            elevation: 7.0,
                            child: ListTile(
                              dense: true,
                              leading: Icon(
                                Icons.directions_run,
                              ),
                              subtitle: Text(
                                "really good for core",
                              ),
                              trailing: Icon(Icons.touch_app),
                              title: GestureDetector(
                                onTap: () {
                                  popUp(context, link[5], "Planks", "Core",
                                      "NONE");
                                },
                                child: Text(
                                  "Planks",
                                  style: TextStyle(
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          //6
                          SizedBox(
                            height: 10.0,
                          ),
                          Card(
                            elevation: 7.0,
                            child: ListTile(
                              dense: true,
                              leading: Icon(
                                Icons.directions_run,
                              ),
                              subtitle: Text(
                                "really good for legs",
                              ),
                              trailing: Icon(Icons.touch_app),
                              title: GestureDetector(
                                onTap: () {
                                  popUp(context, link[6], "Mountain Climber", "Legs",
                                      "NONE");
                                },
                                child: Text(
                                  "Mountain Climber",
                                  style: TextStyle(
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          //7
                          SizedBox(
                            height: 10.0,
                          ),
                          Card(
                            elevation: 7.0,
                            child: ListTile(
                              dense: true,
                              leading: Icon(
                                Icons.directions_run,
                              ),
                              subtitle: Text(
                                "really good for upper body",
                              ),
                              trailing: Icon(Icons.touch_app),
                              title: GestureDetector(
                                onTap: () {
                                  popUp(context, link[7], "Dumbell Press", "pac",
                                      "Dumbell");
                                },
                                child: Text(
                                  "Dumbell Press",
                                  style: TextStyle(
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          //8
                          SizedBox(
                            height: 10.0,
                          ),
                          Card(
                            elevation: 7.0,
                            child: ListTile(
                              dense: true,
                              leading: Icon(
                                Icons.directions_run,
                              ),
                              subtitle: Text(
                                "really good for arms",
                              ),
                              trailing: Icon(Icons.touch_app),
                              title: GestureDetector(
                                onTap: () {
                                  popUp(context, link[8], "Dumbell Fly", "Arms",
                                      "Dumbell");
                                },
                                child: Text(
                                  "Dumbell Fly",
                                  style: TextStyle(
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          //9
                          SizedBox(
                            height: 10.0,
                          ),
                          Card(
                            elevation: 7.0,
                            child: ListTile(
                              dense: true,
                              leading: Icon(
                                Icons.directions_run,
                              ),
                              subtitle: Text(
                                "really good for legs",
                              ),
                              trailing: Icon(Icons.touch_app),
                              title: GestureDetector(
                                onTap: () {
                                  popUp(context, link[9], "Jump Lunges", "Legs",
                                      "NONE");
                                },
                                child: Text(
                                  "Jump Lunges",
                                  style: TextStyle(
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          //10
                          SizedBox(
                            height: 10.0,
                          ),
                          Card(
                            elevation: 7.0,
                            child: ListTile(
                              dense: true,
                              leading: Icon(
                                Icons.directions_run,
                              ),
                              subtitle: Text(
                                "really good for legs",
                              ),
                              trailing: Icon(Icons.touch_app),
                              title: GestureDetector(
                                onTap: () {
                                  popUp(context, link[10], "Backward Lunges", "Legs",
                                      "NONE");
                                },
                                child: Text(
                                  "Backward Lunges",
                                  style: TextStyle(
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          //11
                          SizedBox(
                            height: 10.0,
                          ),
                          Card(
                            elevation: 7.0,
                            child: ListTile(
                              dense: true,
                              leading: Icon(
                                Icons.directions_run,
                              ),
                              subtitle: Text(
                                "really good for legs",
                              ),
                              trailing: Icon(Icons.touch_app),
                              title: GestureDetector(
                                onTap: () {
                                  popUp(context, link[11], "Lunges", "Legs",
                                      "NONE");
                                },
                                child: Text(
                                  "Lunges",
                                  style: TextStyle(
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 40.0,
                          )
                        ],
                      ),
                    )
                    
                    ),
              ),
            ),
          ],
        ),
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
        index: 2,
        animationDuration: Duration(
          milliseconds: 250,
        ),
        animationCurve: Curves.easeInOutBack,
        onTap: (index) {
          if (index == 1) {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => SearchScreen()));
          } else if (index == 0) {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => HomeScreen()));
          } else if (index == 3) {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => Water()));
          } else if (index == 4) {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => CalorieCount()));
          }
        },
      ),
    );
  }
}
