import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

String getGreeting() {
  var hour = DateTime.now().hour;
  if (hour >= 0 && hour < 12) {
    return "Good morning,";
  } else if (hour >= 12 && hour < 18) {
    return "Good afternoon,";
  } else {
    return "Good evening,";
  }
}

String convertStringToCurrency(String balanceString) {
  // Parse the balance string as a double
  double balance = double.tryParse(balanceString) ?? 0.0;

  // Create a NumberFormat instance with comma-separated thousands
  NumberFormat formatter = NumberFormat("#,##0", "en_US");

  // Format the balance as a string with the thousands separator
  String formattedBalance = formatter.format(balance);

  return "₦$formattedBalance";
}

String convertDateTimeDisplay(String date) {
  final DateFormat displayFormater = DateFormat('yyyy-MM-dd HH:mm:ss.SSS');
  final DateFormat serverFormater = DateFormat('yyyy-MM-dd');
  final DateTime displayDate = displayFormater.parse(date);
  final String formatted = serverFormater.format(displayDate);
  return formatted;
}

String convertTimeDisplay(String dateTimeString) {
  final DateFormat displayFormater = DateFormat('yyyy-MM-dd HH:mm:ss.SSS');
  final DateFormat timeFormater = DateFormat('hh:mm a');
  final DateTime dateTime = displayFormater.parse(dateTimeString);
  final String formattedTime = timeFormater.format(dateTime);
  return formattedTime;
}

void showCustomBottomSheet(Widget bottomSheet, BuildContext context,
    {bool? isMovable}) {
  showModalBottomSheet(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      isScrollControlled: true,
      isDismissible: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10), topRight: Radius.circular(10)),
      ),
      context: context,
      builder: (context) => bottomSheet);
}
