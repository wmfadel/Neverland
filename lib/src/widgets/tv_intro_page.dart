import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/detailed_tv_provider.dart';
import 'movie_backdrop.dart';
import 'package:auto_size_text/auto_size_text.dart';
import '../styles/custom_themes.dart';

class TVIntroPage extends StatelessWidget {
  double screenWidth;
  double screenHeight;
  DetailedTvProvider tvProvider;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    screenWidth = size.width;
    screenHeight = size.height;
    tvProvider = Provider.of<DetailedTvProvider>(context);
    return Container(
      width: screenWidth,
      height: screenHeight,
      child: Stack(
        children: <Widget>[
          Image.network(
            'https://image.tmdb.org/t/p/w500/${tvProvider.tvDetails.poster_path}',
            fit: BoxFit.fill,
            width: screenWidth,
            height: screenHeight,
          ),
          MovieBackdrop(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width * 0.95,
                margin: EdgeInsets.symmetric(horizontal: 10),
                child: AutoSizeText(
                  tvProvider.tvDetails.name,
                  textAlign: TextAlign.center,
                  style: CustomThemes.headerStyle2,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(tvProvider.tvDetails.overview,
                    textAlign: TextAlign.center,
                    style: CustomThemes.whiteHeaderStyle),
              ),
            ],
          ),
        ],
      ),
    );
  }

}
