import 'package:flutter/material.dart';

class CreditCardWidget extends StatelessWidget {
  final String? cardNumber;
  final String? expiryDate;
  final String? cvv;
  final String cardType;
  final Color backgroundColor;
  final bool isAddCard;

  CreditCardWidget({
    this.cardNumber,
    this.expiryDate,
    this.cvv,
    required this.cardType,
    required this.backgroundColor,
    this.isAddCard = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 40),
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(15),
      ),
      child: isAddCard
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.add,
                    size: 40,
                    color: Colors.black,
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Add a Card',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            )
          : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      cardType,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                      ),
                    ),
                    IconButton(
                      icon: Icon(Icons.more_vert, color: Colors.white),
                      onPressed: () {
                        _showBottomSheet(context);
                      },
                    ),
                  ],
                ),
                Spacer(),
                Text(
                  'Card number',
                  style: TextStyle(color: Colors.white, fontSize: 12),
                ),
                SizedBox(height: 8),
                Text(
                  cardNumber ?? '**** **** **** ****',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Expiry date',
                          style: TextStyle(color: Colors.white, fontSize: 12),
                        ),
                        SizedBox(height: 8),
                        Text(
                          expiryDate ?? '**/**',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'CVV',
                          style: TextStyle(color: Colors.white, fontSize: 12),
                        ),
                        SizedBox(height: 8),
                        Text(
                          cvv ?? '***',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Spacer(),
                Align(
                  alignment: Alignment.bottomRight,
                  child: Image.asset(
                    'asset/images/card_jeemo.png', // Placeholder for the card logo (e.g., Mastercard)
                    width: 100,
                  ),
                ),
              ],
            ),
    );
  }

  void _showBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return Container(
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading:
                    Icon(Icons.lock, color: const Color.fromARGB(255, 0, 0, 0)),
                title: Text('Freeze card'),
                onTap: () {
                  Navigator.pop(context);
                  // Handle Freeze card action
                },
              ),
              ListTile(
                leading: Icon(Icons.remove_red_eye,
                    color: const Color.fromARGB(255, 0, 0, 0)),
                title: Text('Hide/Unhide card details'),
                onTap: () {
                  Navigator.pop(context);
                  // Handle Hide/Unhide card details action
                },
              ),
              ListTile(
                leading: Icon(Icons.settings,
                    color: const Color.fromARGB(255, 0, 0, 0)),
                title: Text('Settings'),
                onTap: () {
                  Navigator.pop(context);
                  // Handle Settings action
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
