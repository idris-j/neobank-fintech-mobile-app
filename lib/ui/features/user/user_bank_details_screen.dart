import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jeemo_pay/shared/colors.dart';
import 'package:jeemo_pay/shared/text_style.dart';
import 'package:jeemo_pay/ui/features/transfer_funds/send_money_screen.dart';
import 'package:jeemo_pay/ui/features/user/bank_statement_gen_screen.dart';
import 'package:jeemo_pay/ui/widget/custom_header_back_widget.dart'; // Import the custom header widget
import 'package:flutter/services.dart'; // Import for clipboard functionality

class UserBankDetailsScreen extends StatelessWidget {
  const UserBankDetailsScreen({Key? key}) : super(key: key);

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
                headerText: "Bank Details", // Updated header text
              ),
            ),
            // Bank Details Content
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Bank Details Section
                    _buildSectionTitle('Bank Information'),
                    const SizedBox(height: 0),
                    _buildDetailRowWithCopy(
                        context, 'Bank Name', 'Jeemo Microfinance Bank'),
                    _buildDetailRowWithCopy(
                        context, 'Account Number', '8159344489'),
                    _buildDetailRow('Account Type', 'Savings'),
                    _buildDetailRow('Branch', 'Victoria Island, Lagos'),
                    const Divider(height: 32, color: Colors.grey),

                    // Account Holder Information Section
                    _buildSectionTitle('Account Holder Information'),
                    const SizedBox(height: 0),
                    _buildDetailRowWithCopy(
                        context, 'Account Holder Name', 'Idris Jimoh'),
                    _buildDetailRow('Phone Number', '+234 815 934 4489'),
                    _buildDetailRow('Email Address', 'idris.jimoh@jeemo.io'),
                    const Divider(height: 32, color: Colors.grey),

                    // Actions Section
                    _buildSectionTitle('Quick Links'),
                    const SizedBox(height: 16),
                    _buildActionRow(
                      icon: Icons.add_circle_outline,
                      text: 'Add New Account',
                      onTap: () {
                        // Implement Add New Account functionality
                      },
                    ),
                    _buildActionRow(
                      icon: Icons.swap_horiz,
                      text: 'Transfer Funds',
                      onTap: () {
                        // Implement Transfer Funds functionality
                        Get.to(SendMoneyScreen());
                      },
                    ),
                    _buildActionRow(
                      icon: Icons.request_quote_outlined,
                      text: 'View Statement',
                      onTap: () {
                        Get.to(GenerateBankStatementScreen());
                        // Implement View Transaction Statement functionality
                      },
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

  // Widget to build section titles
  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style:
          txStyle14.copyWith(fontWeight: FontWeight.bold, color: Colors.black),
    );
  }

  // Widget to build rows of details with copy functionality
  Widget _buildDetailRowWithCopy(
      BuildContext context, String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: txStyle12.copyWith(color: Colors.grey[700])),
          Row(
            children: [
              Text(value, style: txStyle12.copyWith(color: Colors.black)),
              const SizedBox(width: 0),
              IconButton(
                icon: Icon(Icons.copy, color: customColor, size: 15),
                onPressed: () {
                  Clipboard.setData(ClipboardData(text: value));
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('$label copied to clipboard')),
                  );
                },
              ),
            ],
          ),
        ],
      ),
    );
  }

  // Widget to build rows of details without copy functionality
  Widget _buildDetailRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: txStyle12.copyWith(color: Colors.grey[700])),
          Text(value, style: txStyle12.copyWith(color: Colors.black)),
        ],
      ),
    );
  }

  // Widget to build action buttons
  Widget _buildActionRow(
      {required IconData icon,
      required String text,
      required VoidCallback onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
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
        margin: const EdgeInsets.symmetric(vertical: 8.0),
        child: Row(
          children: [
            Icon(icon, color: customColor),
            const SizedBox(width: 16),
            Text(text, style: txStyle14.copyWith(color: Colors.black)),
          ],
        ),
      ),
    );
  }
}
