import 'package:flutter/material.dart';

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
      color: Color(0xff4CAF50),
      child: Center(
        child: Text('Account Page'),
      ),
    );
  }
}
