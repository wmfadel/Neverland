import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  final Key key;

  SearchScreen(this.key) : super(key: key);
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('search Page'),
    );
  }
}
