import 'package:flutter/material.dart';
import 'package:jeemo_pay/ui/widget/custom_header_wallet_widget.dart';
import 'package:jeemo_pay/ui/widget/scrollable_card_widget.dart';
import 'package:jeemo_pay/ui/widget/custom_header_jeemo_widget.dart'; // Import your custom header widget

class WalletScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      body: Column(
        children: [
          // Custom Header similar to the HomeScreen
          Container(
            color: Colors.white,
            padding: EdgeInsets.symmetric(vertical: 25, horizontal: 20),
            child: CustomHeaderWalletWidget(
              headerText: "Cards",
            ), // Ensure your custom header has the correct styling
          ),
          Expanded(
            child: PageView(
              children: [
                CreditCardWidget(
                  cardNumber: "5354 5679 2342 1886",
                  expiryDate: "08/28",
                  cvv: "235",
                  cardType: "Virtual",
                  backgroundColor:
                      Color.fromARGB(255, 133, 9, 116), // Your color
                ),
                CreditCardWidget(
                  cardNumber: "1234 5678 9012 3456",
                  expiryDate: "01/24",
                  cvv: "123",
                  cardType: "Physical",
                  backgroundColor: Color(0xFF0057D9), // Example blue color
                ),
                CreditCardWidget(
                  cardNumber: "6789 0123 4567 8901",
                  expiryDate: "03/25",
                  cvv: "456",
                  cardType: "Physical",
                  backgroundColor: Color(0xFF111111), // Example black color
                ),
                CreditCardWidget(
                  cardType: "Add Card",
                  backgroundColor: const Color.fromARGB(255, 255, 255,
                      255), // Grey color for the "Add a Card" option
                  isAddCard: true,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
