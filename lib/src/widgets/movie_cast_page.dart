import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/detailed_movie_provider.dart';
import 'package:auto_size_text/auto_size_text.dart';
import '../styles/custom_themes.dart';

import 'movie_backdrop.dart';

class MovieCastPage extends StatelessWidget {
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
        Container(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: detailedMovieProvider.movie.cast.length <= 0
                ? Container()
                : GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 20,
                        crossAxisSpacing: 20,
                        childAspectRatio: 1.2 / 1.7),
                    itemCount: detailedMovieProvider.movie.cast.length,
                    itemBuilder: (context, index) {
                      return ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: GridTile(
                          child: Image.network(
                            'https://image.tmdb.org/t/p/w500/${detailedMovieProvider.movie.cast[index].profile_path}',
                            fit: BoxFit.cover,
                          ),
                          footer: Container(
                            color: Colors.black87,
                            height: 75,
                            child: Column(
                              children: <Widget>[
                                Text(
                                  detailedMovieProvider.movie.cast[index].name,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18),
                                ),
                                SizedBox(height: 8),
                                Text(
                                  detailedMovieProvider
                                      .movie.cast[index].character,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 16, color: Colors.white),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    }))
      ],
    );
  }
}
