import 'dart:ui';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';

import '../models/detailed_movie.dart';
import '../models/production_company.dart';
import '../models/production_country.dart';
import '../providers/detailed_movie_provider.dart';
import '../styles/custom_themes.dart';
import '../widgets/info_Chip.dart';

class MovieDetails extends StatefulWidget {
  @override
  _MovieDetailsState createState() => _MovieDetailsState();
}

class _MovieDetailsState extends State<MovieDetails> {
  PageController _pageController = PageController();
  DetailedMovieProvider _detailedMovieProvider;
  int _currentPage = 0;
  double screenWidth;
  double screenHeight;

  @override
  Widget build(BuildContext context) {
    _detailedMovieProvider = Provider.of<DetailedMovieProvider>(context);
    _detailedMovieProvider.getMovieCredits();
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
              buildPage4(movie),
              buildPage5(movie),
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
                  SizedBox(height: 20),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Text(movie.tagline,
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
                                  InfoChip('Status', movie.status),
                                  InfoChip('Runtime', movie.runtime),
                                  InfoChip('Rate', movie.vote_average),
                                  InfoChip('Revenue', movie.revenue),
                                  InfoChip('Release Date', movie.release_date),
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
                            children: movie.production_countries
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

  Widget buildPage5(DetailedMovie movie) {
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
        Container(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: _detailedMovieProvider.movieCast().length <= 0
                ? Container()
                : GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 20,
                        crossAxisSpacing: 20,
                        childAspectRatio: 1.2 / 1.7),
                    itemBuilder: (context, index) {
                      return ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: GridTile(
                          child: Image.network(
                            'https://image.tmdb.org/t/p/w500/${_detailedMovieProvider.movieCast()[index].profile_path}',
                            fit: BoxFit.cover,
                          ),
                          footer: Container(
                            color: Colors.black87,
                            height: 75,
                            child: Column(
                              children: <Widget>[
                                Text(
                                  _detailedMovieProvider.movieCast()[index].name,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18),
                                ),
                                SizedBox(height: 8),
                                Text(
                                  _detailedMovieProvider
                                      .movieCast()[index]
                                      .character,
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
