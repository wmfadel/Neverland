// library imports
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// files imports
import 'screens/home_page.dart';
import 'styles/custom_themes.dart';
import 'providers/movies_provider.dart';
import 'providers/detailed_movie_provider.dart';

class App extends StatelessWidget {
  // initializing providers
  MoviesProvider moviesProvider = MoviesProvider();
  DetailedMovieProvider detailedMovieProvider = DetailedMovieProvider();

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<MoviesProvider>.value(
          value: moviesProvider,
        ),
//        Provider<DetailedMovieProvider>.value(
//          value: detailedMovieProvider,
//        ),
        ChangeNotifierProvider(builder: (_)=>detailedMovieProvider)
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: CustomThemes.darkTheme,
        home: HomePage(),
      ),
    );
  }
}
