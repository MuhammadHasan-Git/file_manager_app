import 'package:flutter/material.dart';

import 'colors.dart';

class MyTheme {
  static darkTheme(BuildContext context) => ThemeData(
        scaffoldBackgroundColor: const Color(0xFF121212),
        textTheme: Theme.of(context).textTheme.apply(
              bodyColor: Colors.blueAccent,
              displayColor: white,
            ),
        cardColor: const Color(0xFF7fff00),
        primaryColor: const Color(0xFF121212),
      );
  static lightTheme(BuildContext context) => ThemeData(
        scaffoldBackgroundColor: white,
        textTheme: Theme.of(context).textTheme.apply(
              bodyColor: black,
              displayColor: white,
            ),
        primaryColor: white,
        cardColor: const Color(0xFF4beade),
      );
}
