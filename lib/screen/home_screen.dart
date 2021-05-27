import 'package:flutter/material.dart';
import 'package:flutter_netflix_app/model/movie_model.dart';
import 'package:flutter_netflix_app/widget/carousel_image.dart';
import 'package:flutter_netflix_app/widget/circle_slider.dart';
import 'package:flutter_netflix_app/widget/rectangle_slider.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

_HomeScreenState homeScreenState = new _HomeScreenState();

class HomeScreen extends StatefulWidget {
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Firestore firestore = Firestore.instance;
  Stream<QuerySnapshot> streamData;

  @override
  void initState() {
    super.initState();
    streamData = firestore.collection('movie').snapshots();
    print("home_screen init!");
  }

  Widget _fetchData(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: firestore.collection('movie').snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) return LinearProgressIndicator();
        return _buildBody(context, snapshot.data.documents);
      },
    );
  }

  Widget _buildBody(BuildContext context, List<DocumentSnapshot> snapshot) {
    List<Movie> movies = snapshot.map((m) => Movie.fromSnapshot(m)).toList();
    return ListView(
      children: <Widget>[
        Stack(
          children: <Widget>[
            CarouselImage(
              movies: movies,
            ),
            TopBar(),
          ],
        ),
        CircleSlider(movies: movies),
        RectangleSlider(movies: movies),
        RectangleSlider(movies: movies),
      ],
    );
  }

  // List<Movie> movies = [
  //   Movie.fromMap({
  //     'title': '사랑의 불시착',
  //     'keyword': '로맨스/판타지',
  //     'poster': 'test_movie_1.png',
  //     'actors': '현빈, 손예진, 서지혜',
  //     'directors': '이정효, 박지은',
  //     'like': false,
  //   }),
  // ];

  @override
  Widget build(BuildContext context) {
    print("home_screen build!");
    return _fetchData(context);
  }
}

class TopBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(40, 20, 40, 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Image.asset(
            "images/logo.png",
            fit: BoxFit.contain,
            height: 25,
          ),
          Text('TV 프로그램', style: TextStyle(fontSize: 14)),
          Text('영화', style: TextStyle(fontSize: 14)),
          Text('내가 찜한 컨텐츠', style: TextStyle(fontSize: 14)),
        ],
      ),
    );
  }
}
