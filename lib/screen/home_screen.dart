import 'package:flutter/material.dart';
import 'package:flutter_netflix_app/model/movie_model.dart';
import 'package:flutter_netflix_app/widget/carousel_image.dart';
import 'package:flutter_netflix_app/widget/circle_slider.dart';
import 'package:flutter_netflix_app/widget/rectangle_slider.dart';

class HomeScreen extends StatefulWidget {
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
  }

  List<Movie> movies = [
    Movie.fromMap({
      'title': '사랑의 불시착',
      'keyword': '로맨스/판타지',
      'poster': 'test_movie_1.png',
      'like': false,
    }),
    Movie.fromMap({
      'title': '사랑의 불시착2',
      'keyword': '로맨스/판타지2',
      'poster': 'test_movie_1.png',
      'like': false,
    }),
    Movie.fromMap({
      'title': '사랑의 불시착3',
      'keyword': '로맨스/판타지3',
      'poster': 'test_movie_1.png',
      'like': false,
    }),
    Movie.fromMap({
      'title': '사랑의 불시착4',
      'keyword': '로맨스/판타지4',
      'poster': 'test_movie_1.png',
      'like': false,
    }),
  ];

  @override
  Widget build(BuildContext context) {
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
