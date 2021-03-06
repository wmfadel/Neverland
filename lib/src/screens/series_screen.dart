import 'package:flutter/material.dart';
import '../widgets/series_on_air.dart';
import '../widgets/series_popular.dart';
import '../widgets/series_top_rated.dart';

class SeriesScreen extends StatefulWidget {
  final Key key;

  SeriesScreen(this.key) : super(key: key);

  @override
  _SeriesScreenState createState() => _SeriesScreenState();
}

class _SeriesScreenState extends State<SeriesScreen> {
  double screenWidth;
  double screenHeight;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: screenWidth,
        height: screenHeight,
        color: Color(0xff1976D2),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: ListView(
            children: <Widget>[
              SizedBox(height: 15),
              Text(
                'On Air Today',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 22),
              ),
              SeriesOnAir(),
              SizedBox(height: 15),
              Text(
                'Popular Series',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 22),
              ),
              SeriesPopular(),
              SizedBox(height: 15),
              Text(
                'Top Rated Series',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 22),
              ),
              SeriesTopRated(),
            ],
          ),
        ));
  }
}
