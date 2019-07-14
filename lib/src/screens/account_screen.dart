import 'package:flutter/material.dart';
import '../styles/custom_themes.dart';
import '../widgets/account_favorite_movies.dart';

class AccountScreen extends StatefulWidget {
  final Key key;

  AccountScreen(this.key) : super(key: key);

  @override
  _AccountScreenState createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {

  double screenWidth;
  double screenHeight;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    screenHeight = size.height;
    screenWidth = size.width;
    return Container(
      width: screenWidth,
      height: screenHeight,
      color: Colors.white,
      child: ListView(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(10),
            child: Text('Movies', style: CustomThemes.headerStyle),
          ),
          Container(
              height: 310,
              child: AccountFavoriteMovies()),
        ],
      ),
    );
  }
}
