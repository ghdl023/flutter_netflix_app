import 'package:flutter/material.dart';
import 'package:flutter_netflix_app/model/movie_model.dart';
import 'package:flutter_netflix_app/screen/detail_screen.dart';

class RectangleSlider extends StatelessWidget {
  final List<Movie> movies;
  RectangleSlider({this.movies});

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
          Text('TV/코미디/가슴 뭉클'),
          Padding(
              padding: EdgeInsets.only(
            top: 10,
          )),
          Container(
            height: 120,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: makeRectangleImages(context, movies),
            ),
          ),
        ],
      ),
    );
  }
}

List<Widget> makeRectangleImages(BuildContext context, List<Movie> movies) {
  List<Widget> result = [];
  for (var i = 0; i < movies.length; i++) {
    result.add(InkWell(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute<Null>(
            fullscreenDialog: true,
            builder: (BuildContext context) {
              return DetailScreen(movie: movies[i]);
            }));
      },
      child: Container(
        padding: EdgeInsets.only(right: 10),
        child: Align(
          alignment: Alignment.centerLeft,
          child: Image.network(movies[i].poster),
        ),
      ),
    ));
  }

  return result;
}
