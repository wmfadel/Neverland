import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'info_Chip.dart';
import '../providers/detailed_movie_provider.dart';
import '../styles/custom_themes.dart';
import 'movie_backdrop.dart';
import 'shadow_container.dart';

class MovieSpecsPage extends StatelessWidget {
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
        Align(
          alignment: Alignment.center,
          child: Material(
            elevation: 10,
            color: Theme
                .of(context)
                .primaryColor,
            clipBehavior: Clip.hardEdge,
            borderRadius: BorderRadius.circular(10),
            child: Container(
              width: screenWidth * 0.85,
              height: screenHeight * 0.8,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Stack(
                    children: <Widget>[
                      Image.network(
                        'https://image.tmdb.org/t/p/w500/${detailedMovieProvider.movie
                            .backdrop_path}',
                        width: screenWidth * 0.85,
                        height: 250,
                        fit: BoxFit.fill,
                      ),
                      Positioned(
                        top: 175,
                        child: ShadowContainer(),
                      ),
                      detailedMovieProvider.movie.adult
                          ? Positioned(
                        top: 5,
                        left: 5,
                        child: CircleAvatar(
                          radius: 25,
                          backgroundColor: Theme
                              .of(context)
                              .primaryColor,
                          child: Text(
                            '+18',
                            style: TextStyle(
                                color: Theme
                                    .of(context)
                                    .accentColor,
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      )
                          : Container(),
                    ],
                  ),
                  // end of images stack
                  SizedBox(height: 20),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Text(detailedMovieProvider.movie.tagline,
                        textAlign: TextAlign.center,
                        style: CustomThemes.whiteHeaderStyle2),
                  ),

                  SizedBox(height: 15),
                  Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Container(
                          height: 200,
                          child: ListView(
                            children: <Widget>[
                              Wrap(
                                children: <Widget>[
                                  InfoChip('Status', detailedMovieProvider.movie.status),
                                  InfoChip('Runtime', detailedMovieProvider.movie.runtime),
                                  InfoChip('Rate', detailedMovieProvider.movie.vote_average),
                                  InfoChip('Revenue', detailedMovieProvider.movie.revenue),
                                  InfoChip('Release Date', detailedMovieProvider.movie.release_date),
                                ],
                              )
                            ],
                          ))),
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}
