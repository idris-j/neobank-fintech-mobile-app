import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jeemo_pay/ui/features/settings/setting_screen.dart';
import 'package:jeemo_pay/ui/features/user/menu_screen.dart'; // Assuming you are using GetX for navigation

class HomeCustomHeaderWidget extends StatelessWidget {
  final String?
      profileImageUrl; // Optional: for passing dynamic profile image URLs

  HomeCustomHeaderWidget({this.profileImageUrl});

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
                  icon: Image.asset(
                    'asset/images/jeemo_pay_icon.png', // Path to your image asset
                    fit: BoxFit.contain,
                    width: 20.0, // Set the size of the image here
                    height: 20.0, // Set the size of the image here
                  ),
                  iconSize: 20.0, // Set the size of the button (not the image)
                  onPressed: () {
                    // Handle menu button press
                    Get.to(() => MenuScreen()); // Navigate to MenuScreen
                  },
                ),
              ),
            ),
            SizedBox(width: 10), // Space between icon and text
            Text(
              "jeemo.io",
              style: TextStyle(
                fontFamily: 'Roboto', // Use the BrickSans font
                fontSize: 16.0, // Adjust font size as needed
                fontWeight: FontWeight.bold, // Use bold weight if desired
                color: Colors.black, // Adjust color if needed
              ),
            ),
          ],
        ),
        GestureDetector(
          onTap: () {
            Get.to(() => SettingScreen());
          },
          child: CircleAvatar(
            radius: 25,
            backgroundImage: NetworkImage(
              profileImageUrl ??
                  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSwsArWf2lZuLGqco6QoGM13keJb078XIgNWA&usqp=CAU",
            ),
          ),
        ),
      ],
    );
  }
}
