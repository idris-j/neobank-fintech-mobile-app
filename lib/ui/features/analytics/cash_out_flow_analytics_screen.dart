import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:jeemo_pay/ui/features/analytics/generate_mock_data.dart';
import 'package:jeemo_pay/ui/features/analytics/line_chart_widget.dart';

class CashOutflowScreen extends StatelessWidget {
  const CashOutflowScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Generate mock data
    final List<FlSpot> mockOutflowData = generateMockData(30);

    return Scaffold(
      appBar: AppBar(
        title: Text('Cash Outflow Analytics'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: LineChartWidget(
          spots: mockOutflowData,
          title: 'Cash Outflow',
        ),
      ),
    );
  }
}
