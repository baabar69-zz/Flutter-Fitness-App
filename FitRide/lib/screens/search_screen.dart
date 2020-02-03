import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import '../models/user_data.dart';
import '../models/user_model.dart';
import '../screens/profile_screen.dart';
import '../services/database_service.dart';
import 'package:provider/provider.dart';

import '../water.dart';
import '../worklanding.dart';
import 'home_screen.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  TextEditingController _searchController = TextEditingController();
  Future<QuerySnapshot> _users;

  _buildUserTile(User user) {
    return ListTile(
      leading: CircleAvatar(
        radius: 20.0,
        backgroundImage: user.profileImageUrl.isEmpty
            ? AssetImage('assets/user_placeholder.jpg')
            : CachedNetworkImageProvider(user.profileImageUrl),
      ),
      title: Text(user.name),
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => ProfileScreen(
            currentUserId: Provider.of<UserData>(context).currentUserId,
            userId: user.id,
          ),
        ),
      ),
    );
  }

  _clearSearch() {
    WidgetsBinding.instance
        .addPostFrameCallback((_) => _searchController.clear());
    setState(() {
      _users = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: TextField(
          controller: _searchController,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(vertical: 15.0),
            border: InputBorder.none,
            hintText: 'Search',
            prefixIcon: Icon(
              Icons.search,
              size: 30.0,
            ),
            suffixIcon: IconButton(
              icon: Icon(
                Icons.clear,
              ),
              onPressed: _clearSearch,
            ),
            filled: true,
          ),
          onSubmitted: (input) {
            if (input.isNotEmpty) {
              setState(() {
                _users = DatabaseService.searchUsers(input);
              });
            }
          },
        ),
      ),
      body: _users == null
          ? Center(
              child: Text('Search for a user'),
            )
          : FutureBuilder(
              future: _users,
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
                if (snapshot.data.documents.length == 0) {
                  return Center(
                    child: Text('No users found! Please try again.'),
                  );
                }
                return ListView.builder(
                  itemCount: snapshot.data.documents.length,
                  itemBuilder: (BuildContext context, int index) {
                    User user = User.fromDoc(snapshot.data.documents[index]);
                    return _buildUserTile(user);
                  },
                );
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
              size: 20.0,
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
          index:1,
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
            else if (index == 0) {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => HomeScreen()));
            }
          },
        ),
    );
  }
}
