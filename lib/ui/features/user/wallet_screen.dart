import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jeemo_pay/ui/features/collect_payment/collect_payment_screen.dart';
import 'package:jeemo_pay/ui/features/home/home_screen.dart';
import 'package:jeemo_pay/ui/features/transfer_funds/send_money_screen.dart';
import 'package:jeemo_pay/ui/features/user/transaction_history_screen.dart';
import 'package:jeemo_pay/ui/features/user/user_account_screen.dart';
import 'package:jeemo_pay/shared/colors.dart'; // Adjust this import based on your file structure
import 'package:jeemo_pay/shared/sizeConfig.dart'; // Adjust this import based on your file structure
import 'package:jeemo_pay/shared/text_style.dart'; // Adjust this import based on your file structure

class WalletScreen extends StatefulWidget {
  const WalletScreen({super.key});

  @override
  _WalletScreenState createState() => _WalletScreenState();
}

class _WalletScreenState extends State<WalletScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Wallet', style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
        elevation: 0, // Remove shadow
        actions: [
          IconButton(
            icon: Icon(Icons.add, color: Colors.black),
            onPressed: () {
              // Navigate to AddCardScreen
              Get.to(() => AddCardScreen());
            },
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSectionTitle('Bank Accounts'),
            SizedBox(height: 10),
            _buildBankAccountCard('Revolut Account', '1234 5678 9101 1121',
                '12/24', '123', 'GBP', Icons.credit_card),
            SizedBox(height: 10),
            _buildBankAccountCard('Lloyds Account', '9876 5432 1098 7654',
                '08/25', '456', 'USD', Icons.credit_card),
            SizedBox(height: 20),
            _buildSectionTitle('Cards'),
            SizedBox(height: 10),
            _buildCard(
                'MasterCard', '1234 5678 9101 1121', '12/24', '123', 'GBP'),
            SizedBox(height: 10),
            _buildCard(
                'Visa Card', '4321 8765 2109 8765', '11/23', '456', 'USD'),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
        color: Colors.black,
      ),
    );
  }

  Widget _buildBankAccountCard(String bankName, String accountNumber,
      String expirationDate, String cvv, String currencyCode, IconData icon) {
    return Material(
      elevation: 2, // Light shadow for card
      borderRadius: BorderRadius.circular(10),
      child: Container(
        padding: EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            Icon(icon, size: 40, color: appPrimaryColor),
            SizedBox(width: 15),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(bankName,
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
                  SizedBox(height: 5),
                  Text('Account Number: $accountNumber',
                      style: TextStyle(fontSize: 12, color: Colors.grey)),
                  SizedBox(height: 5),
                  Text('Currency: $currencyCode',
                      style: TextStyle(fontSize: 12, color: Colors.grey)),
                ],
              ),
            ),
            SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text('Exp: $expirationDate',
                    style: TextStyle(fontSize: 12, color: Colors.grey)),
                Text('CVV: $cvv',
                    style: TextStyle(fontSize: 12, color: Colors.grey)),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCard(String cardName, String cardNumber, String expirationDate,
      String cvv, String currencyCode) {
    return Material(
      elevation: 2, // Light shadow for card
      borderRadius: BorderRadius.circular(10),
      child: Container(
        padding: EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  cardName,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Icon(Icons.credit_card, size: 30, color: appPrimaryColor),
              ],
            ),
            SizedBox(height: 10),
            Text(
              'Card Number: $cardNumber',
              style: TextStyle(fontSize: 16, letterSpacing: 2),
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Exp: $expirationDate',
                    style: TextStyle(fontSize: 14, color: Colors.grey)),
                Text('CVV: $cvv',
                    style: TextStyle(fontSize: 14, color: Colors.grey)),
                Text('Currency: $currencyCode',
                    style: TextStyle(fontSize: 14, color: Colors.grey)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class AddCardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add New Card/Bank'),
        backgroundColor: Colors.white,
        elevation: 0, // Remove shadow
      ),
      body: Center(
        child: Text('Add Card/Bank Screen'),
      ),
    );
  }
}
