import 'dart:ui';

import "package:flutter/material.dart";
import 'package:flutter/services.dart';
import './background/appbackground.dart';
import './modal/colors.dart';
import './topbar/topbar.dart';

class Water extends StatefulWidget {
  @override
  _WaterState createState() => _WaterState();
}

class _WaterState extends State<Water> {
  String val;
  double _value = 0;
  //static int input;
  // double one = double.parse('$_value');
  double help;
  double latest;

  @override
  Widget build(BuildContext context) {
    // _value.toString();
    // help = double.parse('$_value');
    double dob = 400;

    double heig = MediaQuery.of(context).size.height;
    double widt = MediaQuery.of(context).size.height;
    print("shuru mai value ki $_value");
    latest = 390.0 - _value;
    print("shuru mai latest ki $latest");

    return Scaffold(
      body: Stack(
        children: <Widget>[
          AppBackground(
            firstColor: firstCircleColor,
            secondColor: secondCircleColor,
            thirdColor: thirdCircleColor,
          ),
          TopBar(),
          InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Padding(
              padding: const EdgeInsets.only(top: 39.0, left: 20.0),
              child: Icon(
                Icons.arrow_back,
                color: Colors.white,
              ),
            ),
          ),
          Positioned(
            top: 100.0,
            left: 90.0,
            child: Text(
              "Water Counter",
              style: TextStyle(
                color: Colors.white,
                fontSize: 25.0,
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Positioned(
            top: 250.0,
            left: 90.0,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(30.0),
              child: Container(
                height: 399.5,
                width: 200.0,
                child: Stack(
                  children: <Widget>[
                    Positioned(
                      top: latest,
                      // bottom: one,
                      //bottom: 200.0,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20.0),
                        child: Container(
                          height: dob,
                          width: 200.0,
                          color: Colors.blue,
                        ),
                      ),
                    ),
                    Image.asset("assets/body.png"),
                  ],
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Card(
              elevation: 10.0,
              child: TextFormField(
                //,controller: _controller,
                keyboardType: TextInputType.number,
                inputFormatters: <TextInputFormatter>[
                  WhitelistingTextInputFormatter.digitsOnly
                ],
                decoration: InputDecoration(
                  labelText: "Please enter water in ml",
                  hintText: "Total capacity right now is 395",
                  icon: Icon(Icons.phone_iphone),
                ),
                //onSaved: (input) => _value = num.tryParse(input)
                onFieldSubmitted: (input) {
                  setState(() {
                    _value = double.parse(input);
                  });
                },
                //  onFieldSubmitted: (input){
                //   setState(() {
                //     _value = double.parse(input);
                //     print(_value);
                //   });
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: FlatButton(
              child: Container(
                padding: const EdgeInsets.only(top: 11.0, bottom: 24.0),
                child: Text(
                  "Add",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              onPressed: () {
                //print(one);
              },
              textColor: Colors.blue,
            ),
          ),
        ],
      ),
    );
  }
}
