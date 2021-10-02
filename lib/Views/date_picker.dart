import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:rive/rive.dart' as rv;

class CanopusDatePicker extends StatefulWidget {
  const CanopusDatePicker({Key? key}) : super(key: key);

  @override
  CanopusDatePickerState createState() => CanopusDatePickerState();
}

class CanopusDatePickerState extends State<CanopusDatePicker> {
  String _range = '';

  void _onSelectionChanged(DateRangePickerSelectionChangedArgs args) {
    setState(
      () {
        if (args.value is PickerDateRange) {
          _range =
              DateFormat('dd/MM/yyyy').format(args.value.startDate).toString() +
                  ' - ' +
                  DateFormat('dd/MM/yyyy')
                      .format(args.value.endDate ?? args.value.startDate)
                      .toString();
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff100414),
        title: const Text('Date Picker', style: TextStyle(fontSize: 24)),
      ),
      backgroundColor: const Color(0xff100414),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          SafeArea(
            child: GestureDetector(
              onTap: () {
                // final rand = Random().nextInt(_spaceshipAnimations.length);
                // _controllers[rand].isActive = true;
              },
              child: const SizedBox(
                width: 400,
                height: 200,
                child: rv.RiveAnimation.asset(
                  'assets/images/mars.riv',
                  // controllers: _controllers,
                ),
              ),
            ),
          ),
          Text(
            'Selected range: \n ' + _range,
            style: const TextStyle(color: Colors.orange, fontSize: 26),
          ),
          const Divider(
            height: 10,
            color: Colors.black,
            thickness: 1.1,
          ),
          Expanded(
            child: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Color(0xff100414), Colors.black],
                ),
              ),
              height: MediaQuery.of(context).size.height,
              child: SfDateRangePicker(
                selectionShape: DateRangePickerSelectionShape.rectangle,
                onSelectionChanged: _onSelectionChanged,
                confirmText: 'OKAY',
                monthCellStyle: const DateRangePickerMonthCellStyle(
                  textStyle: TextStyle(
                    color: Colors.white,
                  ),
                ),
                yearCellStyle: const DateRangePickerYearCellStyle(
                  textStyle: TextStyle(
                    color: Colors.white,
                  ),
                ),
                headerStyle: const DateRangePickerHeaderStyle(
                  textStyle: TextStyle(
                    color: Colors.white,
                  ),
                ),
                endRangeSelectionColor: Colors.red,
                rangeTextStyle: const TextStyle(color: Colors.red),
                selectionTextStyle: const TextStyle(color: Colors.white),
                selectionMode: DateRangePickerSelectionMode.range,
                maxDate: DateTime.now().subtract(const Duration(days: 2)),
                minDate: DateTime.now().subtract(const Duration(days: 366)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
