import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/detailed_movie_provider.dart';



import '../widgets/movie_poster_page.dart';
import '../widgets/movie_intro_page.dart';
import '../widgets/movie_specs_page.dart';
import '../widgets/movie_production_page.dart';
import '../widgets/movie_cast_page.dart';

class MoviePage extends StatelessWidget {

  DetailedMovieProvider detailedMovieProvider;

  @override
  Widget build(BuildContext context) {

    detailedMovieProvider = Provider.of<DetailedMovieProvider>(context, listen: false);

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
