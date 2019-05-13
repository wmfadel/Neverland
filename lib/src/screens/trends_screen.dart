import 'package:flutter/material.dart';

class TrendsScreen extends StatefulWidget {
  final Key key;

  TrendsScreen(this.key) : super(key: key);

  @override
  _TrendsScreenState createState() => _TrendsScreenState();
}

class _TrendsScreenState extends State<TrendsScreen> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('trending Page'),
    );
  }
}
