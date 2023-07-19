import 'package:flutter/material.dart';

import 'colors.dart';

class MyTheme {
  static darkTheme(BuildContext context) => ThemeData(
        elevatedButtonTheme: ElevatedButtonThemeData(
            style:
                ElevatedButton.styleFrom(backgroundColor: Colors.blueAccent)),
        scaffoldBackgroundColor: const Color(0xFF121212),
        textTheme: Theme.of(context).textTheme.apply(
              bodyColor: Colors.blueAccent.withOpacity(0.9),
              displayColor: white,
            ),
        appBarTheme: const AppBarTheme(
          elevation: 0,
          iconTheme: IconThemeData(color: Colors.white),
        ),
        cardColor: Colors.blueAccent,
        canvasColor: const Color(0xFF7fff00),
        primaryColor: const Color(0xFF121212),
      );
  static lightTheme(BuildContext context) => ThemeData(
        scaffoldBackgroundColor: white,
        elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
                backgroundColor: secondary.withOpacity(0.9))),
        textTheme: Theme.of(context).textTheme.apply(
              bodyColor: secondary.withOpacity(0.8),
              displayColor: white,
            ),
        appBarTheme: const AppBarTheme(
          elevation: 0,
          iconTheme: IconThemeData(color: Colors.black),
        ),
        primaryIconTheme: const IconThemeData(color: black),
        primaryColor: white,
        canvasColor: const Color(0xFF4beade),
        cardColor: secondary,
      );
}
