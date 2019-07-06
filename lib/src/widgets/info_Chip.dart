import 'package:flutter/material.dart';

class InfoChip extends StatelessWidget {
  final String text;

  InfoChip(this.text);

  @override
  Widget build(BuildContext context) {
    return Chip(
      label: Text(
        text,
        style: TextStyle(color: Colors.white),
      ),
      backgroundColor: Theme.of(context).accentColor,
      padding: EdgeInsets.all(8),
      elevation: 10,
      shadowColor: Colors.white,
    );
  }
}
