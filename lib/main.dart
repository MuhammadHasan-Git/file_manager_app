import 'package:file_manager_app/pages/root_app.dart';
import 'package:file_manager_app/theme/colors.dart';
import 'package:flutter/material.dart';

import 'theme/my_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      theme: MyTheme.lightTheme(context),
      darkTheme: MyTheme.darkTheme(context),
      home: const RootApp(),
    );
  }
}
