import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/detailed_movie_provider.dart';

class MoviePosterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    DetailedMovieProvider detailedMovieProvider =
        Provider.of<DetailedMovieProvider>(context, listen: false);
    return Container(
//      width: MediaQuery.of(context).size.width,
//      height: MediaQuery.of(context).size.height,
      child: Image.network(
        'https://image.tmdb.org/t/p/w500/${detailedMovieProvider.movie.poster_path}',
        fit: BoxFit.fill,
      ),
    );
  }
}
