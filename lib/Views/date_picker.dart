import 'package:canopus/Provider/date_provider.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:rive/rive.dart' as rv;

class CanopusDatePicker extends StatefulWidget {
  const CanopusDatePicker({Key? key}) : super(key: key);

  @override
  CanopusDatePickerState createState() => CanopusDatePickerState();
}

class CanopusDatePickerState extends State<CanopusDatePicker> {
  late DateProvider _dateProvider;
  void _onSelectionChanged(DateRangePickerSelectionChangedArgs args) {
    if (args.value is PickerDateRange) {
      _dateProvider.startDate =
          DateFormat('yyyy/MM/dd').format(args.value.startDate).toString();
      _dateProvider.endDate = DateFormat('yyyy/MM/dd')
          .format(args.value.endDate ?? args.value.startDate)
          .toString();
    }
  }

  @override
  Widget build(BuildContext context) {
    _dateProvider = Provider.of<DateProvider>(context);
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
          const SafeArea(
            child: SizedBox(
              width: 400,
              height: 200,
              child: rv.RiveAnimation.asset(
                'assets/images/mars.riv',
                // controllers: _controllers,
              ),
            ),
          ),
          Text(
            'Selected range: \n ' +
                _dateProvider.getStartDate +
                '- ' +
                _dateProvider.getEndDate,
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
