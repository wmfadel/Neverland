import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import '../providers/tv_provider.dart';
import '../widgets/tv_item.dart';

class SeriesOnAir extends StatefulWidget {
  @override
  _SeriesOnAirState createState() => _SeriesOnAirState();
}

class _SeriesOnAirState extends State<SeriesOnAir> {
  TVProvider provider;
  double screenWidth;
  double screenHeight;
  ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels >=
          _scrollController.position.maxScrollExtent)
        setState((){
          Provider.of<TVProvider>(context).getAiringTv();
        });
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    screenHeight = size.height;
    screenWidth = size.width;
    provider = Provider.of<TVProvider>(context);

    return FutureBuilder(
      future: provider.getAiringTv(),
      builder: (context, snapshot) {
        if (provider.airingToday.length > 0 &&
            snapshot.data != null &&
            snapshot.data)
          return Container(
            height: 310,
            width: screenWidth,
            child: ListView.builder(
              key: Key('providerairingderies'),
              controller: _scrollController,
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
