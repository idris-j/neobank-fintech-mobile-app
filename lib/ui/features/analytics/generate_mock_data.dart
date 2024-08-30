import 'package:fl_chart/fl_chart.dart';
import 'dart:math';

// Function to generate mock data for Cash Inflow and Cash Outflow
List<FlSpot> generateMockData(int numberOfPoints) {
  List<FlSpot> spots = [];
  Random random = Random();

  for (int i = 0; i < numberOfPoints; i++) {
    double x = i.toDouble(); // X-axis: time or index
    double y = random.nextDouble() * 1000; // Y-axis: amount
    spots.add(FlSpot(x, y));
  }

  return spots;
}
