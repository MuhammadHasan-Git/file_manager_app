import 'package:animated_icon/animated_icon.dart';
import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:circle_progress_bar/circle_progress_bar.dart';
import 'package:file_manager_app/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../data/category_json.dart';
import '../data/recent_files_json.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isplay = false;

  bool isSyncing = false;
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 15,
          ),
          getStorageBox(),
          const SizedBox(
            height: 30,
          ),
          getRecentFiles(),
          const SizedBox(
            height: 30,
          ),
          getCategoryFiles(),
        ],
      ),
    ));
  }

  Widget getStorageBox() {
    return Container(
      width: double.infinity,
      height: 120,
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor.withOpacity(0.9),
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
                      foregroundColor: Theme.of(context).canvasColor,
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
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "10.8 GB of 15 GB used",
                          style: TextStyle(
                            fontSize: 16,
                            color: white,
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        ElevatedButton(
                          style: ButtonStyle(
                            shape: MaterialStatePropertyAll(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12)),
                            ),
                            elevation: const MaterialStatePropertyAll(0),
                            backgroundColor: MaterialStatePropertyAll(
                              Theme.of(context).primaryColor.withOpacity(0.3),
                            ),
                          ),
                          onPressed: () {
                            var snackBar = SnackBar(
                                backgroundColor: Theme.of(context)
                                    .cardColor
                                    .withOpacity(0.9),
                                content:
                                    const Text('Buying is not supported yet.'));
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

  Widget getRecentFiles() {
    var size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.only(left: 2, right: 2),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Recent Files",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(),
            child: Row(
              children: List.generate(recentFilesJson.length, (index) {
                var fileType = "assets/icons/image.svg";
                if (recentFilesJson[index]['type'] == 'image') {
                  fileType = "assets/icons/image.svg";
                } else if (recentFilesJson[index]['type'] == 'video') {
                  fileType = "assets/icons/video.svg";
                }
                return Padding(
                  padding: const EdgeInsets.only(right: 15),
                  child: Column(
                    children: [
                      Container(
                        width: size.width * 0.6,
                        height: 160,
                        child: CachedNetworkImage(
                          imageUrl: recentFilesJson[index]['img'],
                          imageBuilder: (context, imageProvider) => Container(
                            width: size.width * 0.6,
                            height: 160,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(22),
                              image: DecorationImage(
                                image: imageProvider,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          placeholder: (context, url) => Container(
                            width: size.width * 0.6,
                            height: 160,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(22),
                              color: Colors.grey.withOpacity(0.3),
                            ),
                            child: Center(
                              child: AnimateIcon(
                                onTap: () {},
                                iconType: IconType.continueAnimation,
                                height: 70,
                                width: 70,
                                // ignore: unnecessary_null_comparison
                                animateIcon: AnimateIcons.cloud,
                                color: Colors.blueAccent,
                              ),
                            ),
                          ),
                          errorWidget: (context, url, error) => Container(
                            width: size.width * 0.6,
                            height: 160,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(22),
                              color: Colors.grey.withOpacity(0.3),
                            ),
                            child: const Center(
                                child: Icon(
                              Icons.error,
                              color: Colors.red,
                            )),
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 8),
                            child: Column(
                              children: [
                                BlurryContainer(
                                  borderRadius: BorderRadius.circular(12),
                                  blur: 5,
                                  padding: EdgeInsets.zero,
                                  child: Container(
                                    width: size.width * 0.5,
                                    height: 35,
                                    decoration: BoxDecoration(
                                      color: Theme.of(context)
                                          .cardColor
                                          .withOpacity(0.1),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Row(
                                            children: [
                                              SvgPicture.asset(
                                                fileType,
                                                width: 20,
                                                color:
                                                    Theme.of(context).cardColor,
                                              ),
                                              const SizedBox(
                                                width: 10,
                                              ),
                                              Text(
                                                recentFilesJson[index]
                                                    ['file_name'],
                                              )
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              }),
            ),
          ),
        ],
      ),
    );
  }

  Widget getCategoryFiles() {
    return Padding(
      padding: const EdgeInsets.only(left: 2, right: 2),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Category",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(),
            child: Row(
              children: List.generate(categoryJson.length, (index) {
                return Padding(
                  padding: const EdgeInsets.only(right: 15),
                  child: Container(
                    height: 150,
                    width: 140,
                    decoration: BoxDecoration(
                      color: Theme.of(context).cardColor.withOpacity(0.1),
                      borderRadius: BorderRadiusDirectional.circular(22),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          categoryJson[index]['img'],
                          width: 40,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          categoryJson[index]['text'],
                          style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          categoryJson[index]['file_count'],
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color:
                                  Theme.of(context).cardColor.withOpacity(0.5)),
                        ),
                      ],
                    ),
                  ),
                );
              }),
            ),
          )
        ],
      ),
    );
  }
}
