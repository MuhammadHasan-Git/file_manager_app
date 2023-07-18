import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

class FilesPage extends StatefulWidget {
  const FilesPage({super.key});

  @override
  State<FilesPage> createState() => _FilesPageState();
}

class _FilesPageState extends State<FilesPage> {
  int pageIndex = 0;
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
            height: 20,
          ),
          getTabs(),
        ],
      ),
    ));
  }

  Widget getTabs() {
    var size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      height: 55,
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          pageIndex == 0
              ? Flexible(
                  child: ElasticIn(
                    child: Padding(
                      padding: const EdgeInsets.all(6),
                      child: Container(
                        width: (size.width - 45) / 2,
                        height: 50,
                        child: ElevatedButton(
                          style: ButtonStyle(
                            elevation: const MaterialStatePropertyAll(6),
                            backgroundColor: MaterialStatePropertyAll(
                                Theme.of(context).cardColor.withOpacity(0.9)),
                            shape: MaterialStatePropertyAll(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12)),
                            ),
                          ),
                          onPressed: () {
                            setState(() {
                              pageIndex = 0;
                            });
                          },
                          child: const Center(
                            child: Text(
                              "My Cloud",
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                )
              : GestureDetector(
                  onTap: () {
                    setState(() {
                      pageIndex = 0;
                    });
                  },
                  child: Container(
                      width: (size.width - 45) / 2,
                      height: 50,
                      child: Center(
                          child: Text(
                        "My Cloud",
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).cardColor.withOpacity(0.5),
                        ),
                      ))),
                ),
          pageIndex == 1
              ? Flexible(
                  child: ElasticIn(
                    child: Padding(
                      padding: const EdgeInsets.all(6),
                      child: Container(
                        width: (size.width - 45) / 2,
                        height: 50,
                        child: ElevatedButton(
                          style: ButtonStyle(
                            elevation: const MaterialStatePropertyAll(6),
                            backgroundColor: MaterialStatePropertyAll(
                                Theme.of(context).cardColor),
                            shape: MaterialStatePropertyAll(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12)),
                            ),
                          ),
                          onPressed: () {
                            setState(() {
                              pageIndex = 1;
                            });
                          },
                          child: const Center(
                            child: Text(
                              "Team Cloud",
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                )
              : GestureDetector(
                  onTap: () {
                    setState(() {
                      pageIndex = 1;
                    });
                  },
                  child: Container(
                      width: (size.width - 45) / 2,
                      height: 50,
                      child: Center(
                          child: Text(
                        "Team Cloud",
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).cardColor.withOpacity(0.5),
                        ),
                      ))),
                ),
        ],
      ),
    );
  }
}
