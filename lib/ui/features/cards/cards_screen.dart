import 'package:flutter/material.dart';
import 'package:jeemo_pay/ui/features/cards/add_a_card_screen.dart';
import 'package:jeemo_pay/ui/widget/custom_header_app_logo_widget.dart';
import 'package:jeemo_pay/ui/widget/scrollable_card_widget.dart';
import 'package:jeemo_pay/ui/widget/home_custom_header_widget.dart';

class WalletScreen extends StatefulWidget {
  @override
  _WalletScreenState createState() => _WalletScreenState();
}

class _WalletScreenState extends State<WalletScreen> {
  List<Map<String, String?>> cards = [
    {
      'cardNumber': "5354 5679 2342 1886",
      'expiryDate': "08/28",
      'cvv': "235",
      'cardType': "Virtual",
      'backgroundColor': "0xFF850974",
    },
    {
      'cardNumber': "1234 5678 9012 3456",
      'expiryDate': "01/24",
      'cvv': "123",
      'cardType': "Physical",
      'backgroundColor': "0xFF0057D9",
    },
    {
      'cardNumber': "6789 0123 4567 8901",
      'expiryDate': "03/25",
      'cvv': "456",
      'cardType': "Physical",
      'backgroundColor': "0xFF111111",
    },
  ];

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
            child: CustomHeaderAppLogoWidget(
              headerText: "Cards",
            ),
          ),
          Expanded(
            child: PageView(
              children: [
                ...cards.map((card) {
                  return CreditCardWidget(
                    cardNumber: card['cardNumber'],
                    expiryDate: card['expiryDate'],
                    cvv: card['cvv'],
                    cardType: card['cardType']!,
                    backgroundColor: Color(int.parse(card['backgroundColor']!)),
                  );
                }).toList(),
                GestureDetector(
                  onTap: () => _navigateToAddCardScreen(context),
                  child: CreditCardWidget(
                    cardType: "Add Card",
                    backgroundColor: const Color.fromARGB(255, 255, 255, 255),
                    isAddCard: true,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _navigateToAddCardScreen(BuildContext context) async {
    print('Navigating to AddCardScreen'); // Debugging line
    final newCard = await Navigator.push<Map<String, String>>(
      context,
      MaterialPageRoute(
        builder: (context) => AddCardScreen(),
      ),
    );

    if (newCard != null) {
      _addNewCard(newCard);
    }
  }

  void _addNewCard(Map<String, String> newCard) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {
        cards.add({
          'cardNumber': newCard['cardNumber']!,
          'expiryDate': newCard['expiryDate']!,
          'cvv': newCard['cvv']!,
          'cardType': newCard['cardType']!,
          'backgroundColor': "0xFF000000", // Default color
        });
      });
    });
  }
}
