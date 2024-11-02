import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ScrollableBalanceWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "My Accounts",
            style: TextStyle(
                fontSize: 12,
                color: const Color.fromARGB(
                    255, 0, 0, 0)), // Adjust style as needed
          ),
          SizedBox(height: 5),
          Container(
            height: 100, // Adjust height as needed
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                _buildHorizontalContainer(
                    "",
                    "3500000",
                    "NGN",
                    Icons.tag_faces,
                    Color.fromARGB(255, 0, 0, 0),
                    Color.fromARGB(255, 255, 255, 255)),
                _buildHorizontalContainer(
                    "",
                    "125000",
                    "GBP",
                    Icons.currency_pound,
                    Colors.lightGreen,
                    const Color.fromARGB(255, 255, 255, 255)),
                _buildHorizontalContainer("", "7500", "GHC", Icons.attach_money,
                    Color.fromARGB(255, 144, 49, 49), Colors.white),
                _buildHorizontalContainer("Add an account", "", "", Icons.add,
                    const Color.fromARGB(255, 255, 255, 255)!, Colors.black,
                    isAddAccount: true),
              ],
            ),
          ),
          SizedBox(height: 10),
          // Add additional widgets if needed
        ],
      ),
    );
  }

  Widget _buildHorizontalContainer(
      String title,
      String amount,
      String currencyCode,
      IconData icon,
      Color backgroundColor,
      Color amountTextColor,
      {bool isAddAccount = false}) {
    return Container(
      width: 205, // Adjust width if needed
      margin: EdgeInsets.only(right: 15), // Spacing between containers
      child: Material(
        color: backgroundColor, // Set the background color here
        borderRadius: BorderRadius.circular(10),
        child: Container(
          padding: EdgeInsets.all(15),
          child: isAddAccount
              ? Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        icon,
                        size: 30, // Size of the icon
                        color: Colors.black, // Color of the icon
                      ),
                      SizedBox(height: 5), // Space between icon and text
                      Text(
                        title,
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.black, // Color of the text
                        ),
                      ),
                    ],
                  ),
                )
              : Row(
                  children: [
                    CircleAvatar(
                      radius: 12, // Radius of the circular icon
                      backgroundColor:
                          Colors.grey[200], // Background color of the circle
                      child: Icon(
                        icon,
                        size: 16, // Size of the icon
                        color: Colors.black, // Color of the icon
                      ),
                    ),
                    SizedBox(width: 10), // Space between icon and text
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title,
                          style: TextStyle(
                              fontSize: 12,
                              color: Colors.black), // Color of the title text
                        ),
                        SizedBox(
                            height: 10), // Adjust height to move figures down
                        Text(
                          convertStringToCurrency(
                              amount, currencyCode), // Format the amount
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color:
                                  amountTextColor), // Use provided amount text color
                        ),
                      ],
                    ),
                  ],
                ),
        ),
      ),
    );
  }

  // Function to convert string to currency format based on currency code
  String convertStringToCurrency(String value, String currencyCode) {
    final number = double.tryParse(value);
    final format = NumberFormat.simpleCurrency(name: currencyCode);
    return format.format(number ?? 0);
  }
}
