import 'package:canopus/Provider/arguments_provider.dart';
import 'package:canopus/Provider/date_provider.dart';
import 'package:canopus/Provider/maps_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CanopusProviders extends StatelessWidget {
  final Widget child;
  const CanopusProviders({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      child: child,
      providers: [
        ChangeNotifierProvider(create: (_) => MapsProvider()),
        ChangeNotifierProvider(create: (_) => ArgumentsProvider()),
        ChangeNotifierProvider(create: (_) => DateProvider()),
      ],
    );
  }
}
