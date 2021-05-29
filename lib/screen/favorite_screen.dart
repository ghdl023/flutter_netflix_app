import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:flutter_netflix_app/model/movie_model.dart';
import 'package:flutter_netflix_app/screen/detail_screen.dart';

class FavoriteScreen extends StatefulWidget {
  @override
  _FavoriteScreenState createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  Widget _buildBody(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: Firestore.instance
          .collection('movie')
          .where('like', isEqualTo: true)
          .snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) return LinearProgressIndicator();
        return _buildList(context, snapshot.data.documents);
      },
    );
  }

  Widget _buildList(BuildContext context, List<DocumentSnapshot> snapshot) {
    List<DocumentSnapshot> favoriteResults = [];
    // for (DocumentSnapshot d in snapshot) { // where문으로 대체
    //   if (d.data['like']) {
    //     favoriteResults.add(d);
    //   }
    // }
    favoriteResults = snapshot;

    return Expanded(
        child: GridView.count(
      crossAxisCount: 3,
      childAspectRatio: 1 / 1.5,
      padding: EdgeInsets.all(3),
      children:
          favoriteResults.map((data) => _buildListItem(context, data)).toList(),
    ));
  }

  Widget _buildListItem(BuildContext context, DocumentSnapshot data) {
    final movie = Movie.fromSnapshot(data);

    return InkWell(
      child: Image.network(movie.poster),
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute<Null>(
            fullscreenDialog: true,
            builder: (context) {
              return DetailScreen(movie: movie);
            }));
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Container(
              padding: EdgeInsets.fromLTRB(20, 30, 20, 7),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Image.asset(
                    'images/logo.png',
                    fit: BoxFit.contain,
                    height: 25,
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 30),
                    child: Text('저장한 컨텐츠', style: TextStyle(fontSize: 14)),
                  )
                ],
              )),
          _buildBody(context)
        ],
      ),
    );
  }
}
