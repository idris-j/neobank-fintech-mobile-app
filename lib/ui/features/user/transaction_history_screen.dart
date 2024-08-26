import 'package:flutter/material.dart';

class TransactionScreen extends StatelessWidget {
  const TransactionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
            Text('Recent Transactions', style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
        elevation: 0, // Remove shadow
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
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
    );
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
        title: Text(description, style: TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(date, style: TextStyle(color: Colors.grey)),
        trailing: Text(amount,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: color,
            )),
      ),
    );
  }
}
