import 'package:flutter/material.dart';
import 'package:flare_flutter/flare_actor.dart';

class LoadingProgress extends StatelessWidget {
  final String message;
  double screenWidth;
  double screenHeight;

  LoadingProgress(this.message);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    screenWidth = size.width;
    screenHeight = size.height;

    return Center(
      child: Container(
        width: 300,
        height: 300,
        child: Material(
          color: Colors.white,
          elevation: 20,
          borderRadius: BorderRadius.circular(10),
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                buildFlare(),
                SizedBox(
                  height: 10,
                  width: 400,
                ),
                Text(
                  message,
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.black),
                ),
                SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildFlare() {
    return Container(
      height: 240,
      child: FlareActor("assets/flare/human_animation.flr",
          alignment: Alignment.center,
          fit: BoxFit.contain,
          animation: "human_1"),
    );
  }
}
