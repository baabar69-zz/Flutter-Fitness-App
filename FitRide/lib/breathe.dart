import 'package:flutter/material.dart';
import './modal/colors.dart';
import './background/appbackground.dart';

class Breath extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar: AppBar(backgroundColor: Colors.,),
      body: Stack(
        children: <Widget>[
          AppBackground(
            firstColor: firstCircleColor,
            secondColor: secondCircleColor,
            thirdColor: thirdCircleColor,
          ),
          Column(
            children: <Widget>[
              Column(
                children: <Widget>[
          
                  Padding(
                    padding: EdgeInsets.only(left: 89.0, top: 120.0),
                    child: Container(
                      width: 500.0,
                      child: Text(
                        'Meditation',
                        style: TextStyle(
                          fontFamily: 'billabong',
                          fontSize: 55.0,
                        ),
                      ),
                    ),
                  ),
                  Text(
                    "Breathing Exercise",
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.5,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 100.0,
              ),
              Container(
                width: 320.0,
                height: 200.0,
                child: ClipOval(
                  //borderRadius: BorderRadius.circular(0.0),
                  child: Image(
                    image: AssetImage('assets/breathe.gif'),
                  ),
                ),
              ),
              SizedBox(height: 35.0,),
              Text("Stay Relaxed & Breathe!",
              style: TextStyle(
                color: Colors.blueGrey,
                letterSpacing: 1.0,
                fontSize: 15.0
              ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
