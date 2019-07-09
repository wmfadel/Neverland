import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/detailed_tv_provider.dart';
import 'movie_backdrop.dart';
import 'episode_item.dart';

class TVEpisodes extends StatelessWidget {
  double screenWidth;
  double screenHeight;

  @override
  Widget build(BuildContext context) {
    DetailedTvProvider detailedTvProvider =
        Provider.of<DetailedTvProvider>(context, listen: false);
    Size size = MediaQuery.of(context).size;
    screenWidth = size.width;
    screenHeight = size.height;

    return Stack(
      children: <Widget>[
        Image.network(
          'https://image.tmdb.org/t/p/w500/${detailedTvProvider.tvDetails.poster_path}',
          fit: BoxFit.fill,
          width: screenWidth,
          height: screenHeight,
        ),
        MovieBackdrop(),
        Container(
          width: screenWidth,
          height: screenHeight,
          padding: EdgeInsets.symmetric(horizontal: screenWidth*0.05),
          child: ListView(
            children: <Widget>[
              detailedTvProvider.tvDetails.last_episode_to_air == null
                  ? Container()
                  : EpisodeItem(
                      detailedTvProvider.tvDetails.last_episode_to_air),
              detailedTvProvider.tvDetails.next_episode_to_air == null
                  ? Container()
                  : EpisodeItem(
                  detailedTvProvider.tvDetails.next_episode_to_air),
            ],
          ),
        )
      ],
    );
  }
}
