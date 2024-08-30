import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jeemo_pay/ui/features/settings/setting_screen.dart';
import 'package:jeemo_pay/ui/features/user/menu_screen.dart'; // Assuming you are using GetX for navigation

class CustomHeaderBackButtonWidget extends StatelessWidget {
  final String?
      profileImageUrl; // Optional: for passing dynamic profile image URLs
  final String headerText; // Parameter for the text to display

  CustomHeaderBackButtonWidget({
    this.profileImageUrl,
    required this.headerText, // Required parameter for header text
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Container(
              width: 40.0, // Width of the circle
              height: 40.0, // Height of the circle
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white, // White background
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: Center(
                child: IconButton(
                  icon: Icon(Icons.arrow_back),
                  iconSize: 20.0, // Set the size of the button (not the image)
                  onPressed: () {
                    // Handle menu button press
                    Get.back(); // Navigate to MenuScreen
                  },
                ),
              ),
            ),
            SizedBox(width: 10), // Space between icon and text
            Text(
              headerText, // Use the parameter for the header text
              style: TextStyle(
                fontFamily: 'Roboto', // Use the BrickSans font
                fontSize: 16.0, // Adjust font size as needed
                fontWeight: FontWeight.bold, // Use bold weight if desired
                color: Colors.black, // Adjust color if needed
              ),
            ),
          ],
        ),
      ],
    );
  }
}
