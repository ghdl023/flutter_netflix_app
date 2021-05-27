import 'package:cloud_firestore/cloud_firestore.dart';

class Movie {
  final String title;
  final String poster;
  final String keyword;
  final String actors;
  final String directors;
  bool like;
  final DocumentReference
      reference; // 실제 Firebase Firestore에 있는 데이터 컬럼을 참조할수있는 링크

  Movie.fromMap(Map<String, dynamic> map, {this.reference})
      : title = map["title"],
        poster = map["poster"],
        keyword = map["keyword"],
        actors = map["actors"],
        directors = map["directors"],
        like = map["like"];

  Movie.fromSnapshot(DocumentSnapshot snapshot)
      : this.fromMap(snapshot.data, reference: snapshot.reference);

  @override
  String toString() {
    return "Movie<$title:$keyword$like:$actors$directors:$poster>";
  }
}
