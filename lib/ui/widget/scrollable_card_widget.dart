import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:jeemo_pay/ui/widget/bottom_sheet_icon_widget.dart'; // Import for Clipboard functionality

class CreditCardWidget extends StatefulWidget {
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
  _CreditCardWidgetState createState() => _CreditCardWidgetState();
}

class _CreditCardWidgetState extends State<CreditCardWidget> {
  bool _isCardNumberBlurred = true;
  bool _isExpiryDateBlurred = true;
  bool _isCvvBlurred = true;

  // Function to toggle the blur state of all card details
  void _toggleBlurState() {
    setState(() {
      _isCardNumberBlurred = !_isCardNumberBlurred;
      _isExpiryDateBlurred = !_isExpiryDateBlurred;
      _isCvvBlurred = !_isCvvBlurred;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.isAddCard
          ? null
          : _toggleBlurState, // Entire card is clickable if it's not an "Add Card" widget
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 20, vertical: 40),
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: widget.backgroundColor,
          borderRadius: BorderRadius.circular(15),
        ),
        child: widget.isAddCard
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
                        widget.cardType,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                        ),
                      ),
                      IconButton(
                        icon: Icon(Icons.more_vert, color: Colors.white),
                        onPressed: () {
                          _showCustomBottomSheet(context);
                        },
                      ),
                    ],
                  ),
                  Spacer(),
                  _buildCardDetail(
                    label: 'Card number',
                    value: widget.cardNumber ?? '**** **** **** ****',
                    isBlurred: _isCardNumberBlurred,
                    onTap: () {
                      setState(() {
                        _isCardNumberBlurred = !_isCardNumberBlurred;
                      });
                    },
                  ),
                  SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _buildCardDetail(
                        label: 'Expiry date',
                        value: widget.expiryDate ?? '**/**',
                        isBlurred: _isExpiryDateBlurred,
                        onTap: () {
                          setState(() {
                            _isExpiryDateBlurred = !_isExpiryDateBlurred;
                          });
                        },
                      ),
                      _buildCardDetail(
                        label: 'CVV',
                        value: widget.cvv ?? '***',
                        isBlurred: _isCvvBlurred,
                        onTap: () {
                          setState(() {
                            _isCvvBlurred = !_isCvvBlurred;
                          });
                        },
                      ),
                    ],
                  ),
                  Spacer(),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Image.asset(
                      'assets/images/card_jeemo.png', // Placeholder for the card logo (e.g., Mastercard)
                      width: 100,
                    ),
                  ),
                ],
              ),
      ),
    );
  }

  Widget _buildCardDetail({
    required String label,
    required String value,
    required bool isBlurred,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: TextStyle(color: Colors.white, fontSize: 12),
              ),
              SizedBox(height: 8),
              Text(
                isBlurred ? _blurText(value) : value,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                ),
              ),
            ],
          ),
          if (!isBlurred)
            IconButton(
              icon: Icon(Icons.copy, color: Colors.white),
              onPressed: () {
                Clipboard.setData(ClipboardData(text: value));
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('$label copied to clipboard')),
                );
              },
              iconSize: 14,
            ),
        ],
      ),
    );
  }

  String _blurText(String text) {
    return text.replaceAll(RegExp(r'[0-9a-zA-Z]'), '*');
  }

  void _showCustomBottomSheet(BuildContext context) {
    CustomBottomIconSheet.show(
      context,
      options: [
        BottomSheetOption(
          icon: Icons.lock,
          title: 'Freeze card',
          onTap: () {
            // Handle Freeze card action
          },
        ),
        BottomSheetOption(
          icon: Icons.remove_red_eye,
          title: 'Hide/Unhide card details',
          onTap: () {
            // Handle Hide/Unhide card details action
          },
        ),
        BottomSheetOption(
          icon: Icons.settings,
          title: 'Settings',
          onTap: () {
            // Handle Settings action
          },
        ),
        // You can add more options here
      ],
    );
  }
}
