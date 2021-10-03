import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:canopus/Provider/arguments_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rive/rive.dart' as rv;

class ParamaterScreen extends StatefulWidget {
  const ParamaterScreen({Key? key}) : super(key: key);
  @override
  ParamaterScreenState createState() => ParamaterScreenState();
}

class ParamaterScreenState extends State<ParamaterScreen> {
  static const List<Map<String, String>> _paramaters = [
    {"Relative Humidity": "RH2M"},
    {"Temperature": "T2M_MAX"},
    {"Wind Speed": "WS10M_MAX"},
  ];

  @override
  Widget build(BuildContext context) {
    final _argumentsProvider = Provider.of<ArgumentsProvider>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff100414),
        title: const Text('Paramaters', style: TextStyle(fontSize: 24)),
      ),
      backgroundColor: const Color(0xff100414),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          const SafeArea(
            child: SizedBox(
              width: 400,
              height: 200,
              child: rv.RiveAnimation.asset(
                'assets/images/robo.riv',
                // controllers: _controllers,
              ),
            ),
          ),
          Expanded(
            child: Container(
              child: GridView.count(
                crossAxisCount: 2,
                mainAxisSpacing: 10,
                crossAxisSpacing: 40,
                childAspectRatio: 2.6,
                children: _paramaters
                    .map(
                      (entry) => GestureDetector(
                        onTap: () => _argumentsProvider.getArguments
                                .contains(entry.values.first)
                            ? _argumentsProvider.removeArgument =
                                entry.values.first
                            : _argumentsProvider.arguments = entry.values.first,
                        child: Card(
                          shape: const StadiumBorder(),
                          child: AnimatedContainer(
                            duration: const Duration(seconds: 1),
                            color: _argumentsProvider.getArguments
                                    .contains(entry.values.first)
                                ? Colors.orange
                                : Colors.white,
                            child: Center(
                              child: Text(
                                entry.keys.first,
                                style: TextStyle(
                                    fontFamily: 'wave',
                                    color: _argumentsProvider.getArguments
                                            .contains(entry.values.first)
                                        ? Colors.white
                                        : Colors.black,
                                    fontSize: 24,
                                    fontWeight: FontWeight.w800),
                              ),
                            ),
                          ),
                        ),
                      ),
                    )
                    .toList(),
              ),
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Color(0xff100414), Colors.black],
                ),
              ),
              height: MediaQuery.of(context).size.height,
            ),
          ),
        ],
      ),
    );
  }
}
