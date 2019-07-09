import 'package:flutter/material.dart';

import '../widgets/movie_cast_page.dart';
import '../widgets/movie_intro_page.dart';
import '../widgets/movie_poster_page.dart';
import '../widgets/movie_production_page.dart';
import '../widgets/movie_specs_page.dart';

class MoviePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PageView(
      children: <Widget>[
        MoviePosterPage(),
        MovieIntroPAge(),
        MovieSpecsPage(),
        MovieProductionPage(),
        MovieCastPage()
      ],
      scrollDirection: Axis.horizontal,
    );
  }
}
