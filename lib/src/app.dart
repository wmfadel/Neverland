// library imports
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// files imports
import 'screens/home_page.dart';
import 'screens/auth.dart';
import 'styles/custom_themes.dart';
import 'providers/movies_provider.dart';
import 'providers/detailed_movie_provider.dart';
import 'providers/tv_provider.dart';
import 'providers/detailed_tv_provider.dart';
import 'providers/authntication.dart';

class App extends StatelessWidget {
  // initializing providers
  MoviesProvider moviesProvider = MoviesProvider();
  DetailedMovieProvider detailedMovieProvider = DetailedMovieProvider();
  TVProvider tvProvider = TVProvider();
  DetailedTvProvider detailedTvProvider = DetailedTvProvider();
  Authentication authentication = Authentication();
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<MoviesProvider>.value(
          value: moviesProvider,
        ),
        Provider<TVProvider>.value(
          value: tvProvider,
        ),
        ChangeNotifierProvider.value(
          notifier: detailedMovieProvider,
        ),
        ChangeNotifierProvider.value(
          notifier: detailedTvProvider,
        ),
        ChangeNotifierProvider.value(
          notifier: authentication,
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: CustomThemes.darkTheme,
        home: Auth(),
      ),
    );
  }
}
