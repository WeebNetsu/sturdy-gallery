import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

class PermissionsPage extends StatefulWidget {
  const PermissionsPage({super.key});

  @override
  State<PermissionsPage> createState() => _PermissionsPageState();
}

class _PermissionsPageState extends State<PermissionsPage> {
  _permissionServiceCall() async {
    bool hasPerms = await Permission.manageExternalStorage.request().isGranted;

    if (hasPerms) {
      Navigator.pushReplacementNamed(context, "/home");
    }
  }

  @override
  void initState() {
    super.initState();
    _permissionServiceCall();
  }

  @override
  Widget build(BuildContext context) {
    // double windowHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SafeArea(
        child: Text("Invalid permissions given"),
      ),
    );
  }
}
