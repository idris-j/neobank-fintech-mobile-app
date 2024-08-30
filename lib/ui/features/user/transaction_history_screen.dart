import 'package:flutter/material.dart';
import 'package:jeemo_pay/shared/colors.dart';
import 'package:jeemo_pay/ui/widget/custom_header_app_logo_widget.dart'; // Import your custom header widget

class TransactionScreen extends StatefulWidget {
  const TransactionScreen({super.key});

  @override
  _TransactionScreenState createState() => _TransactionScreenState();
}

class _TransactionScreenState extends State<TransactionScreen> {
  String _selectedStatus = 'Status';
  String _selectedCurrency = 'USD';
  DateTimeRange? _selectedDateRange;

  final List<String> _statusOptions = ['All', 'Completed', 'Pending', 'Failed'];
  final List<String> _currencyOptions = ['USD', 'EUR', 'GBP', 'JPY'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // Custom Header
          Container(
            color: Colors.white,
            padding: EdgeInsets.symmetric(vertical: 25, horizontal: 20),
            child: CustomHeaderAppLogoWidget(
              headerText: "History",
            ),
          ),
          // Filter Section
          Container(
            color: Colors.white,
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 40),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildElevatedButton(
                  text: _selectedStatus,
                  onPressed: () => _showStatusPicker(),
                ),
                _buildElevatedButton(
                  text: _selectedCurrency,
                  onPressed: () => _showCurrencyPicker(),
                ),
                _buildElevatedButton(
                  text: _selectedDateRange == null
                      ? 'Date Range'
                      : '${_selectedDateRange!.start.toLocal()} - ${_selectedDateRange!.end.toLocal()}',
                  onPressed: () => _selectDateRange(),
                ),
                IconButton(
                  icon: Icon(Icons.search, color: customColor),
                  onPressed: () {
                    // Handle search action
                    // Implement search functionality based on selected filters
                  },
                ),
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(26.0),
              child: ListView(
                children: [
                  _buildTransactionItem(
                    icon: Icons.add_circle_outline,
                    color: Colors.green,
                    description: 'Deposit from Employer',
                    amount: '+\$500.00',
                    date: '2024-08-25',
                  ),
                  _buildTransactionItem(
                    icon: Icons.remove_circle_outline,
                    color: Colors.red,
                    description: 'Payment for Groceries',
                    amount: '-\$75.00',
                    date: '2024-08-24',
                  ),
                  _buildTransactionItem(
                    icon: Icons.add_circle_outline,
                    color: Colors.green,
                    description: 'Transfer from Savings',
                    amount: '+\$200.00',
                    date: '2024-08-23',
                  ),
                  _buildTransactionItem(
                    icon: Icons.remove_circle_outline,
                    color: Colors.red,
                    description: 'Dinner with Friends',
                    amount: '-\$50.00',
                    date: '2024-08-22',
                  ),
                  // Add more transactions as needed
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildElevatedButton(
      {required String text, required VoidCallback onPressed}) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white, // White background
        elevation: 3, // Slight elevation// Optional border
        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: Colors.black, // Black text color
          fontSize: 14, // Reduced font size
        ),
      ),
    );
  }

  void _showStatusPicker() {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: _statusOptions.map((status) {
            return ListTile(
              title: Text(
                status,
                style: TextStyle(fontSize: 14), // Reduced font size
              ),
              onTap: () {
                setState(() {
                  _selectedStatus = status;
                });
                Navigator.pop(context);
              },
            );
          }).toList(),
        );
      },
    );
  }

  void _showCurrencyPicker() {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: _currencyOptions.map((currency) {
            return ListTile(
              title: Text(
                currency,
                style: TextStyle(fontSize: 14), // Reduced font size
              ),
              onTap: () {
                setState(() {
                  _selectedCurrency = currency;
                });
                Navigator.pop(context);
              },
            );
          }).toList(),
        );
      },
    );
  }

  Future<void> _selectDateRange() async {
    DateTimeRange? pickedRange = await showDateRangePicker(
      context: context,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
      initialDateRange: _selectedDateRange,
    );
    if (pickedRange != null && pickedRange != _selectedDateRange) {
      setState(() {
        _selectedDateRange = pickedRange;
      });
    }
  }

  Widget _buildTransactionItem({
    required IconData icon,
    required Color color,
    required String description,
    required String amount,
    required String date,
  }) {
    return Card(
      margin: EdgeInsets.only(bottom: 10),
      elevation: 1, // Light shadow for the card
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      child: ListTile(
        leading: Icon(icon, color: color),
        title: Text(
          description,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 14, // Reduced font size
          ),
        ),
        subtitle: Text(
          date,
          style: TextStyle(
            color: Colors.grey,
            fontSize: 12, // Reduced font size
          ),
        ),
        trailing: Text(
          amount,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: color,
            fontSize: 14, // Reduced font size
          ),
        ),
      ),
    );
  }
}
