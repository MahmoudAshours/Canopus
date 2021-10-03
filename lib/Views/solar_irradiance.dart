import 'package:canopus/Provider/date_provider.dart';
import 'package:canopus/ViewModel/sun_3dwidget.dart';
import 'package:canopus/Views/fetching_screen.dart';
import 'package:canopus/Views/maps_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:intl/intl.dart';

class SolarIrradianceScreen extends StatefulWidget {
  const SolarIrradianceScreen({Key? key}) : super(key: key);
  @override
  SolarIrradianceScreenState createState() => SolarIrradianceScreenState();
}

class SolarIrradianceScreenState extends State<SolarIrradianceScreen> {
  late DateProvider _dateProvider;

  void _onSelectionChanged(DateRangePickerSelectionChangedArgs args) {
    if (args.value is PickerDateRange) {
      _dateProvider.startDate =
          DateFormat('yyyy').format(args.value.startDate).toString();
      _dateProvider.endDate = DateFormat('yyyy')
          .format(args.value.endDate ?? args.value.startDate)
          .toString();
    }
  }

  @override
  void didChangeDependencies() {
    _dateProvider = Provider.of<DateProvider>(context);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff100414),
        title: const Text('Solar irradiance', style: TextStyle(fontSize: 24)),
      ),
      backgroundColor: const Color(0xff100414),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          const Text(
            "Click on earth to pick your location",
            style: TextStyle(color: Colors.white),
          ),
          GestureDetector(
              onTap: () => Navigator.of(context)
                  .push(MaterialPageRoute(builder: (_) => const MapsScreen())),
              child: const SizedBox(width: 400, height: 300, child: Earth3D())),
          Text(
            'Selected range: \n ' +
                _dateProvider.getStartDate +
                '- ' +
                _dateProvider.getEndDate,
            style: const TextStyle(color: Colors.orange, fontSize: 26),
          ),
          SfDateRangePicker(
            selectionShape: DateRangePickerSelectionShape.rectangle,
            monthCellStyle: const DateRangePickerMonthCellStyle(
              textStyle: TextStyle(color: Colors.white),
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
            onSelectionChanged: _onSelectionChanged,
            endRangeSelectionColor: Colors.red,
            rangeTextStyle: const TextStyle(color: Colors.red),
            selectionTextStyle: const TextStyle(color: Colors.white),
            selectionMode: DateRangePickerSelectionMode.range,
            maxDate: DateTime.now().subtract(const Duration(days: 365 * 2)),
          ),
          _dateProvider.getStartDate.isNotEmpty &&
                  _dateProvider.getEndDate.isNotEmpty
              ? ElevatedButton(
                  onPressed: () => Navigator.of(context).push(MaterialPageRoute(
                      builder: (_) =>
                          const FetchingScreen(isSolarIrradiance: true))),
                  child: const Text('View values'))
              : const SizedBox()
        ],
      ),
    );
  }
}
