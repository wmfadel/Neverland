import 'dart:ui';

// library imports
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:auto_size_text/auto_size_text.dart';

// file imports
import '../providers/detailed_movie_provider.dart';
import '../models/detailed_movie.dart';
import '../styles/custom_themes.dart';
import '../widgets/info_Chip.dart';
import '../models/production_company.dart';
import '../models/production_country.dart';

class MovieDetails extends StatefulWidget {
  @override
  _MovieDetailsState createState() => _MovieDetailsState();
}

class _MovieDetailsState extends State<MovieDetails> {
  PageController _pageController = PageController();
  int _currentPage = 0;
  double screenWidth;
  double screenHeight;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    screenWidth = size.width;
    screenHeight = size.height;
    return Consumer(builder:
        (BuildContext context, DetailedMovieProvider value, Widget child) {
      return Scaffold(
        body: value.movie != null
            ? buildBodyContent(value.movie)
            : Center(
                child: SpinKitWave(
                  color: Theme.of(context).accentColor,
                  size: 35,
                ),
              ),
      );
    });
  }

  Widget buildBodyContent(DetailedMovie movie) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Stack(
        children: <Widget>[
          PageView(
            controller: _pageController,
            scrollDirection: Axis.horizontal,
            onPageChanged: (index) {
              setState(() {
                _currentPage = index;
              });
            },
            children: <Widget>[
              buildPage1(movie.poster_path),
              buildPage2(movie),
              buildPage3(movie),
              buildPage4(movie)
            ],
          ),
          buildDirectionsRight(context),
          buildDirectionsLeft(context),
        ],
      ),
    );
  }

  Widget buildPage1(String path) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Image.network(
        'https://image.tmdb.org/t/p/w500/$path',
        fit: BoxFit.fill,
      ),
    );
  }

  Widget buildPage2(DetailedMovie movie) {
    return Stack(
      children: <Widget>[
        Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Image.network(
            'https://image.tmdb.org/t/p/w500/${movie.poster_path}',
            fit: BoxFit.fill,
          ),
        ),
        buildBackdropFilter(),
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width * 0.95,
              margin: EdgeInsets.symmetric(horizontal: 10),
              child: AutoSizeText(
                movie.title,
                textAlign: TextAlign.center,
                style: CustomThemes.headerStyle2,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(movie.tagline,
                  textAlign: TextAlign.center,
                  style: CustomThemes.whiteHeaderStyle2),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(movie.overview,
                  textAlign: TextAlign.center,
                  style: CustomThemes.whiteHeaderStyle),
            ),
          ],
        ),
      ],
    );
  }

  Widget buildPage3(DetailedMovie movie) {
    return Stack(
      children: <Widget>[
        Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Image.network(
            'https://image.tmdb.org/t/p/w500/${movie.poster_path}',
            fit: BoxFit.fill,
          ),
        ),
        buildBackdropFilter(),
        Align(
          alignment: Alignment.center,
          child: Material(
            elevation: 10,
            color: Theme.of(context).primaryColor,
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
                        'https://image.tmdb.org/t/p/w500/${movie.backdrop_path}',
                        width: screenWidth * 0.85,
                        height: 250,
                        fit: BoxFit.fill,
                      ),
                      Positioned(
                        top: 175,
                        child: buildShadowContainer(),
                      ),
                      movie.adult
                          ? Positioned(
                              top: 5,
                              left: 5,
                              child: CircleAvatar(
                                radius: 25,
                                backgroundColor: Theme.of(context).primaryColor,
                                child: Text(
                                  '+18',
                                  style: TextStyle(
                                      color: Theme.of(context).accentColor,
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
                    child: Text(movie.tagline,
                        textAlign: TextAlign.center,
                        style: CustomThemes.whiteHeaderStyle2),
                  ),

                  SizedBox(height: 10),
                  Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Container(
                        height: 200,
                        child: ListView(
                          children: <Widget>[
                            Chip(
                                backgroundColor: Colors.green,
                                label: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: <Widget>[
                                      InfoChip('Status'),
                                      SizedBox(width: 8),
                                      InfoChip(movie.status),
                                    ],
                                  ),
                                )),
                            SizedBox(height: 10),
                            Chip(
                                backgroundColor: Colors.green,
                                label: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: <Widget>[
                                      InfoChip('Release Date'),
                                      SizedBox(width: 8),
                                      InfoChip(movie.release_date),
                                    ],
                                  ),
                                )),
                            SizedBox(height: 10),

                            Chip(
                              backgroundColor: Colors.green,
                              label: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: <Widget>[
                                      InfoChip('Runtime'),
                                      SizedBox(width: 8),
                                      InfoChip(movie.runtime),
                                    ],
                                  )),
                            ),
                            SizedBox(height: 10),

                            Chip(
                                backgroundColor: Colors.green,
                                label: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: <Widget>[
                                      InfoChip('Revenue'),
                                      SizedBox(width: 8),
                                      InfoChip(movie.revenue),
                                    ],
                                  ),
                                )),
                            SizedBox(height: 10),

                            Chip(
                                backgroundColor: Colors.green,
                                label: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: <Widget>[
                                      InfoChip('Rate'),
                                      SizedBox(width: 8),
                                      InfoChip(movie.vote_average)
                                    ],
                                  ),
                                )),
                          ],
                        ),
                      )),
                ],
              ),
            ),
          ),
        )
      ],
    );
  }

  Widget buildPage4(DetailedMovie movie) {
    return Stack(
      children: <Widget>[
        Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Image.network(
            'https://image.tmdb.org/t/p/w500/${movie.poster_path}',
            fit: BoxFit.fill,
          ),
        ),
        buildBackdropFilter(),
        Align(
          alignment: Alignment.center,
          child: Material(
            elevation: 10,
            color: Theme.of(context).primaryColor,
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
                        'https://image.tmdb.org/t/p/w500/${movie.backdrop_path}',
                        width: screenWidth * 0.85,
                        height: 250,
                        fit: BoxFit.fill,
                      ),
                      Positioned(
                        top: 175,
                        child: buildShadowContainer(),
                      ),
                      movie.adult
                          ? Positioned(
                              top: 5,
                              left: 5,
                              child: CircleAvatar(
                                radius: 25,
                                backgroundColor: Theme.of(context).primaryColor,
                                child: Text(
                                  '+18',
                                  style: TextStyle(
                                      color: Theme.of(context).accentColor,
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
                    child: Text(movie.tagline,
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
                          children: movie.production_companies
                              .map((ProductionCompany company) {
                            return InfoChip(company.name);
                          }).toList(),
                        )),
                        Center(
                          child: Text('Production Countries',
                              style: CustomThemes.whiteHeaderStyle),
                        ),
                        Center(
                          child: Wrap(
                            spacing: 10,
                            children: movie.production_countries
                                .map((ProductionCountry country) {
                              return InfoChip(country.name);
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

  Container buildShadowContainer() {
    return Container(
      width: screenWidth * 0.85,
      height: 80,
      decoration: BoxDecoration(
          gradient: LinearGradient(
        colors: <Color>[
          Colors.transparent,
          Theme.of(context).primaryColor,
        ],
        begin: AlignmentDirectional.topCenter,
        end: AlignmentDirectional.bottomCenter,
      )),
    );
  }

  BackdropFilter buildBackdropFilter() {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration:
            new BoxDecoration(color: Colors.grey.shade200.withOpacity(0.1)),
      ),
    );
  }

  Widget buildDirectionsLeft(BuildContext context) {
    return _currentPage > 0
        ? Align(
            alignment: AlignmentDirectional.centerStart,
            child: IconButton(
                icon: Icon(
                  Icons.navigate_before,
                  size: 80,
                  color: Theme.of(context).accentColor.withOpacity(0.5),
                ),
                onPressed: () {}),
          )
        : Container();
  }

  Widget buildDirectionsRight(BuildContext context) {
    return _currentPage < 4
        ? Padding(
            padding: const EdgeInsets.only(right: 42),
            child: Align(
              alignment: AlignmentDirectional.centerEnd,
              child: IconButton(
                  icon: Icon(
                    Icons.navigate_next,
                    size: 80,
                    color: Theme.of(context).accentColor.withOpacity(0.5),
                  ),
                  onPressed: () {}),
            ),
          )
        : Container();
  }
}
