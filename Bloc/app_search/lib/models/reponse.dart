import 'dart:convert';

import 'package:timer_cubit/models/movie.dart';

class Reponses {
    int page;
    List<Movie> results;
    int total_pages;
    int total_results;
  Reponses({
    required this.page,
    required this.results,
    required this.total_pages,
    required this.total_results,
  });

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};
  
    result.addAll({'page': page});
    result.addAll({'results': results.map((x) => x.toMap()).toList()});
    result.addAll({'total_pages': total_pages});
    result.addAll({'total_results': total_results});
  
    return result;
  }

  factory Reponses.fromMap(Map<String, dynamic> map) {
    return Reponses(
      page: map['page']?.toInt() ?? 0,
      results: List<Movie>.from(map['results']?.map((x) => Movie.fromMap(x))),
      total_pages: map['total_pages']?.toInt() ?? 0,
      total_results: map['total_results']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory Reponses.fromJson(String source) => Reponses.fromMap(json.decode(source));
}
