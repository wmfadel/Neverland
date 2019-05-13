// library imports
import 'package:flutter/material.dart';

// files imports
import '../styles/custom_themes.dart';
import '../widgets/movies_playing_list.dart';
import '../widgets/movies_popular_list.dart';
import '../widgets/movies_top_rated_list.dart';

class MoviesScreen extends StatefulWidget {
  final Key key;

  MoviesScreen(this.key) : super(key: key);

  @override
  _MoviesScreenState createState() => _MoviesScreenState();
}

class _MoviesScreenState extends State<MoviesScreen> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(10),
            child: Text('Movies', style: CustomThemes.headerStyle),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10, bottom: 8),
            child: Text('Now playing Movies', style: CustomThemes.subHeaderStyle),
          ),
          Container(
            height: 310,
            child: MoviesNowPlayingList(),
          ),
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.only(left: 10, bottom: 8),
            child: Text('Popular Movies', style: CustomThemes.subHeaderStyle),
          ),
          Container(
            height: 310,
            child: MoviesPopularList(),
          ),
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.only(left: 10, bottom: 8),
            child: Text('Top Rated Movies', style: CustomThemes.subHeaderStyle),
          ),
          Container(
            height: 310,
            child: MoviesTopRatedList(),
          ),
          SizedBox(height: 20),
        ],
      ),
    );
  }
}
