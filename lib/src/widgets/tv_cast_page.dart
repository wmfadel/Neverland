import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/detailed_tv_provider.dart';
import 'movie_backdrop.dart';

class TVCastPage extends StatelessWidget {
  double screenWidth;
  double screenHeight;

  @override
  Widget build(BuildContext context) {
    DetailedTvProvider tvProvider =
        Provider.of<DetailedTvProvider>(context, listen: false);
    Size size = MediaQuery.of(context).size;
    screenWidth = size.width;
    screenHeight = size.height;

    return Stack(
      children: <Widget>[
        Image.network(
          'https://image.tmdb.org/t/p/w500/${tvProvider.tvDetails.poster_path}',
          fit: BoxFit.fill,
          width: screenWidth,
          height: screenHeight,
        ),
        MovieBackdrop(),
        Container(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: tvProvider.tvDetails.cast.length <= 0
                ? Container()
                : GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 20,
                        crossAxisSpacing: 20,
                        childAspectRatio: 1.2 / 1.7),
                    itemCount: tvProvider.tvDetails.cast.length,
                    itemBuilder: (context, index) {
                      return ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: GridTile(
                          child: Image.network(
                            'https://image.tmdb.org/t/p/w500/${tvProvider.tvDetails.cast[index].profile_path}',
                            fit: BoxFit.cover,
                          ),
                          footer: Container(
                            color: Colors.black87,
                            height: 75,
                            child: Column(
                              children: <Widget>[
                                Text(
                                  tvProvider.tvDetails.cast[index].name,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18),
                                ),
                                SizedBox(height: 8),
                                Text(
                                  tvProvider.tvDetails.cast[index].character,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 16, color: Colors.white),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    }))
      ],
    );
  }
}
