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
              buildPage4(movie.poster_path),
              buildPage5(movie.poster_path),
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
                        child: Container(
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
                        ),
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
                  SizedBox(height: 18),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Text(movie.tagline,
                        textAlign: TextAlign.center,
                        style: CustomThemes.whiteHeaderStyle2),
                  ),
                  SizedBox(height: 50),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 40),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Text('Status',
                                style:
                                    TextStyle(color: Colors.white, fontSize: 18)),
                            Text('Release Date',
                                style:
                                TextStyle(color: Colors.white, fontSize: 18)),
                            Text('Runtime',
                                style:
                                    TextStyle(color: Colors.white, fontSize: 18)),
                            Text('Revenue',
                                style:
                                TextStyle(color: Colors.white, fontSize: 18)),
                            Text('Rate',
                                style:
                                    TextStyle(color: Colors.white, fontSize: 18)),
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Text(movie.status,
                                style:
                                    TextStyle(color: Colors.white, fontSize: 18)),
                            Text(movie.release_date,
                                style:
                                TextStyle(color: Colors.white, fontSize: 18)),
                            Text(movie.runtime,
                                style:
                                    TextStyle(color: Colors.white, fontSize: 18)),
                            Text(movie.revenue,
                                style:
                                TextStyle(color: Colors.white, fontSize: 18)),

                            Text(movie.vote_average,
                                style:
                                    TextStyle(color: Colors.white, fontSize: 18)),
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        )
      ],
    );
  }

  Widget buildPage4(String path) {
    return Stack(
      children: <Widget>[
        Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Image.network(
            'https://image.tmdb.org/t/p/w500/$path',
            fit: BoxFit.fill,
          ),
        ),
        buildBackdropFilter()
      ],
    );
  }

  Widget buildPage5(String path) {
    return Stack(
      children: <Widget>[
        Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Image.network(
            'https://image.tmdb.org/t/p/w500/$path',
            fit: BoxFit.fill,
          ),
        ),
        buildBackdropFilter()
      ],
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
