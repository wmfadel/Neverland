import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/detailed_tv_provider.dart';

class TVScreen extends StatelessWidget {
  final int tvId;

  TVScreen(this.tvId);

  double screenWidth;
  double screenHeight;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    screenWidth = size.width;
    screenHeight = size.height;

    return Scaffold(
      body: Container(
        child: FutureBuilder(
          future: Provider.of<DetailedTvProvider>(context, listen: false)
              .getMovieDetails(tvId),
          builder: (context, snapshot) {
            if (snapshot.hasData)
              return Center(
                  child: Text(
                      Provider.of<DetailedTvProvider>(context).tvDetails.name));
            return CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}
