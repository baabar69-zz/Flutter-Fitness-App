import 'package:flutter/material.dart';
import './breathe.dart';
import './pages/workguide.dart';
import './screens/home_screen.dart';
import './screens/search_screen.dart';
import './caloriecount.dart';

import './modal/colors.dart';
import './pages/bottomsheet.dart';
import './pages/workout.dart';
import './test.dart';
import './water.dart';
import 'customIcons.dart';
import 'data.dart';
import 'dart:math';
import 'background/appbackground.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

void main() => runApp(MaterialApp(
      home: WorkLanding(),
      debugShowCheckedModeBanner: false,
    ));

class WorkLanding extends StatefulWidget {
  static final String id = 'workingland';

  @override
  _MyAppState createState() => new _MyAppState();
}

var cardAspectRatio = 12.0 / 16.0;
var widgetAspectRatio = cardAspectRatio * 1.2;

class _MyAppState extends State<WorkLanding> {
  var currentPage = images.length - 1.0;

  @override
  Widget build(BuildContext context) {
    PageController controller = PageController(initialPage: images.length - 1);
    controller.addListener(() {
      setState(() {
        currentPage = controller.page;
      });
    });

    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
            colors: [
              Color(0xFF1b1e44),
              Color(0xFF2d3447),
            ],
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
            tileMode: TileMode.clamp),
      ),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(
                    left: 12.0, right: 12.0, top: 39.0, bottom: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    // IconButton(
                    //   icon: Icon(
                    //     Icons.menu,
                    //     color: Colors.black,
                    //     size: 30.0,
                    //   ),
                    //   onPressed: () {},
                    // ),

                    Text("FitRide",
                    style: TextStyle(
                      fontSize: 49.0,
                     // fontWeight: FontWeight.bold,
                      fontFamily: 'Billabong'

                    ),),
                    // Image(image: AssetImage("assets/logofitness.png"),
                    // width: 30.0,
                    // height: 30.0,)
                  ],
                ),
              ),
              Hero(
                tag: AppBackground,
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => CalorieCount()));
                    },
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            "What You Will Get!",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 26.0,
                              fontWeight: FontWeight.bold,
                              fontFamily: "Calibre-Semibold",
                             
                            ),
                          ),
                          IconButton(
                            icon: Icon(
                              Icons.verified_user,
                              size: 20.0,
                              color: Colors.black,
                            ),
                            onPressed: () {},
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: Row(
                  children: <Widget>[
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      child: Center(
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 22.0, vertical: 6.0),
                          child: Text("Cinematics",
                              style: TextStyle(
                                color: Colors.white,
                              )),
                        ),
                      ),
                    ),
                  
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Workout()));
                },
                child: Stack(
                  children: <Widget>[
                    CardScrollWidget(currentPage),
                    Positioned.fill(
                      child: PageView.builder(
                        itemCount: images.length,
                        controller: controller,
                        reverse: true,
                        itemBuilder: (context, index) {
                          return Container();
                        },
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    InkWell(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Breath()));
                      },
                      child: Text("Techniques Guides",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 31.0,
                            fontFamily: "Calibre-Semibold",
                           
                          )),
                    ),
                    IconButton(
                      icon: Icon(
                          Icons.verified_user,
                        size: 20.0,
                        color: Colors.black,
                      ),
                      onPressed: () {},
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: Row(
                  children: <Widget>[
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      child: Center(
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 22.0, vertical: 6.0),
                          child: Text("Latest",
                              style: TextStyle(color: Colors.white)),
                        ),
                      ),
                    ),
                  
                    
                  ],
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Row(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(left: 18.0),
                    child: InkWell(
                      onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => Guide()));
                                  },
                                          child: ClipRRect(
                        borderRadius: BorderRadius.circular(20.0),
                        child: Container(
                          width: 296.0,
                          height: 170.0,
                          child: Image.asset(
                            "assets/flag.jpg",
                            
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              )

              // ListView(
              //   scrollDirection: Axis.horizontal,
              //   children: <Widget>[
              //     Container(
              //       width: 400,
              //       height: 200,
              //       color: Colors.greenAccent,
              //     ),
              //     Container(
              //       width: 400,
              //       height: 200,
              //       color: Colors.greenAccent,
              //     ),
              //   ],
              // ),
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
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => SearchScreen()));
            }
            else if (index == 0) {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => HomeScreen()));
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
      ),
    );
  }
}

class CardScrollWidget extends StatelessWidget {
  var currentPage;
  var padding = 20.0;
  var verticalInset = 20.0;

  CardScrollWidget(this.currentPage);

  @override
  Widget build(BuildContext context) {
    return new AspectRatio(
      aspectRatio: widgetAspectRatio,
      child: LayoutBuilder(builder: (context, contraints) {
        var width = contraints.maxWidth;
        var height = contraints.maxHeight;

        var safeWidth = width - 2 * padding;
        var safeHeight = height - 2 * padding;

        var heightOfPrimaryCard = safeHeight;
        var widthOfPrimaryCard = heightOfPrimaryCard * cardAspectRatio;

        var primaryCardLeft = safeWidth - widthOfPrimaryCard;
        var horizontalInset = primaryCardLeft / 2;

        List<Widget> cardList = new List();

        for (var i = 0; i < images.length; i++) {
          var delta = i - currentPage;
          bool isOnRight = delta > 0;

          var start = padding +
              max(
                  primaryCardLeft -
                      horizontalInset * -delta * (isOnRight ? 15 : 1),
                  0.0);

          var cardItem = Positioned.directional(
            top: padding + verticalInset * max(-delta, 0.0),
            bottom: padding + verticalInset * max(-delta, 0.0),
            start: start,
            textDirection: TextDirection.rtl,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16.0),
              child: Container(
                decoration: BoxDecoration(color: Colors.black, boxShadow: [
                  BoxShadow(
                      color: Colors.black12,
                      offset: Offset(3.0, 6.0),
                      blurRadius: 10.0)
                ]),
                child: AspectRatio(
                  aspectRatio: cardAspectRatio,
                  child: Stack(
                    fit: StackFit.expand,
                    children: <Widget>[
                      Image.asset(images[i], fit: BoxFit.cover),
                      Align(
                        alignment: Alignment.bottomLeft,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 16.0, vertical: 8.0),
                              child: Text(title[i],
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 25.0,
                                      fontFamily: "SF-Pro-Text-Regular")),
                            ),
                            SizedBox(
                              height: 10.0,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 12.0, bottom: 12.0),
                              child: Material(
                                color: Colors.transparent,
                                child: InkWell(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => Test()));
                                  },
                                  child: InkWell(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => Test()));
                                    },
                                    child: Container(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 22.0, vertical: 6.0),
                                      decoration: BoxDecoration(
                                          color: Colors.black,
                                          borderRadius:
                                              BorderRadius.circular(20.0)),
                                      child: Text("Do Now",
                                          style:
                                              TextStyle(color: Colors.white)),
                                    ),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
          cardList.add(cardItem);
        }
        return Stack(
          children: cardList,
        );
      }),
    );
  }
}
