import 'package:flutter/material.dart';
import 'package:jeemo_pay/shared/colors.dart';

class MenuScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: Colors.white, // Set your desired color here
        elevation:
            4.0, // Optional: Adjust the elevation to create a shadow effect
      ),
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.all(16.0),
          children: [
            CategorySection(
              title: "Manage finances",
              items: [
                {"title": "Link your cards", "icon": Icons.account_balance},
                {"title": "Add accounts", "icon": Icons.add_card},
              ],
            ),
            SizedBox(height: 16.0),
            CategorySection(
              title: "Send and pay",
              items: [
                {
                  "title": "To another Jeemo Account",
                  "icon": Icons.account_circle_outlined
                },
                {
                  "title": "To bank account",
                  "icon": Icons.account_balance_outlined
                },
                {"title": "Cash pickup", "icon": Icons.attach_money_outlined},
                {"title": "Pay your bills", "icon": Icons.poll_outlined},
                {
                  "title": "In person & QR Code",
                  "icon": Icons.document_scanner_outlined
                },
                {"title": "Donate", "icon": Icons.favorite_outlined},
              ],
            ),
            SizedBox(height: 16.0),
            CategorySection(
              title: "Get paid",
              items: [
                {
                  "title": "Request money",
                  "icon": Icons.request_quote_outlined
                },
                {"title": "Seller QR code", "icon": Icons.qr_code_scanner},
                {
                  "title": "Raise money",
                  "icon": Icons.monetization_on_outlined
                },
              ],
            ),
            SizedBox(height: 16.0),
            CategorySection(
              title: "International services",
              items: [
                {
                  "title": "International transfers",
                  "icon": Icons.currency_exchange
                },
                {
                  "title": "Live exchange rates",
                  "icon": Icons.ramp_right_rounded
                },
                {
                  "title": "International cash pickup",
                  "icon": Icons.wallet_travel
                },
              ],
            ),
            SizedBox(height: 16.0),
            CategorySection(
              title: "Profile and help centre",
              items: [
                {"title": "Your profile", "icon": Icons.person_outlined},
                {"title": "Your cards", "icon": Icons.wallet_outlined},
                {"title": "Help centre", "icon": Icons.help_outlined},
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class CategorySection extends StatelessWidget {
  final String title;
  final List<Map<String, dynamic>> items;

  const CategorySection({
    Key? key,
    required this.title,
    required this.items,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 3,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.all(16.0),
            child: Text(
              title,
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                    fontSize: 14.0, // Reduced font size for the category title
                  ),
            ),
          ),
          Column(
            children: items.map((item) {
              return ListTile(
                leading: Icon(
                  item['icon'],
                  size: 18.0, // Reduced size for the icon
                  color: Theme.of(context).iconTheme.color,
                ),
                title: Text(
                  item['title'],
                  style: TextStyle(
                    fontSize: 13.0, // Reduced font size for the ListTile title
                    fontFamily: 'Roboto', // Using the Roboto font family
                  ),
                ),
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                onTap: () {
                  // Handle tap here
                },
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
