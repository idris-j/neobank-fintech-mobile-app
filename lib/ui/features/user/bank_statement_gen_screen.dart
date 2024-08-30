import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; // Import for date formatting
import 'package:flutter/services.dart'; // Import for clipboard functionality
import 'package:jeemo_pay/shared/colors.dart';
import 'package:jeemo_pay/shared/text_style.dart';
import 'package:jeemo_pay/ui/widget/bottom_sheet_icon_widget.dart';
import 'package:jeemo_pay/ui/widget/custom_header_back_widget.dart';

class GenerateBankStatementScreen extends StatefulWidget {
  const GenerateBankStatementScreen({Key? key}) : super(key: key);

  @override
  _GenerateBankStatementScreenState createState() =>
      _GenerateBankStatementScreenState();
}

class _GenerateBankStatementScreenState
    extends State<GenerateBankStatementScreen> {
  DateTimeRange? _selectedDateRange;
  String _selectedFormat = 'PDF'; // Default format

  void _selectDateRange() async {
    DateTimeRange? pickedDateRange = await showDateRangePicker(
      context: context,
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
      initialDateRange: _selectedDateRange,
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData.light().copyWith(
            primaryColor: customColor,
            buttonTheme: ButtonThemeData(textTheme: ButtonTextTheme.primary),
            colorScheme:
                ColorScheme.fromSwatch().copyWith(secondary: customColor),
          ),
          child: child!,
        );
      },
    );

    if (pickedDateRange != null && pickedDateRange != _selectedDateRange) {
      setState(() {
        _selectedDateRange = pickedDateRange;
      });
    }
  }

  void _generateStatement() {
    // Implement the statement generation logic here
    // For now, just show a Snackbar as a placeholder
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
            'Generating ${_selectedFormat} statement from ${DateFormat('dd MMM yyyy').format(_selectedDateRange?.start ?? DateTime.now())} to ${DateFormat('dd MMM yyyy').format(_selectedDateRange?.end ?? DateTime.now())}'),
      ),
    );
  }

  void _showExportOptions() {
    CustomBottomIconSheet.show(
      context,
      options: [
        BottomSheetOption(
          icon: Icons.picture_as_pdf,
          title: 'PDF',
          onTap: () {
            setState(() {
              _selectedFormat = 'PDF';
            });
          },
        ),
        BottomSheetOption(
          icon: Icons.table_chart,
          title: 'Excel',
          onTap: () {
            setState(() {
              _selectedFormat = 'Excel';
            });
          },
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Custom Header
            Container(
              color: Colors.white,
              padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 20),
              child: CustomHeaderBackButtonWidget(
                headerText: "Generate Bank Statement", // Updated header text
              ),
            ),
            // Main Content
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(26.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Date Range Picker
                    Text(
                      'Select Date Range',
                      style: txStyle14.copyWith(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 8),
                    GestureDetector(
                      onTap: _selectDateRange,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 12.0,
                            horizontal: 16.0), // Adjust padding here
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8.0),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.3),
                              spreadRadius: 2,
                              blurRadius: 5,
                              offset: const Offset(0, 3),
                            ),
                          ],
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Text(
                                _selectedDateRange == null
                                    ? 'Select date range'
                                    : '${DateFormat('dd MMM yyyy').format(_selectedDateRange!.start)} - ${DateFormat('dd MMM yyyy').format(_selectedDateRange!.end)}',
                                style: txStyle12,
                              ),
                            ),
                            Icon(Icons.calendar_today, color: customColor),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),

                    // Export Format Options
                    Text(
                      'Select Export Format',
                      style: txStyle14.copyWith(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 8),
                    GestureDetector(
                      onTap: _showExportOptions, // Open bottom sheet on tap
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 12.0, horizontal: 16.0),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8.0),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.3),
                              spreadRadius: 2,
                              blurRadius: 5,
                              offset: const Offset(0, 3),
                            ),
                          ],
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              _selectedFormat,
                              style: txStyle12,
                            ),
                            Icon(Icons.arrow_drop_down, color: customColor),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 24),

                    // Generate Button
                    Center(
                      child: ElevatedButton(
                        onPressed: _generateStatement,
                        child: Text(
                          'Generate Statement',
                          style: txStyle14.copyWith(
                              color:
                                  Colors.white), // Ensure text color is white
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              customColor, // Background color of button
                          padding: const EdgeInsets.symmetric(
                              horizontal: 32, vertical: 12),
                          textStyle: txStyle14.copyWith(color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
