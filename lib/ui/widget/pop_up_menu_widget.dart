import 'package:flutter/material.dart';
import 'package:jeemo_pay/shared/colors.dart';

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
      color: Color(0xFF333333), // Dark grey background
      shape: RoundedRectangleBorder(
        borderRadius:
            BorderRadius.all(Radius.circular(15)), // Added border radius
      ),
      onSelected: onSelected,
      itemBuilder: (BuildContext context) => [
        PopupMenuItem(
          value: 'Bank Details',
          child: Row(
            children: [
              Icon(
                Icons.account_balance,
                color: Colors.white,
                size: 18, // Adjust size as needed
              ),
              SizedBox(width: 10), // Horizontal space
              Text(
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
              Icon(
                Icons.receipt_long,
                color: Colors.white,
                size: 18, // Adjust size as needed
              ),
              SizedBox(width: 10), // Horizontal space
              Text(
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
          value: 'Currency Converter',
          child: Row(
            children: [
              Icon(
                Icons.currency_exchange,
                color: Colors.white,
                size: 18, // Adjust size as needed
              ),
              SizedBox(width: 10), // Horizontal space
              Text(
                'Currency Converter',
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
              Icon(
                Icons.account_circle,
                color: Colors.white,
                size: 18, // Adjust size as needed
              ),
              SizedBox(width: 10), // Horizontal space
              Text(
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
