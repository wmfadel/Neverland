import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/detailed_tv_provider.dart';
import 'info_Chip.dart';
import 'movie_backdrop.dart';
import 'tv_shadow_container.dart';

class TVSpecsPage extends StatelessWidget {
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
        Align(
          alignment: Alignment.center,
          child: Material(
            elevation: 20,
            color: Colors.white,
            clipBehavior: Clip.hardEdge,
            borderRadius: BorderRadius.circular(10),
            child: Container(
              width: screenWidth * 0.85,
              height: screenHeight * 0.8,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Stack(
                    children: <Widget>[
                      Image.network(
                        'https://image.tmdb.org/t/p/w500/${detailedTvProvider.tvDetails.backdrop_path}',
                        width: screenWidth * 0.85,
                        height: 250,
                        fit: BoxFit.fill,
                      ),
                      Positioned(
                        top: 175,
                        child: TVShadowContainer(),
                      ),
                    ],
                  ),
                  // end of images stack
                  SizedBox(height: 10),
                  Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Container(
                          height: 260,
                          child: ListView(
                            children: <Widget>[
                              Wrap(
                                children: <Widget>[
                                  InfoChip(
                                    'Status',
                                    detailedTvProvider.tvDetails.status,
                                    color: Colors.blueAccent,
                                  ),
                                  InfoChip(
                                    'Rate',
                                    detailedTvProvider.tvDetails.vote_average
                                        .toString(),
                                    color: Colors.blueAccent,
                                  ),
                                  InfoChip(
                                    'In Production?',
                                    detailedTvProvider.tvDetails.in_production
                                        ? 'Yes'
                                        : 'No',
                                    color: Colors.blueAccent,
                                  ),
                                  InfoChip(
                                    '# Seasons',
                                    detailedTvProvider
                                        .tvDetails.number_of_seasons
                                        .toString(),
                                    color: Colors.blueAccent,
                                  ),
                                  InfoChip(
                                    '# Episodes',
                                    detailedTvProvider
                                        .tvDetails.number_of_episodes
                                        .toString(),
                                    color: Colors.blueAccent,
                                  ),
                                  InfoChip(
                                    'Original Language',
                                    detailedTvProvider
                                        .tvDetails.original_language,
                                    color: Colors.blueAccent,
                                  ),
                                ],
                              )
                            ],
                          ))),
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}
