import 'package:flutter/material.dart';
import '../models/tv.dart';
import 'package:auto_size_text/auto_size_text.dart';

import '../screens/tv_screen.dart';

class TVItem extends StatelessWidget {
  Tv tv;

  TVItem(this.tv);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => TVScreen(tv.id)));
      },
      child: Container(
        margin: EdgeInsets.all(10),
        child: Material(
          color: Colors.white,
          clipBehavior: Clip.hardEdge,
          elevation: 10,
          borderRadius: BorderRadius.circular(10),
          child: Container(
            width: 180,
            height: 300,
            child: Column(
              children: <Widget>[
                Image.network(
                  'https://image.tmdb.org/t/p/w500/${tv.poster_path}',
                  width: 180,
                  height: 240,
                  fit: BoxFit.fill,
                ),
                SizedBox(height: 8),
                AutoSizeText(
                  tv.name,
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.black),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
