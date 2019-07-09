import 'package:flutter/material.dart';
import '../models/episode.dart';
import 'tv_shadow_container.dart';
import 'info_Chip.dart';

class EpisodeItem extends StatelessWidget {
  double screenWidth;
  double screenHeight;
  final Episode _episode;

  EpisodeItem(this._episode);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    screenWidth = size.width;
    screenHeight = size.height;
    return Container(
      width: screenWidth * 0.8,
      height: 400,
      margin: EdgeInsets.all(10),
      child: Material(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          elevation: 15,
          clipBehavior: Clip.hardEdge,
          child: Stack(
            children: <Widget>[
              Image.network(
                'https://image.tmdb.org/t/p/w500/${_episode.still_path}',
                width: screenWidth * 0.9,
                height: 150,
                fit: BoxFit.fill,
              ),
              Positioned(top: 80, child: TVShadowContainer()),
              Positioned(
                  top: 90,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      buildTextContainer(),
                      SizedBox(height: 10),
                      buildOverviewContainer(),
                      Container(
                        width: 320,
                        height: 120,
                        margin: EdgeInsets.all(8),
                        child: ListView(
                          physics: ClampingScrollPhysics(),
                          shrinkWrap: true,
                          primary: true,
                          children: <Widget>[
                            Wrap(
                              spacing: 10,
                              children: <Widget>[
                                InfoChip(
                                  'date',
                                  _episode.air_date,
                                  color: Colors.blueAccent,
                                ),
                                InfoChip(
                                  '#episode',
                                  _episode.episode_number.toString(),
                                  color: Colors.blueAccent,
                                ),
                                InfoChip(
                                  '#season',
                                  _episode.season_number.toString(),
                                  color: Colors.blueAccent,
                                ),
                                InfoChip(
                                  'rate',
                                  _episode.vote_average.toString(),
                                  color: Colors.blueAccent,
                                ),
                              ],
                            )
                          ],
                        ),
                      )
                    ],
                  )),
            ],
          )),
    );
  }

  Container buildOverviewContainer() {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(color: Colors.blue, width: 2),
          borderRadius: BorderRadius.circular(8)),
      width: 320,
      padding: EdgeInsets.all(8),
      margin: EdgeInsets.all(8),
      child: Text(
        _episode.overview == null || _episode.overview.isEmpty
            ? '\nNo Overview Available for this episode\n'
            : _episode.overview,
        maxLines: 5,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(fontSize: 16),
      ),
    );
  }

  Container buildTextContainer() {
    return Container(
      width: 300,
      child: Text(
        _episode.name,
        style: TextStyle(
            color: Colors.white,
            shadows: <Shadow>[Shadow(color: Colors.blue, blurRadius: 15)],
            fontSize: 25,
            fontWeight: FontWeight.bold),
      ),
      padding: EdgeInsets.symmetric(horizontal: 10),
    );
  }
}
