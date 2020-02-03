import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import './screens/search_screen.dart';
import './water.dart';
import './data.dart';
import './worklanding.dart';
import 'background/appbackground.dart';
import 'caloriecount.dart';
import 'modal/colors.dart';

class Test extends StatefulWidget {
  @override
  _TestState createState() => _TestState();
}

class _TestState extends State<Test> {
  custom() {}

  nested() {
    return NestedScrollView(
      headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
        return <Widget>[
          SliverAppBar(
            backgroundColor: Colors.black,
            expandedHeight: 350.0,
            floating: false,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              centerTitle: true,
              title: Text(
                "Collapsing Toolbar",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16.0,
                ),
              ),
              background: Image.asset(
                "assets/image_01.png",
                fit: BoxFit.cover,
              ),
            ),
          )
        ];
      },
      body: Center(
        child: Text("Parrot"),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // body: AppBackground(
      //   firstColor: firstCircleColor,
      //   secondColor: secondCircleColor,
      //   thirdColor: thirdCircleColor,
      // ),
      body: Custom(),
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
              Icons.add,
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
          index: 1,
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

class Custom extends StatelessWidget {
  const Custom({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        SliverAppBar(
          backgroundColor: Colors.black,
          expandedHeight: 350.0,
          floating: false,
          pinned: true,
          flexibleSpace: FlexibleSpaceBar(
            centerTitle: true,
            title: Padding(
              padding: const EdgeInsets.only(bottom: 15.0),
              child: Text(
                "Muscle Build",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontSize: 24.0,
                ),
              ),
            ),
            background: Image.asset(
              "assets/image_01.png",
              fit: BoxFit.cover,
            ),
          ),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) => ListTile(
              // title: Text(
              //   "Lunges",
              //   style: TextStyle(
              //     fontWeight: FontWeight.bold,
              //     fontStyle: FontStyle.italic,
              //   ),
              // ),

              //  leading: Icon(Icons.ac_unit),
              //  title: Text("help"),
              //  subtitle: Text("1213"),
              //  trailing: Icon(Icons.apps),

              title: Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(30.0),

                  // elevation: 10.0,
                  child: Container(
                      color: Colors.greenAccent,
                      child: SizedBox(
                        height: 200.0,
                        width: 200.0,
                        child: Padding(
                          padding: const EdgeInsets.only(top:8.0,left: 8.0 ),
                          child: Row(
                            children: <Widget>[
                              Text("Hello",
                              style: TextStyle(
                                fontSize: 30.0,
                                fontWeight: FontWeight.bold,
                              ),
                              
                              ),
                              Text("Hello",
                              style: TextStyle(
                                fontSize: 30.0,
                                fontWeight: FontWeight.bold,
                              ),
                              )
                            ],
                          ),
                        ),
                      )),
                ),
              ),
            ),
            childCount: 3,
          ),
        ),
      ],
    );
  }
}
