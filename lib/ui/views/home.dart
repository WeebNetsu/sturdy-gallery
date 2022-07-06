import 'package:flutter/material.dart';
import 'package:sturdy_gallery/ui/widgets/folder_preview.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    // double windowHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView(
        children: [
          Row(
            children: const [
              FolderPreviewWidget("Folder 1"),
              FolderPreviewWidget("Folder 2", rightSide: true),
            ],
          ),
          Row(
            children: const [
              FolderPreviewWidget("Folder 1"),
              FolderPreviewWidget("Folder 2", rightSide: true),
            ],
          ),
          Row(
            children: const [
              FolderPreviewWidget("Folder 1"),
              FolderPreviewWidget("Folder 2", rightSide: true),
            ],
          ),
          Row(
            children: const [
              FolderPreviewWidget("Folder 1"),
              FolderPreviewWidget("Folder 2", rightSide: true),
            ],
          ),
          Row(
            children: const [
              FolderPreviewWidget("Folder 1"),
              FolderPreviewWidget("Folder 2", rightSide: true),
            ],
          ),
          Row(
            children: const [
              FolderPreviewWidget("Folder 1"),
              FolderPreviewWidget("Folder 2", rightSide: true),
            ],
          ),
        ],
      ),
    );
  }
}
