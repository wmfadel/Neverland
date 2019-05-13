import 'package:flutter/material.dart';

class SeriesScreen extends StatefulWidget {

  final Key key;

  SeriesScreen(this.key) : super(key: key);

  @override
  _SeriesScreenState createState() => _SeriesScreenState();
}

class _SeriesScreenState extends State<SeriesScreen> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('series Page'),
    );
  }
}
