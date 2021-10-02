import 'package:flutter/foundation.dart';

class ArgumentsProvider extends ChangeNotifier {
  final Set<String> _arguments = {};
  Set<String> get getArguments => _arguments;
  set arguments(String arg) {
    _arguments.add(arg);
    notifyListeners();
  }

  set removeArgument(String arg) {
    _arguments.remove(arg);
    notifyListeners();
  }
}
