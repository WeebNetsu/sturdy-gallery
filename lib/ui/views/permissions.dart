import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

class PermissionsPage extends StatefulWidget {
  const PermissionsPage({super.key});

  @override
  State<PermissionsPage> createState() => _PermissionsPageState();
}

class _PermissionsPageState extends State<PermissionsPage> {
  _permissionServiceCall() async {
    // these are the permissions required for the app to run, so only add here if the app
    // can't work without it
    /* List<Permission> requiredPermissions = [
      Permission.manageExternalStorage,
      Permission.storage
    ];

    // request all required permissions
    Map<Permission, PermissionStatus> statuses =
        await requiredPermissions.request();

    // convert map to list with true/false values
    List<bool> access = statuses.values
        .map((PermissionStatus value) => value == PermissionStatus.granted)
        .toList();

    // if all permissions have been granted
    if (!access.contains(false)) {
      Navigator.pushReplacementNamed(context, "/home");
    } */

    bool access = await Permission.manageExternalStorage.request().isGranted;

    if (access) {
      // ignore: use_build_context_synchronously
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
    final colorScheme = Theme.of(context).colorScheme;
    var permManageExtStorage = Permission.manageExternalStorage.isGranted;

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                "Permissions not given",
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Text(
                "This app requires some permissions to run, otherwise it may not work properly.",
              ),
              const Divider(),

              // required permissions
              const SizedBox(height: 20),
              const Text(
                "Required",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic,
                ),
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  MaterialButton(
                    color: colorScheme.primary,
                    onPressed: () => Permission.manageExternalStorage.request(),
                    child: const Text(
                      "Manage External Storage",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  Text(
                    "Granted",
                    style: TextStyle(
                      color: Colors.green[600],
                    ),
                  ),
                ],
              ),
              const Text(
                "This storage setting allows us to get all the images and videos on your device"
                " and modify them (rename, delete) if requested.",
              ),

              const Divider(),

              // optional permissions
              const SizedBox(height: 20),
              const Text(
                "Optional",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic,
                ),
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  MaterialButton(
                    color: colorScheme.primary,
                    onPressed: () => Permission.storage.request(),
                    child: const Text(
                      "Read/Write Storage",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  Text(
                    "Not Granted",
                    style: TextStyle(
                      color: Colors.grey[700],
                    ),
                  ),
                ],
              ),
              const Text(
                "This storage setting allows us to get all the images and videos on your device"
                " and modify them (rename, delete) if requested. (Android 9 and lower)",
              ),

              // complete setup
              const SizedBox(height: 20),
              MaterialButton(
                onPressed: () {},
                color: colorScheme.primary,
                child: const Text(
                  "Continue",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
