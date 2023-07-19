import 'package:animate_do/animate_do.dart';
import 'package:file_manager_app/pages/file_detail_page.dart';
import 'package:flutter/material.dart';
import '../data/category_json.dart';

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
      physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.all(15),
      child: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          getTabs(),
          const SizedBox(
            height: 30,
          ),
          getDataSection(),
          const SizedBox(
            height: 20,
          ),
          pageIndex == 0 ? getMyCloudItems() : getTeamCloudItems(),
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

  Widget getDataSection() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            const Text(
              "Data Modified",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(
              width: 2,
            ),
            Icon(
              Icons.arrow_downward,
              color: Theme.of(context).cardColor,
              size: 20,
            ),
          ],
        ),
        IconButton(
          splashRadius: 20,
          onPressed: () {},
          icon: Icon(
            Icons.border_all,
            color: Theme.of(context).cardColor.withOpacity(0.5),
          ),
        )
      ],
    );
  }

  Widget getMyCloudItems() {
    var size = MediaQuery.of(context).size;
    return Wrap(
      runSpacing: 20,
      spacing: 20,
      children: List.generate(myCloudFilesContentJson.length, (index) {
        return GestureDetector(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (_) => FileDetailPage(
                        title: myCloudFilesContentJson[index]['title'],
                        fileCount: myCloudFilesContentJson[index]
                            ['file_count'])));
          },
          child: Container(
            width: (size.width - 50) / 2,
            height: (size.width - 50) / 2,
            decoration: BoxDecoration(
              color: Theme.of(context).cardColor.withOpacity(0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  myCloudFilesContentJson[index]['img'],
                  width: 55,
                ),
                const SizedBox(
                  height: 15,
                ),
                Text(
                  myCloudFilesContentJson[index]['title'] +
                      "( ${myCloudFilesContentJson[index]['file_count']} )",
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                )
              ],
            ),
          ),
        );
      }),
    );
  }

  Widget getTeamCloudItems() {
    var size = MediaQuery.of(context).size;
    return Wrap(
      runSpacing: 20,
      spacing: 20,
      children: List.generate(teamCloudFilesContentJson.length, (index) {
        return GestureDetector(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (_) => FileDetailPage(
                        title: teamCloudFilesContentJson[index]['title'],
                        fileCount: teamCloudFilesContentJson[index]
                            ['file_count'])));
          },
          child: Container(
            width: (size.width - 50) / 2,
            height: (size.width - 50) / 2,
            decoration: BoxDecoration(
              color: Theme.of(context).cardColor.withOpacity(0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  teamCloudFilesContentJson[index]['img'],
                  width: 55,
                ),
                const SizedBox(
                  height: 15,
                ),
                Text(
                  teamCloudFilesContentJson[index]['title'] +
                      "( ${teamCloudFilesContentJson[index]['file_count']} )",
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                )
              ],
            ),
          ),
        );
      }),
    );
  }
}
