import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/detailed_movie_provider.dart';
import 'package:auto_size_text/auto_size_text.dart';
import '../styles/custom_themes.dart';

import 'movie_backdrop.dart';

class MovieIntroPAge extends StatelessWidget {

  double screenWidth;
  double screenHeight;

  @override
  Widget build(BuildContext context) {
    DetailedMovieProvider detailedMovieProvider =
        Provider.of<DetailedMovieProvider>(context, listen: false);
    Size size = MediaQuery.of(context).size;
    screenWidth = size.width;
    screenHeight = size.height;

    return Stack(
      children: <Widget>[
        Image.network(
          'https://image.tmdb.org/t/p/w500/${detailedMovieProvider.movie.poster_path}',
          fit: BoxFit.fill,
          width: screenWidth,
          height: screenHeight,
        ),
        MovieBackdrop(),
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width * 0.95,
              margin: EdgeInsets.symmetric(horizontal: 10),
              child: AutoSizeText(
                detailedMovieProvider.movie.title,
                textAlign: TextAlign.center,
                style: CustomThemes.headerStyle2,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(detailedMovieProvider.movie.tagline,
                  textAlign: TextAlign.center,
                  style: CustomThemes.whiteHeaderStyle2),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(detailedMovieProvider.movie.overview,
                  textAlign: TextAlign.center,
                  style: CustomThemes.whiteHeaderStyle),
            ),
          ],
        ),
      ],
    );
  }
}
