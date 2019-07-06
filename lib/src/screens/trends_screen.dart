import 'package:flutter/material.dart';

class TrendsScreen extends StatefulWidget {
  final Key key;

  TrendsScreen(this.key) : super(key: key);

  @override
  _TrendsScreenState createState() => _TrendsScreenState();
}

class _TrendsScreenState extends State<TrendsScreen> {

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
      color: Color(0xff4CAF50),
      child: Center(
        child: Text('trending Page'),
      ),
    );
  }
}
