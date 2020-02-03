import 'dart:io';
import 'package:flutter/services.dart';
import './breathe.dart';
import './screens/home_screen.dart';
import './screens/search_screen.dart';
import './water.dart';

import './data.dart';
import 'package:flutter/material.dart';
import './worklanding.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import './test.dart';

class CalorieCount extends StatefulWidget {
  @override
  _MeditationState createState() => _MeditationState();
}

class _MeditationState extends State<CalorieCount> {
  popUp(context, linked) {
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
                  Image(
                    fit: BoxFit.fill,
                    image: NetworkImage(linked),
                  )
                ],
              ),
            ),
          );
        });
  }

  int add;
  int totalWater = 0;
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
              "assets/health.jpg",
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
              top: 208.0,
              left: 150.0,
              child: Text(
                "Health",
                style: TextStyle(
                  color: Colors.black,
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.bold,
                  fontSize: 25.0,
                ),
              ),
            ),
            Positioned(
              bottom: -75,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(30.0),
                child: Container(
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
                        Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: Card(
                            elevation: 15.0,
                            color: Colors.white,
                            child: SizedBox(
                              height: 290.0,
                              width: 200.0,
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(top: 0.0, left: 8.0),
                                child: Align(
                                  alignment: Alignment.topCenter,
                                  child: Column(
                                    children: <Widget>[
                                      Row(
                                        //crossAxisAlignment: CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: <Widget>[
                                          Text(
                                            "Calorie Counter",
                                            style: TextStyle(
                                              fontSize: 28.0,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(60.0),
                                            child: Image.asset(
                                              "assets/pizza.png",
                                              width: 80.0,
                                              height: 80.0,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Text("Enter Calorie for each meal",
                                              style: TextStyle(fontSize: 13.0)),
                                          Card(
                                            child: Padding(
                                              padding: EdgeInsets.all(8.0),
                                              child: Form(
                                                // key: formKey,
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  children: <Widget>[
                                                    TextField(
                                                      decoration:
                                                          new InputDecoration(
                                                              labelText:
                                                                  "Enter calories (kcal)"),
                                                      cursorColor: Colors.black,
                                                      keyboardType:
                                                          TextInputType.number,
                                                      inputFormatters: <
                                                          TextInputFormatter>[
                                                        WhitelistingTextInputFormatter
                                                            .digitsOnly
                                                      ],
                                                      onSubmitted: (addWater) {
                                                        setState(() {
                                                          add = int.parse(
                                                              addWater);

                                                          totalWater =
                                                              totalWater + add;

                                                          print(totalWater);
                                                        });
                                                      },
                                                    ),
                                                    FlatButton(
                                                      child:
                                                          Text("Add Calories"),
                                                      textColor: Colors.black,
                                                      onPressed: () {
                                                        setState(
                                                          () {
                                                            print(
                                                                "ya $add");
                                                            totalWater =
                                                                totalWater +
                                                                    add;
                                                          },
                                                        );
                                                      },
                                                    ),
                                                    Text(
                                                      "the total Calories intake for today is $totalWater",
                                                      style: TextStyle(
                                                          fontSize: 16.0,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontStyle:
                                                              FontStyle.italic),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 14.0,
                        ),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(20.0),
                          child: InkWell(
                             onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Breath()));
                      },
                                                      child: Card(
                              elevation: 20.0,
                              child: Container(
                                height: 80.0,
                                width: 0.0,
                                color: Colors.orangeAccent,
                                child: Center(child: Text("Tap On this Card to Meditate!",
                                style: TextStyle(
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.bold
                                ),
                                )),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),

                  //alignment: Alignment.centerLeft,
                  //padding: const EdgeInsets.only(left: 10.0,top:7.0, ),
                  // child: Text("Hello")
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
        index: 4,
        animationDuration: Duration(
          milliseconds: 250,
        ),
        animationCurve: Curves.easeInOutBack,
        onTap: (index) {
          if (index == 1) {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => SearchScreen()));
          } else if (index == 2) {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => WorkLanding()));
          } else if (index == 3) {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => Water()));
          } else if (index == 0) {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => HomeScreen()));
          }
        },
      ),
    );
  }
}
