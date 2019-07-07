import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/detailed_movie_provider.dart';
import 'package:auto_size_text/auto_size_text.dart';
import '../styles/custom_themes.dart';
import '../models/production_country.dart';
import '../models/production_company.dart';
import 'movie_backdrop.dart';
import 'shadow_container.dart';

class MovieProductionPage extends StatelessWidget {

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
                  SizedBox(height: 10),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Text(detailedMovieProvider.movie.tagline,
                        textAlign: TextAlign.center,
                        style: CustomThemes.whiteHeaderStyle2),
                  ),

                  SizedBox(height: 20),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    height: 200,
                    child: ListView(
                      children: <Widget>[
                        Center(
                          child: Text('Production Companies',
                              style: CustomThemes.whiteHeaderStyle),
                        ),
                        Center(
                            child: Wrap(
                              spacing: 10,
                              children: detailedMovieProvider.movie.production_companies
                                  .map((ProductionCompany company) {
                                return Chip(
                                  label: Text(company.name),
                                  backgroundColor: Color(0xffFB8C00),
                                );
                              }).toList(),
                            )),
                        Center(
                          child: Text('Production Countries',
                              style: CustomThemes.whiteHeaderStyle),
                        ),
                        Center(
                          child: Wrap(
                            spacing: 10,
                            children: detailedMovieProvider.movie.production_countries
                                .map((ProductionCountry country) {
                              return Chip(
                                label: Text(country.name),
                                backgroundColor: Color(0xffFB8C00),
                              );
                            }).toList(),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}
