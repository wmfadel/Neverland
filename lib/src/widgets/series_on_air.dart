import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/tv_provider.dart';
import '../models/tv.dart';
import '../widgets/tv_item.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class SeriesOnAir extends StatefulWidget {
  @override
  _SeriesOnAirState createState() => _SeriesOnAirState();
}

class _SeriesOnAirState extends State<SeriesOnAir> {
  TVProvider provider;
  double screenWidth;
  double screenHeight;


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    screenHeight = size.height;
    screenWidth = size.width;
    provider = Provider.of<TVProvider>(context);

    return FutureBuilder(
      future: provider.getAiringTv(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done &&
            snapshot.hasData)
          return Container(
            height: 310,
            width: screenWidth,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              itemCount: provider.airingToday.length,
              itemBuilder: (context, index) {
                return TVItem(provider.airingToday[index]);
              },
            ),
          );
        return Center(
          child: SpinKitWave(
            color: Colors.white,
            size: 35,
          ),
        );
      },
    );
  }

}
