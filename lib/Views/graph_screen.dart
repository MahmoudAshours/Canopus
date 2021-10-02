import 'package:canopus/Utils/date_formater.dart';
import 'package:flutter/material.dart';
import 'package:flutter_snake_navigationbar/flutter_snake_navigationbar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class GraphScreen extends StatefulWidget {
  final Map<String, num>? value;
  final String? name;

  const GraphScreen({Key? key, required this.value, this.name})
      : super(key: key);

  @override
  State<GraphScreen> createState() => _GraphScreenState();
}

class _GraphScreenState extends State<GraphScreen> {
  int _currentIndex = 0;

  late List<ChartSeries<String, String>> _graphTypes;
  @override
  void initState() {
    _graphTypes = [
      GraphTypes(widget.value!, widget.name!).fastLine(),
      GraphTypes(widget.value!, widget.name!).barChart(),
      GraphTypes(widget.value!, widget.name!).scatterChart(),
      GraphTypes(widget.value!, widget.name!).areaChart(),
      GraphTypes(widget.value!, widget.name!).bubbleChart(),
      GraphTypes(widget.value!, widget.name!).waterfall(),
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff100414),
      ),
      bottomNavigationBar: SnakeNavigationBar.color(
        behaviour: SnakeBarBehaviour.floating,
        snakeShape: SnakeShape.indicator,
        snakeViewColor: Colors.orange,
        unselectedItemColor: Colors.blueGrey,
        showSelectedLabels: true,
        currentIndex: _currentIndex,
        backgroundColor: const Color(0xff100414),
        onTap: (index) => setState(() => _currentIndex = index),
        items: const [
          BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.chartLine, color: Colors.orange),
          ),
          BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.chartBar, color: Colors.orange),
          ),
          BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.dotCircle, color: Colors.orange),
          ),
          BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.chartArea, color: Colors.orange),
          ),
          BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.soap, color: Colors.orange),
          ),
          BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.water, color: Colors.orange),
          ),
        ],
      ),
      backgroundColor: const Color(0xff100414),
      body: SfCartesianChart(
        primaryXAxis: CategoryAxis(
          majorGridLines: const MajorGridLines(width: 0),
          minorGridLines: const MinorGridLines(width: 0),
          majorTickLines: const MajorTickLines(width: 0),
          interval: 3,
          autoScrollingMode: AutoScrollingMode.start,
        ),
        zoomPanBehavior: ZoomPanBehavior(
          enableDoubleTapZooming: true,
          enableSelectionZooming: true,
          enablePanning: true,
        ),
        legend: Legend(isVisible: true, backgroundColor: Colors.orange),
        title: ChartTitle(
            text: '${widget.name} graph',
            textStyle: const TextStyle(color: Colors.red)),
        tooltipBehavior: TooltipBehavior(enable: true, color: Colors.red),
        series: <ChartSeries<String, String>>[_graphTypes[_currentIndex]],
      ),
    );
  }
}

class GraphTypes {
  final Map<String, num> value;
  final String name;
  GraphTypes(this.value, this.name);
  ChartSeries<String, String> fastLine() {
    return FastLineSeries<String, String>(
      color: Colors.blueAccent,
      dataSource: value.keys.toList(),
      xValueMapper: (sales, _) => dateFormater(sales),
      yValueMapper: (sales, _) => value[sales],
      name: name,
      legendItemText: 'Line chart',
    );
  }

  ChartSeries<String, String> barChart() {
    return BarSeries<String, String>(
        color: Colors.blueAccent,
        dataSource: value.keys.toList(),
        xValueMapper: (sales, _) => dateFormater(sales),
        yValueMapper: (sales, _) => value[sales],
        name: name,
        legendItemText: 'Bar chart');
  }

  ChartSeries<String, String> scatterChart() {
    return ScatterSeries<String, String>(
        color: Colors.blueAccent,
        dataSource: value.keys.toList(),
        xValueMapper: (sales, _) => dateFormater(sales),
        yValueMapper: (sales, _) => value[sales],
        name: name,
        legendItemText: 'Scatter chart');
  }

  ChartSeries<String, String> areaChart() {
    return AreaSeries<String, String>(
        color: Colors.blueAccent,
        dataSource: value.keys.toList(),
        xValueMapper: (sales, _) => dateFormater(sales),
        yValueMapper: (sales, _) => value[sales],
        name: name,
        legendItemText: 'Area chart');
  }

  ChartSeries<String, String> bubbleChart() {
    return BubbleSeries<String, String>(
        color: Colors.blueAccent,
        dataSource: value.keys.toList(),
        xValueMapper: (sales, _) => dateFormater(sales),
        yValueMapper: (sales, _) => value[sales],
        name: name,
        legendItemText: 'Bubble chart');
  }

  ChartSeries<String, String> waterfall() {
    return WaterfallSeries<String, String>(
        color: Colors.blueAccent,
        dataSource: value.keys.toList(),
        xValueMapper: (sales, _) => dateFormater(sales),
        yValueMapper: (sales, _) => value[sales],
        name: name,
        legendItemText: 'Waterfall chart');
  }

  ChartSeries<String, String> stepArea() {
    return StepAreaSeries<String, String>(
        color: Colors.blueAccent,
        dataSource: value.keys.toList(),
        xValueMapper: (sales, _) => dateFormater(sales),
        yValueMapper: (sales, _) => value[sales],
        name: name,
        legendItemText: 'Step Area chart');
  }
}
