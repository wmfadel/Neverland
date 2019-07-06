import 'package:flutter/material.dart';

class InfoChip extends StatelessWidget {
  final String text;
  final String value;

  InfoChip(this.text, this.value);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text(
            text,
            style: TextStyle(color: Colors.white),
          ),
          SizedBox(width: 8),
          Container(
            child: Text('$value', style: TextStyle(color: Colors.black)),
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(25)),
          ),
        ],
      ),
      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      margin: EdgeInsets.all(8),
      decoration: BoxDecoration(
          color: Theme.of(context).primaryColorDark,
          borderRadius: BorderRadius.circular(25)),
    );
  }
}

/*
 Container(
        width: 50,
        child: Text(text, style: TextStyle(color: Colors.black)),
        padding: EdgeInsets.all(4),
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(25)),
      ),
 */
