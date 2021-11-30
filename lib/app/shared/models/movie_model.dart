class MovieModel {
  final int id;
  final String title;
  final String releaseDate;
  final String posterPath;
  final List<int> genreIds;

  const MovieModel({
    required this.id,
    required this.title,
    required this.releaseDate,
    required this.posterPath,
    required this.genreIds,
  });

  factory MovieModel.fromJson(Map<dynamic, dynamic> json) {
    return MovieModel(
      id: json['id'] ?? 0,
      title: json['title'] ?? 'No Title',
      releaseDate: json['release_date'] ?? 'No Release Date',
      posterPath: json['poster_path'] ?? '/mEtyZBbVl0sx0y1blYuVDgeNLkr.jpg',
      genreIds: List<int>.from(json['genre_ids'] ?? const []),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'release_date': releaseDate,
      'poster_path': posterPath,
      'genre_ids': genreIds,
    };
  }

  static List<MovieModel> fromJsonList(List list) {
    return list.map((value) => MovieModel.fromJson(value)).toList();
  }
}
