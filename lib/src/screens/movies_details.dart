import 'dart:ui';

// library imports
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

// file imports
import '../providers/detailed_movie_provider.dart';
import '../providers/movies_provider.dart';
import '../models/detailed_movie.dart';

class MovieDetails extends StatefulWidget {
  @override
  _MovieDetailsState createState() => _MovieDetailsState();
}

class _MovieDetailsState extends State<MovieDetails> {
  PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (BuildContext context, DetailedMovieProvider value, Widget child){
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


  Widget buildBodyContent(DetailedMovie movie){
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
              buildPage2(movie.poster_path),
              Text('page 3'),
              Text('page 4'),
              Text('page 5'),
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

  Widget buildPage2(String path) {
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
      filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
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
            padding: const EdgeInsets.only(right: 35),
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
