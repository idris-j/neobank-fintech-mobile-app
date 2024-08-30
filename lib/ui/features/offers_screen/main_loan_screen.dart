import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jeemo_pay/shared/colors.dart'; // Replace with your actual color imports
import 'package:jeemo_pay/shared/sizeConfig.dart'; // Replace with your actual size configuration
import 'package:jeemo_pay/shared/text_style.dart'; // Replace with your actual text styles
import 'package:jeemo_pay/ui/widget/bottom_sheet_image_widget.dart';
import 'package:jeemo_pay/ui/widget/custom_header_back_widget.dart'; // Import your custom header widget
import 'dart:math';

class LoanOptionsScreen extends StatefulWidget {
  const LoanOptionsScreen({super.key});

  @override
  _LoanOptionsScreenState createState() => _LoanOptionsScreenState();
}

class _LoanOptionsScreenState extends State<LoanOptionsScreen> {
  final _amountController = TextEditingController();
  final _noteController = TextEditingController();
  String _selectedDuration = '1 month';
  double _interestRate = 5.0;
  double _monthlyRepayment = 0.0;

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
              headerText: "Loan Options",
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: SizeConfig.widthOf(5),
                vertical: SizeConfig.heightOf(0),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Instruction Text
                  Center(
                    child: Text(
                      'Enter the details for your loan request',
                      style: GoogleFonts.roboto(
                        textStyle: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: Colors.black87,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: SizeConfig.heightOf(2)),

                  // Loan Options Content
                  Expanded(
                    child: _buildLoanOptionsContent(),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Build Loan Options Content including all relevant sections
  Widget _buildLoanOptionsContent() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: SizeConfig.widthOf(2)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Loan Amount Section
          _buildAmountCurrencyContainer(
            'Loan Amount',
            _amountController,
            '0.00',
            'NGN',
            ['GHS', 'NGN', 'GBP'],
            (value) {},
            backgroundColor: Colors.white,
            textColor: Colors.black,
          ),

          // Spacing
          SizedBox(height: SizeConfig.heightOf(2)),

          // Duration Section
          _buildDurationSection(),

          // Spacing
          SizedBox(height: SizeConfig.heightOf(2)),

          // Interest Rate Section
          _buildInterestRateSection(),

          // Spacing
          SizedBox(height: SizeConfig.heightOf(2)),

          // Monthly Repayment Estimate Section
          _buildMonthlyRepaymentSection(),

          // Spacing
          SizedBox(height: SizeConfig.heightOf(10)),

          // Submit Button
          Center(
            child: SizedBox(
              width: SizeConfig.widthOf(80),
              child: ElevatedButton(
                onPressed: () {
                  // Implement the submit functionality
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: customColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  padding:
                      EdgeInsets.symmetric(vertical: SizeConfig.heightOf(2)),
                  elevation: 5,
                ),
                child: Text(
                  'Submit Loan Request',
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
    required Color textColor,
  }) {
    return Container(
      padding: EdgeInsets.all(SizeConfig.widthOf(4)),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(borderRadius),
        border: Border.all(color: Colors.grey[300]!, width: 1),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: GoogleFonts.roboto(
              textStyle: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: textColor,
              ),
            ),
          ),
          SizedBox(height: SizeConfig.heightOf(1)),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 3,
                child: TextFormField(
                  controller: controller,
                  keyboardType: TextInputType.number,
                  style: GoogleFonts.roboto(
                    textStyle: TextStyle(
                      fontSize: 30,
                      color: Colors.black,
                    ),
                  ),
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 0, vertical: 12),
                    hintText: hint,
                    hintStyle: TextStyle(color: Colors.grey[400]),
                    filled: true,
                    fillColor: Colors.transparent,
                  ),
                ),
              ),
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
        ],
      ),
    );
  }

  // Build the Duration Section
  Widget _buildDurationSection() {
    return Container(
      padding: EdgeInsets.all(SizeConfig.widthOf(4)),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(borderRadius),
        border: Border.all(color: Colors.grey[300]!, width: 1),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Duration',
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

  // Build the Interest Rate Section
  Widget _buildInterestRateSection() {
    return Container(
      padding: EdgeInsets.all(SizeConfig.widthOf(4)),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(borderRadius),
        border: Border.all(color: Colors.grey[300]!, width: 1),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Interest Rate (%)',
            style: GoogleFonts.roboto(
              textStyle: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),
          SizedBox(height: SizeConfig.heightOf(1)),
          Slider(
            value: _interestRate,
            min: 0,
            max: 20,
            divisions: 20,
            label: '$_interestRate%',
            onChanged: (value) {
              setState(() {
                _interestRate = value;
                _calculateMonthlyRepayment();
              });
            },
          ),
        ],
      ),
    );
  }

  // Build Monthly Repayment Estimate Section
  Widget _buildMonthlyRepaymentSection() {
    return Container(
      padding: EdgeInsets.all(SizeConfig.widthOf(4)),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(borderRadius),
        border: Border.all(color: Colors.grey[300]!, width: 1),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Estimated Monthly Repayment',
            style: GoogleFonts.roboto(
              textStyle: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),
          SizedBox(height: SizeConfig.heightOf(1)),
          Text(
            '\$${_monthlyRepayment.toStringAsFixed(2)}',
            style: GoogleFonts.roboto(
              textStyle: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Build the Note Section
  Widget _buildNoteSection() {
    return Container(
      padding: EdgeInsets.all(SizeConfig.widthOf(4)),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(borderRadius),
        border: Border.all(color: Colors.grey[300]!, width: 1),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Notes',
            style: GoogleFonts.roboto(
              textStyle: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),
          SizedBox(height: SizeConfig.heightOf(1)),
          TextField(
            controller: _noteController,
            maxLines: 3,
            decoration: InputDecoration(
              hintText: 'Add any notes or comments here',
              border: OutlineInputBorder(),
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
      isScrollControlled: true,
      builder: (BuildContext context) {
        return Container(
          constraints: BoxConstraints(
            maxHeight: MediaQuery.of(context).size.height * 0.4,
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

  // Calculate monthly repayment based on amount, duration, and interest rate
  void _calculateMonthlyRepayment() {
    double amount = double.tryParse(_amountController.text) ?? 0;
    double durationInMonths =
        double.tryParse(_selectedDuration.split(' ')[0]) ?? 1;
    double monthlyInterestRate = _interestRate / 12 / 100;

    if (amount > 0 && durationInMonths > 0) {
      double ratePlusOne = 1 + monthlyInterestRate;
      double repayment = amount *
          (monthlyInterestRate * pow(ratePlusOne, durationInMonths)) /
          (pow(ratePlusOne, durationInMonths) - 1);
      setState(() {
        _monthlyRepayment = repayment;
      });
    } else {
      setState(() {
        _monthlyRepayment = 0;
      });
    }
  }
}
