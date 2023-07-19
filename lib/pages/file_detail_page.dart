import 'package:animated_icon/animated_icon.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:file_manager_app/theme/colors.dart';
import 'package:flutter/material.dart';

import '../data/recent_files_json.dart';

class FileDetailPage extends StatefulWidget {
  final String title;
  final String fileCount;
  const FileDetailPage(
      {super.key, required this.title, required this.fileCount});

  @override
  State<FileDetailPage> createState() => _FileDetailPageState();
}

class _FileDetailPageState extends State<FileDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          child: getAppBar(), preferredSize: const Size.fromHeight(60)),
      body: getBody(),
    );
  }

  Widget getAppBar() {
    return AppBar(
      elevation: 0,
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      centerTitle: true,
      title: Text(
        widget.title + " (${widget.fileCount}) ",
        style: TextStyle(
          color: Theme.of(context).cardColor,
          fontSize: 17,
        ),
      ),
    );
  }

  Widget getBody() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 20,
          ),
          getDataSection(),
          const SizedBox(
            height: 20,
          ),
          getItemList(),
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

  Widget getItemList() {
    var size = MediaQuery.of(context).size;
    return Wrap(
      spacing: 20,
      runSpacing: 20,
      children: List.generate(imageFiles.length, (index) {
        return Container(
          width: (size.width - 60) / 2,
          height: (size.width - 50) / 2,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: (size.width - 60) / 2,
                height: 120,
                decoration: BoxDecoration(
                  color: white,
                  borderRadius: BorderRadius.circular(22),
                ),
                child: CachedNetworkImage(
                  imageUrl: imageFiles[index]['img'],
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
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 5),
                child: Text(
                  imageFiles[index]['file_name'],
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              const SizedBox(
                height: 3,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 5),
                child: Text(
                  imageFiles[index]['file_size'],
                  style: TextStyle(
                    fontSize: 12,
                    color: Theme.of(context).cardColor.withOpacity(0.5),
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}
