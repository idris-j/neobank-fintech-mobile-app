import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart'; // Import Google Fonts package
import 'package:jeemo_pay/shared/colors.dart'; // Assuming you have a color scheme here
import 'package:jeemo_pay/shared/sizeConfig.dart';
import 'package:jeemo_pay/shared/text_style.dart';
import 'package:jeemo_pay/ui/widget/bottom_sheet_image_widget.dart';
import 'package:jeemo_pay/ui/widget/custom_header_back_widget.dart'; // Import your custom header widget

// Assuming you've already defined CustomBottomSheet and BottomSheetOption

class TravelLoanScreen extends StatefulWidget {
  const TravelLoanScreen({super.key});

  @override
  _TravelLoanScreenState createState() => _TravelLoanScreenState();
}

class _TravelLoanScreenState extends State<TravelLoanScreen> {
  String _fromCurrency = 'GHS';
  String _toCurrency = 'NGN';
  final _amountController = TextEditingController();
  final _receiverAmountController = TextEditingController();
  final _noteController = TextEditingController();

  // New variable for the duration
  String _selectedDuration = '1 month';

  // Define a border radius for the containers and other elements
  final double borderRadius = 5.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // Custom Header
          Container(
            color: Colors.white,
            padding: EdgeInsets.symmetric(vertical: 55, horizontal: 20),
            child: CustomHeaderBackButtonWidget(
              headerText: "Travel Loan",
            ), // Ensure your custom header has the correct styling
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: SizeConfig.widthOf(5),
                vertical: SizeConfig.heightOf(0),
              ), // Increased padding
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Instruction Text
                  Center(
                    child: Text(
                      'Enter the amount you want to request',
                      style: GoogleFonts.roboto(
                        textStyle: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: Colors.black87,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: SizeConfig.heightOf(2)), // Spacing

                  // Travel Loan Content
                  Expanded(
                    child: _buildLoanContent(),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Build Loan Content including instruction text, amount currency container, and optionally receiver gets section
  Widget _buildLoanContent() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: SizeConfig.widthOf(2)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // You Request Section
          _buildAmountCurrencyContainer(
            'You Request',
            _amountController,
            '0.00',
            _fromCurrency,
            ['GHS', 'NGN', 'GBP'],
            (value) {
              setState(() {
                _fromCurrency = value!;
              });
            },
            backgroundColor: Colors.white,
            textColor: Colors.black,
            labelTextSize: 14,
            balanceTextSize: 12,
          ),

          // Spacing
          SizedBox(height: SizeConfig.heightOf(2)),

          // You Pay Section (For Travel Loan)
          _buildAmountCurrencyContainer(
            'You Pay',
            _receiverAmountController,
            '0.00',
            _toCurrency,
            ['GHS', 'NGN', 'GBP'],
            (value) {
              setState(() {
                _toCurrency = value!;
              });
            },
            backgroundColor: Colors.white,
            enabled: false,
            showBalance: false,
            textColor: Colors.black,
            labelTextSize: 14,
          ),

          // Spacing before Duration Section
          SizedBox(height: SizeConfig.heightOf(7)),

          // Duration Section
          _buildDurationSection(),

          // Spacing before Note Section
          SizedBox(height: SizeConfig.heightOf(6)),

          // Request Loan Button
          Center(
            child: SizedBox(
              width: SizeConfig.widthOf(80), // Adjust width as needed
              child: ElevatedButton(
                onPressed: () {
                  // Implement the request loan functionality
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: customColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  padding:
                      EdgeInsets.symmetric(vertical: SizeConfig.heightOf(2)),
                  elevation: 5, // Subtle shadow
                ),
                child: Text(
                  'Request Loan',
                  style: GoogleFonts.roboto(
                    textStyle: txStyle16.copyWith(color: Colors.white),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Build Container for Amount and Currency Dropdown
  Widget _buildAmountCurrencyContainer(
    String label,
    TextEditingController controller,
    String hint,
    String currencyValue,
    List<String> currencies,
    ValueChanged<String?> onChanged, {
    required Color backgroundColor,
    bool enabled = true,
    bool showBalance = true,
    required Color textColor,
    double labelTextSize = 16,
    double balanceTextSize = 14,
    double amountTextSize = 30,
  }) {
    return Container(
      padding: EdgeInsets.all(SizeConfig.widthOf(4)),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius:
            BorderRadius.circular(borderRadius), // Custom border radius
        border:
            Border.all(color: Colors.grey[300]!, width: 1), // Faint grey border
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: GoogleFonts.roboto(
              textStyle: TextStyle(
                fontSize: labelTextSize,
                fontWeight: FontWeight.bold,
                color: textColor, // Color for section label
              ),
            ),
          ),
          SizedBox(height: SizeConfig.heightOf(1)),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Amount Input
              Expanded(
                flex: 3,
                child: Container(
                  padding: EdgeInsets.only(right: SizeConfig.widthOf(3)),
                  child: TextFormField(
                    controller: controller,
                    keyboardType: TextInputType.number,
                    enabled: enabled,
                    style: GoogleFonts.roboto(
                      textStyle: TextStyle(
                        fontSize:
                            amountTextSize, // Font size for entered amount
                        color: Colors.black, // Text color for entered amount
                      ),
                    ),
                    decoration: InputDecoration(
                      border: InputBorder.none, // Removed the border
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 0, vertical: 12),
                      hintText: hint,
                      hintStyle:
                          TextStyle(color: Colors.grey[400]), // Grey hint text
                      filled: true,
                      fillColor: Colors.transparent, // No background color
                    ),
                  ),
                ),
              ),

              // Currency Dropdown as a Bottom Sheet
              Expanded(
                flex: 2,
                child: GestureDetector(
                  onTap: () {
                    _showCurrencySelectionSheet(context, currencies, onChanged);
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(
                        horizontal: SizeConfig.widthOf(4), vertical: 12),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        color: Color.fromARGB(255, 164, 11, 159),
                        width: 1,
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          currencyValue,
                          style: GoogleFonts.roboto(
                            textStyle: txStyle14.copyWith(color: Colors.black),
                          ),
                        ),
                        Icon(Icons.arrow_drop_down, color: Colors.black),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          if (showBalance)
            Align(
              alignment: Alignment.centerRight,
              child: Padding(
                padding: EdgeInsets.only(
                    top: SizeConfig.heightOf(0.5)), // Adjust padding as needed
                child: Text(
                  'Balance: 0.00 GBP',
                  style: GoogleFonts.roboto(
                    textStyle: TextStyle(
                      fontSize: balanceTextSize,
                      color: Colors.grey[600], // Tiny faint grey text
                    ),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }

  // Show the Custom Bottom Sheet for Currency Selection
  void _showCurrencySelectionSheet(BuildContext context,
      List<String> currencies, ValueChanged<String?> onChanged) {
    CustomBottomImageSheet.show(
      context,
      options: currencies.map((currency) {
        return BottomSheetOption(
          icon: _getCurrencyIcon(
              currency), // Use the custom method to get the icon
          title: currency,
          onTap: () {
            onChanged(currency);
            Navigator.pop(context);
          },
        );
      }).toList(),
    );
  }

  Widget _getCurrencyIcon(String currency) {
    String assetPath;
    switch (currency) {
      case 'GHS':
        assetPath = 'assets/images/currencies/ghs_flag.png';
        break;
      case 'NGN':
        assetPath = 'assets/images/currencies/ngn_flag.png';
        break;
      case 'GBP':
        assetPath = 'assets/images/currencies/gbp_flag.png';
        break;
      default:
        assetPath =
            'assets/images/currencies/default_flag.png'; // Add a default case if needed
    }

    return Container(
      width: 40, // Set the width of the circle container
      height: 40, // Set the height of the circle container
      decoration: BoxDecoration(
        shape: BoxShape.circle, // Make the container circular
        image: DecorationImage(
          image: AssetImage(assetPath),
          fit: BoxFit.cover, // Cover the entire circle with the flag image
        ),
      ),
    );
  } // This is the closing brace for _getCurrencyIcon method

  // Build the Duration Section
  Widget _buildDurationSection() {
    return Container(
      padding: EdgeInsets.all(SizeConfig.widthOf(4)),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius:
            BorderRadius.circular(borderRadius), // Custom border radius
        border:
            Border.all(color: Colors.grey[300]!, width: 1), // Faint grey border
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Duration (How long do you want to keep the money for?)',
            style: GoogleFonts.roboto(
              textStyle: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),
          SizedBox(height: SizeConfig.heightOf(1)),
          GestureDetector(
            onTap: () {
              _showDurationSelectionSheet(context);
            },
            child: Container(
              padding: EdgeInsets.symmetric(
                  horizontal: SizeConfig.widthOf(4), vertical: 12),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: Color.fromARGB(255, 164, 11, 159),
                  width: 1,
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    _selectedDuration,
                    style: GoogleFonts.roboto(
                      textStyle: txStyle14.copyWith(color: Colors.black),
                    ),
                  ),
                  Icon(Icons.arrow_drop_down, color: Colors.black),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

// Show the Custom Bottom Sheet for Duration Selection
  void _showDurationSelectionSheet(BuildContext context) {
    List<String> durations = [
      '1 month',
      '2 months',
      '3 months',
      '4 months',
      '5 months',
      '6 months',
      '7 months',
      '8 months',
      '9 months',
      '10 months',
      '11 months',
      '12 months',
    ];

    showModalBottomSheet(
      context: context,
      isScrollControlled:
          true, // Allows the bottom sheet to take more space if needed
      builder: (BuildContext context) {
        return Container(
          constraints: BoxConstraints(
            maxHeight: MediaQuery.of(context).size.height *
                0.4, // Fixed height of 40% of screen height
          ),
          padding: EdgeInsets.symmetric(
              horizontal: SizeConfig.widthOf(4),
              vertical: SizeConfig.heightOf(2)),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          ),
          child: SingleChildScrollView(
            child: Column(
              children: durations.map((duration) {
                return ListTile(
                  leading: Icon(Icons.schedule),
                  title: Text(duration),
                  onTap: () {
                    setState(() {
                      _selectedDuration = duration;
                    });
                    Navigator.pop(context);
                  },
                );
              }).toList(),
            ),
          ),
        );
      },
    );
  }
}
