import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:jeemo_pay/shared/colors.dart';
import 'package:jeemo_pay/ui/features/transfer_funds/send_money_screen.dart';
import 'package:jeemo_pay/ui/features/user/bank_statement_gen_screen.dart';
import 'package:jeemo_pay/ui/features/user/user_bank_details_screen.dart'; // Import the UserBankDetailsScreen

class PopupMenuWidget extends StatelessWidget {
  final void Function(String) onSelected;

  const PopupMenuWidget({Key? key, required this.onSelected}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<String>(
      icon: Icon(
        Icons.more_horiz,
        color: customColor, // Change to your desired color
        size: 20, // Adjust size as needed
      ),
      color: const Color(0xFF333333), // Dark grey background
      shape: const RoundedRectangleBorder(
        borderRadius:
            BorderRadius.all(Radius.circular(15)), // Added border radius
      ),
      onSelected: (value) {
        // Handle the selection here
        switch (value) {
          case 'Bank Details':
            Get.to(() =>
                const UserBankDetailsScreen()); // Navigate to UserBankDetailsScreen
            break;
          case 'Transaction Statement':
            // Navigate to the Transaction Statement screen
            // Example: Get.to(() => TransactionStatementScreen());
            Get.to(() =>
                const GenerateBankStatementScreen()); // Navigate to GenerateBankStatementScreen
            break;
          case 'Live Exchange Rates':
            // Navigate to the Live Exchange Rates screen
            // Example: Get.to(() => CurrencyConverterScreen());
            Get.to(() =>
                const SendMoneyScreen()); // Navigate to UserBankDetailsScreen
            break;
          case 'Add New Account':
            // Navigate to the Add New Account screen
            // Example: Get.to(() => AddNewAccountScreen());
            Get.to(() =>
                const UserBankDetailsScreen()); // Navigate to UserBankDetailsScreen
            break;
        }
      },
      itemBuilder: (BuildContext context) => [
        PopupMenuItem(
          value: 'Bank Details',
          child: Row(
            children: [
              const Icon(
                Icons.account_balance,
                color: Colors.white,
                size: 18, // Adjust size as needed
              ),
              const SizedBox(width: 10), // Horizontal space
              const Text(
                'Bank Details',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14, // Adjust font size as needed
                ),
              ),
            ],
          ),
        ),
        PopupMenuItem(
          value: 'Transaction Statement',
          child: Row(
            children: [
              const Icon(
                Icons.receipt_long,
                color: Colors.white,
                size: 18, // Adjust size as needed
              ),
              const SizedBox(width: 10), // Horizontal space
              const Text(
                'Transaction Statement',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14, // Adjust font size as needed
                ),
              ),
            ],
          ),
        ),
        PopupMenuItem(
          value: 'Live Exchange Rates',
          child: Row(
            children: [
              const Icon(
                Icons.currency_exchange,
                color: Colors.white,
                size: 18, // Adjust size as needed
              ),
              const SizedBox(width: 10), // Horizontal space
              const Text(
                'Live Exchange Rates',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14, // Adjust font size as needed
                ),
              ),
            ],
          ),
        ),
        PopupMenuItem(
          value: 'Add New Account',
          child: Row(
            children: [
              const Icon(
                Icons.account_circle,
                color: Colors.white,
                size: 18, // Adjust size as needed
              ),
              const SizedBox(width: 10), // Horizontal space
              const Text(
                'Add New Account',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14, // Adjust font size as needed
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
