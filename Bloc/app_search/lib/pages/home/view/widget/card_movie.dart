import 'package:flutter/material.dart';

import '../../../../models/movie.dart';

class MovieCard extends StatelessWidget {
  final movie;

  MovieCard({required this.movie});

  @override
  Widget build(BuildContext context) {
    return Card(
        margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
        child: ListTile(
          // leading: Image.network(
          //   'https://image.tmdb.org/t/p/w200${movie.posterPath}',
          //   fit: BoxFit.cover,
          // ),
          title: Text(movie['title']),
          subtitle: Text(movie['overview']),
        ));
  }
}
