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

class Guide extends StatelessWidget {
  popUp(context, linked,) {
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
              "assets/flag.jpg",
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
              top: 140.0,
              left: 100.0,
              child: Text(
                "Human Flag",
                style: TextStyle(
                  color: Colors.black,
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.bold,
                  fontSize: 25.0,
                ),
              ),
            ),
            Positioned(
              bottom: -20,
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
                           Center(
                             child: Text("Just Try mastering the step in their respective manner",
                          style: TextStyle(
                              color: Colors.blueGrey,
                              fontSize: 12.0,
                          ),
                          ),
                           ),
                           SizedBox(height: 10.0,),
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
                                  popUp(context, link2[0], );
                                },
                                child: Text(
                                  "Step 1",
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
                                  popUp(context, link2[1], );
                                },
                                child: Text(
                                  "Step 2",
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
                                  popUp(context, link2[2], );
                                },
                                child: Text(
                                  "Step 3",
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
                                "really good for core",
                              ),
                              trailing: Icon(Icons.touch_app),
                              title: GestureDetector(
                                onTap: () {
                                  popUp(context, link2[3],);
                                },
                                child: Text(
                                  "Step 4",
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
                                "really good for core",
                              ),
                              trailing: Icon(Icons.touch_app),
                              title: GestureDetector(
                                onTap: () {
                                  popUp(context, link2[4], );
                                },
                                child: Text(
                                  "Step 5",
                                  style: TextStyle(
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ),
                         
                          
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
