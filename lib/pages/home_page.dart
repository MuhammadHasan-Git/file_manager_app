import 'package:circle_progress_bar/circle_progress_bar.dart';
import 'package:file_manager_app/theme/colors.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: getBody(),
    );
  }

  Widget getBody() {
    return SafeArea(
        child: SingleChildScrollView(
      padding: const EdgeInsets.all(15),
      child: Column(
        children: [
          const SizedBox(
            height: 15,
          ),
          getStorageBox(),
        ],
      ),
    ));
  }

  Widget getStorageBox() {
    return Container(
      width: double.infinity,
      height: 120,
      decoration: BoxDecoration(
        color: primary,
        borderRadius: BorderRadius.circular(22),
      ),
      child: Stack(
        children: [
          Positioned(
            bottom: -40,
            right: -30,
            child: Container(
              width: 120,
              height: 120,
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor.withOpacity(0.2),
                shape: BoxShape.circle,
              ),
            ),
          ),
          Positioned(
            bottom: -10,
            left: -50,
            child: Container(
              width: 70,
              height: 70,
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor.withOpacity(0.2),
                shape: BoxShape.circle,
              ),
            ),
          ),
          Container(
            width: double.infinity,
            height: 120,
            child: Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Row(
                children: [
                  Container(
                    width: 80,
                    height: 80,
                    child: CircleProgressBar(
                      foregroundColor: Theme.of(context).cardColor,
                      value: 0.68,
                      backgroundColor:
                          Theme.of(context).primaryColor.withOpacity(0.2),
                      child: const Center(
                          child: AnimatedCount(
                              style: TextStyle(color: white),
                              count: 0.68,
                              unit: "%",
                              duration: Duration(milliseconds: 500))),
                    ),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  Flexible(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Text(
                          "10.8 GB of 15 GB used",
                          style: TextStyle(
                            fontSize: 16,
                            color: white,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            // color:
                            //     Theme.of(context).primaryColor.withOpacity(0.3),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Padding(
                              padding: const EdgeInsets.only(
                                  left: 12, right: 12, top: 10, bottom: 10),
                              child: ElevatedButton(
                                style: ButtonStyle(
                                  shape: MaterialStatePropertyAll(
                                    RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(12)),
                                  ),
                                  elevation: const MaterialStatePropertyAll(0),
                                  backgroundColor: MaterialStatePropertyAll(
                                    Theme.of(context)
                                        .primaryColor
                                        .withOpacity(0.3),
                                  ),
                                ),
                                onPressed: () {
                                  var snackBar = const SnackBar(
                                      backgroundColor: Colors.blueAccent,
                                      content:
                                          Text('Buying is not supported yet'));
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(snackBar);
                                  setState(() {});
                                },
                                child: const Text(
                                  "Buy Storage",
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: white,
                                  ),
                                ),
                              )),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
