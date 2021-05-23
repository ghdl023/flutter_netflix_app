class Movie {
  final String title;
  final String poster;
  final String keyword;
  final String actors;
  final String directors;
  final bool like;

  Movie.fromMap(Map<String, dynamic> map)
      : title = map["title"],
        poster = map["poster"],
        keyword = map["keyword"],
        actors = map["actors"],
        directors = map["directors"],
        like = map["like"];

  @override
  String toString() {
    return "Movie<$title:$keyword>";
  }
}
