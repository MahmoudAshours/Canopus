import 'package:canopus/Themes/canopus_theme.dart';
import 'package:canopus/Views/intro_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Canopus',
      theme: theme,
      home: const IntroPage(),
    );
  }
}
