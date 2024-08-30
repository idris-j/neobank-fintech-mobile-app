import 'package:flutter/material.dart';

class LicensedAndAssuredWidget extends StatelessWidget {
  final double fontSize; // Add a fontSize parameter

  const LicensedAndAssuredWidget({
    Key? key,
    this.fontSize = 10.0, // Provide a default font size
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0), // Adjust the padding as needed
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // "Licensed by" Section
          Image.asset(
            'asset/images/external/cbn_logo.png', // Replace with your asset path
            height: 12, // Adjust size as needed
          ),
          SizedBox(width: 3), // Add spacing between the image and text
          Text(
            'Licensed by the',
            style: TextStyle(fontSize: fontSize), // Apply font size
          ),
          SizedBox(width: 1),
          Image.asset(
            'asset/images/external/cbn_text.png', // Replace with your asset path
            height: 10, // Adjust size as needed
          ),
          SizedBox(width: 0), // Add spacing between the two sections

          // "Assured by" Section
          Text(
            'Insured by',
            style: TextStyle(fontSize: fontSize), // Apply font size
          ),
          SizedBox(width: 2), // Add spacing between the text and image
          Image.asset(
            'asset/images/external/ndic_logo.png', // Replace with your asset path
            height: 11, // Adjust size as needed
          ),
        ],
      ),
    );
  }
}
