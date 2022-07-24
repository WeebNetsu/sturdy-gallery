import 'package:flutter/material.dart';
import 'package:sturdy_gallery/ui/views/home.dart';
import 'package:sturdy_gallery/ui/views/permissions.dart';

Map<String, Widget Function(BuildContext)> routes = {
  "/": (context) => const PermissionsPage(),
  "/home": (context) => const HomePage(title: 'Sturdy Gallery'),
};
