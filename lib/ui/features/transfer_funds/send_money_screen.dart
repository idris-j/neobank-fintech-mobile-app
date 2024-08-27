import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart'; // Import Google Fonts package
import 'package:jeemo_pay/shared/colors.dart'; // Assuming you have a color scheme here
import 'package:jeemo_pay/shared/sizeConfig.dart';
import 'package:jeemo_pay/shared/text_style.dart';
import 'package:jeemo_pay/ui/widget/custom_header_wallet_widget.dart'; // Import your custom header widget

class SendMoneyScreen extends StatefulWidget {
  const SendMoneyScreen({super.key});

  @override
  _SendMoneyScreenState createState() => _SendMoneyScreenState();
}

class _SendMoneyScreenState extends State<SendMoneyScreen>
    with SingleTickerProviderStateMixin {
  String _fromCurrency = 'GBP';
  String _toCurrency = 'USD';
  final _amountController = TextEditingController();
  final _receiverAmountController = TextEditingController();
  final _noteController = TextEditingController();
  late TabController _tabController; // Controller for TabBar

  // Define a border radius for the containers and other elements
  final double borderRadius = 5.0;

  @override
  void initState() {
    super.initState();
    _tabController =
        TabController(length: 2, vsync: this); // Initialize TabController
  }

  @override
  void dispose() {
    _tabController.dispose(); // Dispose of the TabController
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // Custom Header similar to the HomeScreen
          Container(
            color: Colors.white,
            padding: EdgeInsets.symmetric(vertical: 25, horizontal: 20),
            child: CustomHeaderWalletWidget(
              headerText: "Send Money",
            ), // Ensure your custom header has the correct styling
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: SizeConfig.widthOf(5),
                vertical: SizeConfig.heightOf(3),
              ), // Increased padding
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Tab Bar for International and Local Transfers
                  TabBar(
                    controller: _tabController,
                    tabs: [
                      Tab(text: 'International'),
                      Tab(text: 'Local'),
                    ],
                    indicatorColor: customColor, // Color for the tab indicator
                    labelColor: customColor, // Color for selected tab label
                    unselectedLabelColor:
                        Colors.black, // Color for unselected tab labels
                  ),
                  SizedBox(
                      height:
                          SizeConfig.heightOf(2)), // Spacing below the tab bar

                  // TabBarView for International and Local Transfers
                  Expanded(
                    child: TabBarView(
                      controller: _tabController,
                      children: [
                        // International Transfer Tab
                        _buildTransferContent(),
                        // Local Transfer Tab
                        _buildTransferContent(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Build Transfer Content including instruction text, amount currency container, and receiver gets section
  Widget _buildTransferContent() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: SizeConfig.widthOf(2)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Instruction Text
          Text(
            'Enter the amount you want to send',
            style: GoogleFonts.roboto(
              textStyle: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: Colors.black87,
              ),
            ),
          ),
          SizedBox(height: SizeConfig.heightOf(2)), // Spacing

          // You Send Section
          _buildAmountCurrencyContainer(
            'You Send',
            _amountController,
            '0.00',
            _fromCurrency,
            ['GBP', 'USD', 'NGN'],
            (value) {
              setState(() {
                _fromCurrency = value!;
              });
            },
            backgroundColor: Colors.white, // White background
            textColor: Colors.black, // Black text for section label
            labelTextSize: 14, // Reduced font size
            balanceTextSize: 12, // Font size for balance text
          ),

          // Spacing
          SizedBox(height: SizeConfig.heightOf(2)),

          // Receiver Gets Section
          _buildAmountCurrencyContainer(
            'Receiver Gets',
            _receiverAmountController,
            '0.00',
            _toCurrency,
            ['GBP', 'USD', 'NGN'],
            (value) {
              setState(() {
                _toCurrency = value!;
              });
            },
            backgroundColor: Colors.white, // White background
            enabled: false, // Disabled for Receiver Gets section
            showBalance: false, // No balance for Receiver Gets section
            textColor: Colors.black, // Black text for section label
            labelTextSize: 14, // Reduced font size
          ),

          // Spacing before Note Section
          SizedBox(height: SizeConfig.heightOf(4)), // Increased spacing

          // Note Section
          _buildNoteSection(),

          // Spacing
          Spacer(),

          // Send Money Button
          Center(
            child: SizedBox(
              width: SizeConfig.widthOf(80), // Adjust width as needed
              child: ElevatedButton(
                onPressed: () {
                  // Implement the send money functionality
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: customColor, // Custom button color
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  padding:
                      EdgeInsets.symmetric(vertical: SizeConfig.heightOf(2)),
                  elevation: 5, // Subtle shadow
                ),
                child: Text(
                  'Continue',
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
    bool showBalance = true, // Optional parameter to show balance
    required Color textColor, // Color for the section label text
    double labelTextSize = 16, // Default size for labels
    double balanceTextSize = 14, // Font size for balance text
    double amountTextSize = 30, // Font size for entered amount figures
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

              // Currency Dropdown
              Expanded(
                flex: 2,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                        color: Color.fromARGB(255, 164, 11, 159),
                        width: 1), // Blue border color
                  ),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                      value: currencyValue,
                      items: currencies.map((currency) {
                        return DropdownMenuItem<String>(
                          value: currency,
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: SizeConfig.widthOf(
                                    4)), // Add horizontal padding
                            child: Text(currency, style: txStyle14),
                          ),
                        );
                      }).toList(),
                      onChanged: enabled ? onChanged : null,
                      style: GoogleFonts.roboto(
                        textStyle: txStyle14.copyWith(
                          color: Colors.black,
                        ),
                      ),
                      padding: EdgeInsets.zero, // Remove default padding
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

  // Build Note Section without a label and with a transparent background
  Widget _buildNoteSection() {
    return Container(
      padding: EdgeInsets.all(SizeConfig.widthOf(4)),
      decoration: BoxDecoration(
        borderRadius:
            BorderRadius.circular(borderRadius), // Custom border radius
        border:
            Border.all(color: Colors.grey[300]!, width: 1), // Faint grey border
      ),
      child: TextFormField(
        controller: _noteController,
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
          border: InputBorder.none, // Removed the border
          contentPadding: EdgeInsets.symmetric(horizontal: 0, vertical: 12),
          hintText: 'Add note',
          hintStyle: TextStyle(color: Colors.grey[400]), // Grey hint text
          filled: false, // Removed the background color
        ),
      ),
    );
  }
}
