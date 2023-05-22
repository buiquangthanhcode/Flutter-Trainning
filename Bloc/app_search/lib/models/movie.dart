import 'dart:convert';

class Movie {
  final bool adult;
  final String backdropPath;
  final List<int> genreIds;
  final int id;
  final String originalLanguage;
  final String originalTitle;
  final String overview;
  final double popularity;
  final String posterPath;
  final String releaseDate;
  final String title;
  final bool video;
  final double voteAverage;
  final int voteCount;

  Movie({
    required this.adult,
    required this.backdropPath,
    required this.genreIds,
    required this.id,
    required this.originalLanguage,
    required this.originalTitle,
    required this.overview,
    required this.popularity,
    required this.posterPath,
    required this.releaseDate,
    required this.title,
    required this.video,
    required this.voteAverage,
    required this.voteCount,
  });
  
  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};
  
    result.addAll({'adult': adult});
    result.addAll({'backdropPath': backdropPath});
    result.addAll({'genreIds': genreIds});
    result.addAll({'id': id});
    result.addAll({'originalLanguage': originalLanguage});
    result.addAll({'originalTitle': originalTitle});
    result.addAll({'overview': overview});
    result.addAll({'popularity': popularity});
    result.addAll({'posterPath': posterPath});
    result.addAll({'releaseDate': releaseDate});
    result.addAll({'title': title});
    result.addAll({'video': video});
    result.addAll({'voteAverage': voteAverage});
    result.addAll({'voteCount': voteCount});
  
    return result;
  }

  factory Movie.fromMap(Map<String, dynamic> map) {
    return Movie(
      adult: map['adult'] ?? false,
      backdropPath: map['backdropPath'] ?? '',
      genreIds: List<int>.from(map['genreIds']),
      id: map['id']?.toInt() ?? 0,
      originalLanguage: map['originalLanguage'] ?? '',
      originalTitle: map['originalTitle'] ?? '',
      overview: map['overview'] ?? '',
      popularity: map['popularity']?.toDouble() ?? 0.0,
      posterPath: map['posterPath'] ?? '',
      releaseDate: map['releaseDate'] ?? '',
      title: map['title'] ?? '',
      video: map['video'] ?? false,
      voteAverage: map['voteAverage']?.toDouble() ?? 0.0,
      voteCount: map['voteCount']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory Movie.fromJson(String source) => Movie.fromMap(json.decode(source));
}
