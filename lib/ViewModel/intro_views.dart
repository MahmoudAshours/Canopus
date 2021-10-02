import 'package:flutter/material.dart';
import 'package:intro_views_flutter/intro_views_flutter.dart';

class IntroViewsConstants {
  final page = [
    PageViewModel(
      pageColor: Colors.white,
      iconImageAssetPath: 'assets/images/day.gif',
      body: const Text(
        'Easy  cab  booking  at  your  doorstep  with  cashless  payment  system',
      ),
      title: const Text('Cabs'),
      mainImage: Image.asset(
        'assets/images/day.gif',
        height: 285.0,
        width: 285.0,
        alignment: Alignment.center,
      ),
      titleTextStyle: const TextStyle(fontFamily: 'wave', color: Colors.black),
      bodyTextStyle: const TextStyle(fontFamily: 'age', color: Colors.orange),
    ),
    PageViewModel(
      pageColor: const Color(0xffFFAE00),
      iconImageAssetPath: 'assets/images/coffee_space.gif',
      body: const Text(
        'Easy  cab  booking  at  your  doorstep  with  cashless  payment  system',
      ),
      title: const Text('Cabs'),
      mainImage: Image.asset(
        'assets/images/coffee_space.gif',
        height: 285.0,
        width: 285.0,
        alignment: Alignment.center,
      ),
      titleTextStyle:
          const TextStyle(fontFamily: 'MyFont', color: Colors.black),
      bodyTextStyle:
          const TextStyle(fontFamily: 'MyFont', color: Colors.orange),
    ),
    PageViewModel(
      pageColor: Colors.white,
      iconImageAssetPath: 'assets/images/renewable_energy.jpeg',
      body: const Text(
        'Easy  cab  booking  at  your  doorstep  with  cashless  payment  system',
      ),
      title: const Text('Cabs'),
      mainImage: Image.asset(
        'assets/images/renewable_energy.jpeg',
        height: 285.0,
        width: 285.0,
        alignment: Alignment.center,
      ),
      titleTextStyle:
          const TextStyle(fontFamily: 'MyFont', color: Colors.black),
      bodyTextStyle:
          const TextStyle(fontFamily: 'MyFont', color: Colors.orange),
    ),
  ];
}
