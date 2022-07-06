import 'package:flutter/material.dart';
import 'package:sturdy_gallery/ui/views/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sturdy Gallery',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        colorScheme: Theme.of(context).colorScheme.copyWith(
              primary: const Color(0xFF455a64),
              // secondary: const Color(0xFFEB85AD),
            ),
      ),
      home: const HomePage(title: 'Sturdy Gallery'),
    );
  }
}
