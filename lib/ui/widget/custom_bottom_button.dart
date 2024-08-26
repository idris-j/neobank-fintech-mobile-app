import 'package:flutter/material.dart';

class CustomBottomButtons extends StatelessWidget {
  final VoidCallback onSendPressed;
  final VoidCallback onReceivePressed;

  const CustomBottomButtons({
    Key? key,
    required this.onSendPressed,
    required this.onReceivePressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color.fromARGB(255, 0, 11, 161), // Blue background
      padding: EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Expanded(
            child: ElevatedButton(
              onPressed: onSendPressed,
              style: ElevatedButton.styleFrom(
                foregroundColor: Color.fromARGB(255, 0, 10, 143),
                backgroundColor: Colors.white, // Button text color
              ),
              child: Text('Send',
                  style: TextStyle(color: Color.fromARGB(255, 0, 11, 167))),
            ),
          ),
          SizedBox(width: 10),
          Expanded(
            child: ElevatedButton(
              onPressed: onReceivePressed,
              style: ElevatedButton.styleFrom(
                foregroundColor: Color.fromARGB(255, 0, 3, 153),
                backgroundColor: Colors.white, // Button text color
              ),
              child: Text('Receive',
                  style: TextStyle(color: Color.fromARGB(255, 0, 3, 163))),
            ),
          ),
        ],
      ),
    );
  }
}
