import 'package:flutter/material.dart';

class LicensedAndAssuredWidget extends StatelessWidget {
  const LicensedAndAssuredWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0), // Adjust the padding as needed
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // "Licensed by" Section
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'asset/images/external/cbn_logo.png', // Replace with your asset path
                height: 24, // Adjust size as needed
              ),
              SizedBox(width: 8), // Add spacing between the image and text
              Text('Licensed by'),
              SizedBox(width: 8),
              Image.asset(
                'asset/images/external/cbn_text.png', // Replace with your asset path
                height: 24, // Adjust size as needed
              ),
            ],
          ),
          SizedBox(height: 8), // Add vertical spacing between sections

          // "Assured by" Section
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Assured by'),
              SizedBox(width: 8), // Add spacing between the text and image
              Image.asset(
                'asset/images/external/ndic_logo.png', // Replace with your asset path
                height: 24, // Adjust size as needed
              ),
            ],
          ),
        ],
      ),
    );
  }
}
