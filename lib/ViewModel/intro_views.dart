import 'package:flutter/material.dart';
import 'package:intro_views_flutter/intro_views_flutter.dart';

class IntroViewsConstants {
  final page = [
    PageViewModel(
      pageColor: Colors.black,
      body: const Text(
        'CANOPUS brings a lot of benefits to the end-user so it can be easily interact with.',
      ),
      title: const Text('Canopus'),
      mainImage: Image.asset(
        'assets/images/canopus_logo.jpeg',
        height: 285.0,
        width: 285.0,
        alignment: Alignment.center,
      ),
      titleTextStyle: const TextStyle(fontFamily: 'wave', color: Colors.orange),
      bodyTextStyle: const TextStyle(color: Colors.orange),
    ),
    PageViewModel(
      pageColor: const Color(0xffFFAE00),
      iconImageAssetPath: 'assets/images/coffee_space.gif',
      body: const Text(
        'The main challenge is seeking historical data: to enable more informed solar panel purchasing decisions for homeowners.',
      ),
      title: const Text('Historical data'),
      mainImage: Image.asset(
        'assets/images/coffee_space.gif',
        height: 285.0,
        width: 285.0,
        alignment: Alignment.center,
      ),
      titleTextStyle: const TextStyle(color: Colors.black),
      bodyTextStyle: const TextStyle(color: Colors.black),
    ),
    PageViewModel(
      pageColor: Colors.white,
      iconImageAssetPath: 'assets/images/renewable_energy.jpeg',
      body: const Text(
        'CANOPUS was created to assist users all around the world in becoming more environmentally conscious and mindful of their energy usage throughout the day.',
      ),
      title: const Text('SUN IS FUN'),
      mainImage: Image.asset(
        'assets/images/renewable_energy.jpeg',
        height: 285.0,
        width: 285.0,
        alignment: Alignment.center,
      ),
      titleTextStyle: const TextStyle(color: Colors.black),
      bodyTextStyle: const TextStyle(color: Colors.orange),
    ),
    PageViewModel(
      pageColor: const Color(0xff0E0413),
      body: const Text(
        'First you need to specify your longitude and latitude through the location page.',
      ),
      title: const Text('Location'),
      mainImage: Image.asset(
        'assets/images/intro_steps/location.png',
        height: 285.0,
        width: 285.0,
        alignment: Alignment.center,
      ),
      titleTextStyle: const TextStyle(color: Colors.orange),
      bodyTextStyle: const TextStyle(color: Colors.orange),
    ),
    PageViewModel(
      pageColor: const Color(0xff0E0413),
      body: const Text(
        'Then you need to specify your date range.',
      ),
      title: const Text('Date'),
      mainImage: Image.asset(
        'assets/images/intro_steps/date.png',
        height: 285.0,
        width: 285.0,
        alignment: Alignment.center,
      ),
      titleTextStyle: const TextStyle(color: Colors.orange),
      bodyTextStyle: const TextStyle(color: Colors.orange),
    ),
    PageViewModel(
      pageColor: const Color(0xff0E0413),
      body: const Text(
        'Then you need to specify the parameters you want to fetch from NASA API.',
      ),
      title: const Text('Parameters'),
      mainImage: Image.asset(
        'assets/images/intro_steps/parameters.png',
        height: 285.0,
        width: 285.0,
        alignment: Alignment.center,
      ),
      titleTextStyle: const TextStyle(color: Colors.orange),
      bodyTextStyle: const TextStyle(color: Colors.orange),
    ),
    PageViewModel(
      pageColor: const Color(0xff0E0413),
      body: const Text(
        'Then Calculate button will appear to show you the data.',
      ),
      title: const Text('Calculate'),
      mainImage: Image.asset(
        'assets/images/intro_steps/calculate.png',
        height: 285.0,
        width: 285.0,
        alignment: Alignment.center,
      ),
      titleTextStyle: const TextStyle(color: Colors.orange),
      bodyTextStyle: const TextStyle(color: Colors.orange),
    ),
    PageViewModel(
      pageColor: const Color(0xff0E0413),
      body: const Text(
        'You can view the solar energy (irradiance) data from the solar energy button',
      ),
      title: const Text('Solar irradiance'),
      mainImage: Image.asset(
        'assets/images/intro_steps/solar_energy.png',
        height: 285.0,
        width: 285.0,
        alignment: Alignment.center,
      ),
      titleTextStyle: const TextStyle(color: Colors.orange),
      bodyTextStyle: const TextStyle(color: Colors.orange),
    ),
    PageViewModel(
      pageColor: const Color(0xff0E0413),
      body: const Text(
        'You can check more about solar panels from solar panels screen!.',
      ),
      title: const Text('Solar Panels'),
      mainImage: Image.asset(
        'assets/images/intro_steps/solar_panels.png',
        height: 285.0,
        width: 285.0,
        alignment: Alignment.center,
      ),
      titleTextStyle: const TextStyle(color: Colors.orange),
      bodyTextStyle: const TextStyle(color: Colors.orange),
    ),
  ];
}
