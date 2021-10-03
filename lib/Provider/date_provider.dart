import 'package:flutter/foundation.dart';

class DateProvider extends ChangeNotifier {
  String _startDate = "";
  String _endDate = "";

  String get getStartDate => _startDate;
  String get getEndDate => _endDate;

  set startDate(String startDate) {
    _startDate = startDate;
    notifyListeners();
  }

  set endDate(String endDate) {
    _endDate = endDate;
    notifyListeners();
  }
}
