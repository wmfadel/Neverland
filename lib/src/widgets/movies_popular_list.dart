// library imports
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';

import '../providers/movies_provider.dart';
import '../screens/movie_screen.dart';
import '../styles/custom_themes.dart';

class MoviesPopularList extends StatefulWidget {
  @override
  _MoviesPopularListState createState() => _MoviesPopularListState();
}

class _MoviesPopularListState extends State<MoviesPopularList> {
  final ScrollController playingController = ScrollController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // fetch more movies when the list reaches its end
    playingController.addListener(() {
      if (playingController.position.pixels >=
          playingController.position.maxScrollExtent)
        setState(() {
          Provider.of<MoviesProvider>(context).fetchPopularMovies();
        });
    });
  }

  @override
  Widget build(BuildContext context) {
    MoviesProvider provider = Provider.of<MoviesProvider>(context);

    return FutureBuilder(
        future: provider.fetchPopularMovies(),
        builder: (BuildContext context, AsyncSnapshot<bool> snapShot) {
          if (provider.getNPopularMovies().length > 0 &&
              snapShot.data != null &&
              snapShot.data) {
            return ListView.builder(
              key: PageStorageKey('providerpopular'),
              controller: playingController,
              scrollDirection: Axis.horizontal,
              itemCount: provider.getNPopularMovies().length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () async {
                    int id = provider.getNPopularMovies()[index].id;
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => MovieScreen(id)));
                  },
                  highlightColor: Theme.of(context).primaryColorDark,
                  splashColor: Theme.of(context).accentColor,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Container(
                          width: 170,
                          height: 250,
                          margin: EdgeInsets.symmetric(horizontal: 8),
                          child: Image.network(
                            'https://image.tmdb.org/t/p/w500/${provider.getNPopularMovies()[index].poster_path}',
                            width: 170,
                            height: 250,
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                      Container(
                          padding: EdgeInsets.all(4),
                          width: 170,
                          height: 40,
                          child: AutoSizeText(
                            provider.getNPopularMovies()[index].title,
                            textAlign: TextAlign.center,
                            style: CustomThemes.infoStyle,
                          ))
                    ],
                  ),
                );
              },
            );
          }

          if (snapShot.connectionState != ConnectionState.done ||
              provider.getNPopularMovies().length < 5) {
            // still loading data
              return Center(
                child: SpinKitWave(
                  color: Theme.of(context).accentColor,
                  size: 35,
                ),
              );
          }
          return Container();

        });
  }

  @override
  void dispose() {
    playingController.dispose();
    super.dispose();
  }
}
