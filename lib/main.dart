import 'package:canopus/Themes/canopus_theme.dart';
import 'package:canopus/Views/home_screen.dart';
import 'package:canopus/Views/intro_page.dart';
import 'package:canopus/providers.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    CanopusProviders(
      child: MaterialApp(
        title: 'Canopus',
        theme: theme,
        home: await checkIntro() ? const IntroPage() : const HomeScreen(),
      ),
    ),
  );
}

/// Check if it's the user first time in the app.
Future<bool> checkIntro() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  try {
    return prefs.getBool('intro')!;
  } catch (e) {
    prefs.setBool('intro', false);
    return true;
  }
}
