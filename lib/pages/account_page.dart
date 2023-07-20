import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../theme/colors.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({super.key});

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: getBody(),
    );
  }

  Widget getBody() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 240,
          child: Stack(
            children: [
              getCurveShape(),
              getLoginIcon(),
            ],
          ),
        ),
        const SizedBox(
          height: 30,
        ),
        getInformationList(),
      ],
    );
  }

  Widget getCurveShape() {
    var size = MediaQuery.of(context).size;
    return ClipPath(
      clipper: OvalBottomBorderClipper(),
      child: Container(
        width: size.width,
        height: size.height * 0.25,
        decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          boxShadow: [
            BoxShadow(
              color: Theme.of(context).scaffoldBackgroundColor.withOpacity(0.1),
              spreadRadius: 10,
              blurRadius: 10,
            )
          ],
        ),
        child: SafeArea(
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10, top: 10),
                    child: Row(
                      children: [
                        Icon(
                          Icons.arrow_back,
                          color: Theme.of(context).primaryColor,
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    "Muhammad Hasan",
                    style: TextStyle(color: white, fontSize: 25),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget getLoginIcon() {
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: Container(
        width: 100,
        height: 100,
        decoration:
            BoxDecoration(color: white, shape: BoxShape.circle, boxShadow: [
          BoxShadow(
              color: Theme.of(context).cardColor,
              spreadRadius: 1,
              blurRadius: 1),
        ]),
        child: Center(
          child: Icon(
            Icons.person,
            size: 70,
            color: Theme.of(context).cardColor,
          ),
        ),
      ),
    );
  }

  Widget getInformationList() {
    return Expanded(
      child: Center(
        child: ListView(
          physics: const BouncingScrollPhysics(),
          children: [
            ListTile(
              leading: Icon(
                Icons.person,
                color: Theme.of(context).cardColor,
              ),
              title: const Text(
                "Muhammad Hasan",
              ),
            ),
            Divider(
              color: Theme.of(context).cardColor,
            ),
            ListTile(
              leading: Icon(
                Icons.today,
                color: Theme.of(context).cardColor,
              ),
              title: const Text("Birtday"),
            ),
            Divider(
              color: Theme.of(context).cardColor,
            ),
            ListTile(
              leading: Icon(
                Icons.phone_android,
                color: Theme.of(context).cardColor,
              ),
              title: const Text("818 123 4567"),
            ),
            Divider(
              color: Theme.of(context).cardColor,
            ),
            ListTile(
              leading: Icon(
                FontAwesomeIcons.instagram,
                color: Theme.of(context).cardColor,
              ),
              title: const Text("Instagram Account"),
            ),
            Divider(
              color: Theme.of(context).cardColor,
            ),
            ListTile(
              leading: Icon(
                Icons.email,
                color: Theme.of(context).cardColor,
              ),
              title: Text("info@aplusdesign.co"),
            ),
            Divider(
              color: Theme.of(context).cardColor,
            ),
            ListTile(
              leading: Icon(
                Icons.remove_red_eye,
                color: Theme.of(context).cardColor,
              ),
              title: const Text("Password"),
              trailing: Icon(
                Icons.sync,
                color: Theme.of(context).cardColor,
                size: 30,
              ),
            ),
            Divider(
              color: Theme.of(context).cardColor,
            ),
            SizedBox(
              height: 60,
            ),
          ],
        ),
      ),
    );
  }
}
