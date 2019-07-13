// library imports
import 'package:flutter/material.dart';

// files imports
import 'movies_screen.dart';
import 'series_screen.dart';
import 'search_screen.dart';
import 'account_screen.dart';
import '../styles/custom_themes.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // scroll state handellers
  final PageStorageKey moviesKey = PageStorageKey('movies');
  final PageStorageKey seriesKey = PageStorageKey('TV');
  final PageStorageKey searchKey = PageStorageKey('search');
  final PageStorageKey trendsKey = PageStorageKey('Account');
  final PageStorageBucket storageBucket = PageStorageBucket();

  // main navigation screens
  MoviesScreen moviesScreen;
  SeriesScreen seriesScreen;
  SearchScreen searchScreen;
  AccountScreen trendsScreen;
  Widget currentScreen;
  int _navigationIndex = 0;
  List<Widget> screens = [];

  @override
  void initState() {
    super.initState();
    moviesScreen = MoviesScreen(moviesKey);
    seriesScreen = SeriesScreen(seriesKey);
    searchScreen = SearchScreen(searchKey);
    trendsScreen = AccountScreen(trendsKey);
    screens = [moviesScreen, seriesScreen, searchScreen, trendsScreen];
    currentScreen = screens[_navigationIndex];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).buttonColor,
      body: PageStorage(
        bucket: storageBucket,
        child: currentScreen,
      ),
      bottomNavigationBar: buildBottomNavigationBar(),
    );
  }

  Widget buildBottomNavigationBar() {
    return BottomNavigationBar(
      items: getBottomNavigationBarItem(),
      currentIndex: _navigationIndex,
      onTap: (value) {
        setState(() {
          _navigationIndex = value;
          currentScreen = screens[_navigationIndex];
        });
      },
    );
  }

  List<BottomNavigationBarItem> getBottomNavigationBarItem() {
    return <BottomNavigationBarItem>[
      BottomNavigationBarItem(
        backgroundColor: Theme.of(context).primaryColor,
        icon: Icon(
          Icons.local_movies,
          color: Theme.of(context).accentColor,
        ),
        title: Text(
          'Movies',
          style: CustomThemes.textStyle,
        ),
      ),
      BottomNavigationBarItem(
        backgroundColor: Color(0xff0D47A1),
        icon: Icon(
          Icons.tv,
          color: Theme.of(context).accentColor,
        ),
        title: Text(
          'TV',
          style: CustomThemes.textStyle,
        ),
      ),
      BottomNavigationBarItem(
        backgroundColor: Color(0xffB71C1C),
        icon: Icon(
          Icons.search,
          color: Theme.of(context).accentColor,
        ),
        title: Text(
          'Search',
          style: CustomThemes.textStyle,
        ),
      ),
      BottomNavigationBarItem(
        backgroundColor: Colors.white30,
        icon: Icon(
          Icons.account_circle,
          color: Theme.of(context).accentColor,
        ),
        title: Text(
          'Account',
          style: CustomThemes.textStyle,
        ),
      ),
    ];
  }
}
