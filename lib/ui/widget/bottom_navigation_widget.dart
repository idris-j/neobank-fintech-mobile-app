import 'package:flutter/material.dart';
import 'package:jeemo_pay/shared/colors.dart';
import 'package:jeemo_pay/ui/widget/bottom_assurance_widget.dart';

class BottomNavigationWidget extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onItemTapped;

  const BottomNavigationWidget({
    super.key,
    required this.selectedIndex,
    required this.onItemTapped,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize
          .min, // Ensures that the column only takes up as much vertical space as needed
      children: [
        const LicensedAndAssuredWidget(), // Add the LicensedAndAssuredWidget here
        BottomNavigationBar(
          currentIndex: selectedIndex,
          selectedItemColor: customColor,
          unselectedItemColor: Colors.grey,
          onTap: onItemTapped,
          selectedLabelStyle: const TextStyle(
            fontWeight:
                FontWeight.bold, // Make the text bold for the selected item
            fontSize: 12, // Set the font size for the selected item
          ),
          unselectedLabelStyle: const TextStyle(
            fontWeight:
                FontWeight.bold, // Make the text bold for the unselected items
            fontSize: 12, // Set the font size for the unselected items
          ),
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home_max),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.wallet),
              label: 'Cards',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.swap_horiz),
              label: 'Transfer',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.history),
              label: 'History',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.account_circle),
              label: 'Account',
            ),
          ],
        ),
      ],
    );
  }
}
