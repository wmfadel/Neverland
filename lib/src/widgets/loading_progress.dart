import 'package:flutter/material.dart';

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
                    SizedBox(height: 30),
                    CircularProgressIndicator(),
                    SizedBox(height: 20, width: 400,),
                    Text(
                      message,
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.black),
                    ),
                    SizedBox(height: 30),
                  ],
                ),
            ),
        ),
      ),
    );
  }
}
