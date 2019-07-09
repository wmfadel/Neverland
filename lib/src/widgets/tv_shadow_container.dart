import 'package:flutter/material.dart';

class TVShadowContainer extends StatelessWidget {
  double screenWidth;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    screenWidth = size.width;
    return Container(
      width: screenWidth * 0.85,
      height: 80,
      decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: <Color>[
              Colors.transparent,
              Colors.white,
            ],
            begin: AlignmentDirectional.topCenter,
            end: AlignmentDirectional.bottomCenter,
          )),
    );
  }
}
