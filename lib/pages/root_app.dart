import 'package:file_manager_app/pages/account_page.dart';
import 'package:file_manager_app/pages/files_page.dart';
import 'package:file_manager_app/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

import '../data/root_app_json.dart';

class RootApp extends StatefulWidget {
  const RootApp({super.key});

  @override
  State<RootApp> createState() => _RootAppState();
}

class _RootAppState extends State<RootApp> {
  int pageIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: getTabs(),
      body: getBody(),
    );
  }

  Widget getTabs() {
    return SalomonBottomBar(
      currentIndex: pageIndex,
      onTap: (index) {
        setState(() {
          pageIndex = index;
        });
      },
      items: List.generate(rootAppJson.length, (index) {
        return SalomonBottomBarItem(
          selectedColor: rootAppJson[index]['color'],
          icon: SvgPicture.asset(
            rootAppJson[index]['icon'],
            // ignore: deprecated_member_use
            color: rootAppJson[index]['color'],
          ),
          title: Text(rootAppJson[index]['text']),
        );
      }),
    );
  }

  Widget getBody() {
    return IndexedStack(
      index: pageIndex,
      children: const [
        HomePage(),
        FilesPage(),
        Center(
            child: Text(
          "Trash Page",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        )),
        AccountPage(),
      ],
    );
  }
}
