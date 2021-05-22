import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_netflix_app/model/movie_model.dart';

class CircleSlider extends StatelessWidget {
  final List<Movie> movies;
  CircleSlider({this.movies});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        left: 20,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
              padding: EdgeInsets.only(
            top: 20,
          )),
          Text('미리보기'),
          Padding(
              padding: EdgeInsets.only(
            top: 10,
          )),
          Container(
            height: 120,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: makeCircleImages(movies),
            ),
          )
        ],
      ),
    );
  }
}

List<Widget> makeCircleImages(List<Movie> movies) {
  List<Widget> result = [];
  for (var i = 0; i < movies.length; i++) {
    result.add(InkWell(
      onTap: () {},
      child: Container(
        padding: EdgeInsets.only(right: 10),
        child: Align(
          alignment: Alignment.centerLeft,
          child: CircleAvatar(
            backgroundImage: AssetImage('images/' + movies[i].poster),
            radius: 48,
          ),
        ),
      ),
    ));
  }

  return result;
}
