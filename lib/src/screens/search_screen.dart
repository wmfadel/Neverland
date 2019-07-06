import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  final Key key;

  SearchScreen(this.key) : super(key: key);
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
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
      color: Color(0xffE53935),
      child: Center(
        child: Text('search Page'),
      ),
    );
  }
}
