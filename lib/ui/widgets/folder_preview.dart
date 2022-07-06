import 'package:flutter/material.dart';

class FolderPreviewWidget extends StatelessWidget {
  const FolderPreviewWidget(this.title, {super.key, this.rightSide});

  final String title;
  final bool? rightSide;

  @override
  Widget build(BuildContext context) {
    // final colorScheme = Theme.of(context).colorScheme;
    final windowWidth = MediaQuery.of(context).size.width;
    final previewWidth = windowWidth / 2 - 12;

    return Padding(
      padding: EdgeInsets.fromLTRB(
          rightSide == true ? 4 : 8, 4, rightSide == true ? 8 : 4, 2),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(5),
        child: Container(
          decoration: const BoxDecoration(
            // add background image
            image: DecorationImage(
              image: AssetImage("assets/images/tmp.jpg"),
              fit: BoxFit.cover,
              // width: previewWidth,
              // height: previewWidth,
            ),
          ),
          width: previewWidth,
          height: previewWidth,
          child: Column(
            children: [
              Container(
                color: const Color(0x88000000),
                width: previewWidth,
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Text(
                    title,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[350],
                    ),
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
