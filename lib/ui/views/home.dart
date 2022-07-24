import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:sturdy_gallery/ui/widgets/folder_preview.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future<Directory?> _getAppDir() async {
    // get access to external storage if we don't have it yet, if we do, execute code
    if (await Permission.manageExternalStorage.request().isGranted) {
      var dirs = await getExternalStorageDirectories();
      if (dirs == null || dirs.isEmpty) return null;
      var path = dirs[0];
      var homedir = (path.parent.parent.parent.parent);
      var allDirs = homedir.listSync();
      print(dirs);
      return dirs[0];
    }

    return null;
  }

  @override
  Widget build(BuildContext context) {
    // double windowHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView(
        children: [
          ElevatedButton(
            onPressed: () async {
              _getAppDir();
            },
            child: const Text("tete"),
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
