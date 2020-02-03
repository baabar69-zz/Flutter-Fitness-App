import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../models/post_model.dart';
import '../models/user_data.dart';
import '../models/user_model.dart';
import '../screens/profile_screen.dart';
import '../screens/search_screen.dart';
import '../services/database_service.dart';
import '../widgets/post_view.dart';
import 'package:provider/provider.dart';

import 'create_post_screen.dart';

class FeedScreen extends StatefulWidget {
  static final String id = 'feed_screen';
  final String currentUserId;

  FeedScreen({this.currentUserId});

  @override
  _FeedScreenState createState() => _FeedScreenState();
}

class _FeedScreenState extends State<FeedScreen> {
  List<Post> _posts = [];

  @override
  void initState() {
    super.initState();
    _setupFeed();
  }

  _setupFeed() async {
    List<Post> posts = await DatabaseService.getFeedPosts(widget.currentUserId);
    setState(() {
      _posts = posts;
    });
  }

  @override
  Widget build(BuildContext context) {
    final String currentUserId = Provider.of<UserData>(context).currentUserId;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: SingleChildScrollView(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                'FitRide',
                style: TextStyle(
                  color: Colors.black,
                  fontFamily: 'Billabong',
                  fontSize: 35.0,
                ),
              ),
              SizedBox(
                width: 70.0,
              ),
              Row(
                //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                 
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => CreatePostScreen(),
                        ),
                      );
                    },
                    child: Icon(
                      Icons.photo_camera,
                      size: 32.0,
                    ),
                  ),
                  SizedBox(width: 10.0,),
                  
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => SearchScreen(),
                        ),
                      );
                    },
                    child: Icon(
                      Icons.notifications,
                      size: 32.0,
                    ),
                  ),
                  SizedBox(width: 10.0,),

                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => ProfileScreen(
                            currentUserId: currentUserId,
                            userId: currentUserId,
                          ),
                        ),
                      );
                    },
                    child: Icon(
                      Icons.account_circle,
                      size: 32.0,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
      body: RefreshIndicator(
        onRefresh: () => _setupFeed(),
        child: ListView.builder(
          itemCount: _posts.length,
          itemBuilder: (BuildContext context, int index) {
            Post post = _posts[index];
            return FutureBuilder(
              future: DatabaseService.getUserWithId(post.authorId),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (!snapshot.hasData) {
                  return SizedBox.shrink();
                }
                User author = snapshot.data;
                return PostView(
                  currentUserId: widget.currentUserId,
                  post: post,
                  author: author,
                );
              },
            );
          },
        ),
      ),
    );
  }
}
