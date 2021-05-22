class Movie {
  final String title;
  final String poster;
  final String keyword;
  final bool like;

  Movie.fromMap(Map<String, dynamic> map)
      : title = map["title"],
        poster = map["poster"],
        keyword = map["keyword"],
        like = map["like"];

  @override
  String toString() {
    return "Movie<$title:$keyword>";
  }
}
