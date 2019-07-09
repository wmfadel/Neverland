import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/detailed_movie_provider.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../widgets/movie_pages.dart';

class MovieScreen extends StatelessWidget {
  final int movieId;
  double screenWidth;
  double screenHeight;
  DetailedMovieProvider detailedMovieProvider;

  MovieScreen(this.movieId);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    screenWidth = size.width;
    screenHeight = size.height;

    return Scaffold(
      body: Container(
        width: screenWidth,
        height: screenHeight,
        child: FutureBuilder(
          future: Provider.of<DetailedMovieProvider>(context, listen: false)
              .getMovieDetails(movieId),
          builder: (context, snapShot) {
            if (snapShot.hasData &&
                snapShot.connectionState == ConnectionState.done)
              return MoviePage();
            return Center(
              child:SpinKitWave(
                color: Theme.of(context).accentColor,
                size: 35,
              ),
            );
          },
        ),
      ),
    );
  }
}
