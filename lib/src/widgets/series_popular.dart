import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import '../providers/tv_provider.dart';
import '../widgets/tv_item.dart';

class SeriesPopular extends StatefulWidget {
  @override
  _SeriesPopularState createState() => _SeriesPopularState();
}

class _SeriesPopularState extends State<SeriesPopular> {
  TVProvider provider;
  double screenWidth;
  double screenHeight;
  ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels >=
          _scrollController.position.maxScrollExtent)
        setState((){
          Provider.of<TVProvider>(context).getPopularTv();
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
      future: provider.getPopularTv(),
      builder: (context, snapshot) {
        if (provider.popular.length > 0 &&
            snapshot.data != null &&
            snapshot.data)
          return Container(
            height: 310,
            width: screenWidth,
            child: ListView.builder(
              key: PageStorageKey('providerpopulartv'),
              controller: _scrollController,
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              itemCount: provider.popular.length,
              itemBuilder: (context, index) {
                return TVItem(provider.popular[index]);
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
