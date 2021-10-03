import 'package:canopus/ViewModel/intro_views.dart';
import 'package:canopus/Views/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:intro_views_flutter/intro_views_flutter.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IntroViewsFlutter(
        IntroViewsConstants().page,
        onTapDoneButton: () => Navigator.of(context)
            .push(MaterialPageRoute(builder: (_) => const HomeScreen())),
        showSkipButton: false,
        pageButtonTextStyles: const TextStyle(
          color: Colors.white,
          fontSize: 18.0,
        ),
      ),
    );
  }
}
