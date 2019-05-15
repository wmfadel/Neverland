import 'package:flutter/material.dart';

class CustomThemes {
  static final ThemeData darkTheme = ThemeData(
    accentColor: Color(0xffFB8C00),
    primaryColor: Color(0xff212121),
    // 0xff050405
    primaryColorDark: Color(0xffBF360C),
    primaryColorLight: Color(0xffFF8A65),
    iconTheme: IconThemeData(color: Color(0xffFB8C00)),
    accentColorBrightness: Brightness.dark,
    buttonColor: Color(0xff40aa),
    cursorColor: Color(0xffFF5722),
    disabledColor: Color(0xff424242),
  );

  static final TextStyle textStyle = TextStyle(
    color: darkTheme.accentColor,
    shadows: <Shadow>[
      Shadow(
        color: darkTheme.primaryColorLight,
        blurRadius: 4,
      ),
    ],
  );

  static final TextStyle headerStyle = TextStyle(
    fontSize: 30,
    color: Colors.white,
    shadows: <Shadow>[
      Shadow(
        color: darkTheme.primaryColorLight,
        blurRadius: 10,
      ),
    ],
    fontWeight: FontWeight.bold,
  );

  static final TextStyle headerStyle2 = TextStyle(
    fontSize: 50,
    color: Colors.white,
    shadows: <Shadow>[
      Shadow(
        color: darkTheme.primaryColorLight,
        blurRadius: 10,
      ),
    ],
    fontWeight: FontWeight.bold,
  );

  static final TextStyle whiteHeaderStyle = TextStyle(
    fontSize: 20,
    color: Colors.white,
    shadows: <Shadow>[
      Shadow(
        color: darkTheme.primaryColor,
        blurRadius: 10,
      ),
    ],
    fontWeight: FontWeight.bold,
  );

  static final TextStyle whiteHeaderStyle2 = TextStyle(
    fontSize: 25,
    color: Colors.white,
    shadows: <Shadow>[
      Shadow(
        color: darkTheme.primaryColorDark,
        blurRadius: 30,
      ),
    ],
    fontWeight: FontWeight.bold,
  );

  static final TextStyle subHeaderStyle = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.bold,
    color: darkTheme.accentColor,
    shadows: <Shadow>[
      Shadow(
        color: darkTheme.primaryColorLight,
        blurRadius: 4,
      ),
    ],
  );

  static final TextStyle infoStyle = TextStyle(
    color: darkTheme.accentColor,
    fontSize: 18,
    shadows: <Shadow>[
      Shadow(
        color: darkTheme.primaryColorLight,
        blurRadius: 4,
      ),
    ],
  );

  static final TextStyle contentStyle = TextStyle(
    color: darkTheme.accentColor,
    fontSize: 25,
    shadows: <Shadow>[
      Shadow(color: Colors.white, blurRadius: 50),
    ],
  );
}
