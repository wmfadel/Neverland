import 'package:flutter/material.dart';

import 'info_Chip.dart';
import '../models/season.dart';

class SeasonItem extends StatelessWidget {
  final Season _season;

  SeasonItem(this._season);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8),
      child: Material(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        elevation: 10,
        clipBehavior: Clip.hardEdge,
        child: Row(
          children: <Widget>[
            Image.network(
              'https://image.tmdb.org/t/p/w500/${_season.poster_path}',
              width: 170,
              height: 240,
              fit: BoxFit.fill,
            ),
            Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Container(
                  width: 200,
                  padding: const EdgeInsets.all(8.0),
                  child: Text(_season.name,
                      maxLines: 5,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold)),
                ),
                Container(
                  width: 200,
                  child: Wrap(
                    spacing: 8,
                    children: <Widget>[
                      InfoChip(
                          'Season Number', _season.season_number.toString(),
                          color: Colors.blueAccent),
                      InfoChip(
                          'Episodes Count', _season.episode_count.toString(),
                          color: Colors.blueAccent),
                      InfoChip(
                          'Air Date',
                          _season.air_date == null || _season.air_date.isEmpty
                              ? 'Unknow'
                              : _season.air_date,
                          color: Colors.blueAccent),
                    ],
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
