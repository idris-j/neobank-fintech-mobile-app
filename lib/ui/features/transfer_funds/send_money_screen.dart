import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart'; // Import Google Fonts package
import 'package:jeemo_pay/shared/colors.dart'; // Assuming you have a color scheme here
import 'package:jeemo_pay/shared/sizeConfig.dart';
import 'package:jeemo_pay/shared/text_style.dart';
import 'package:jeemo_pay/ui/widget/bottom_sheet_image_widget.dart';
import 'package:jeemo_pay/ui/widget/custom_header_app_logo_widget.dart'; // Import your custom header widget

// Assuming you've already defined CustomBottomSheet and BottomSheetOption

class SendMoneyScreen extends StatefulWidget {
  const SendMoneyScreen({super.key});

  @override
  _SendMoneyScreenState createState() => _SendMoneyScreenState();
}

class _SendMoneyScreenState extends State<SendMoneyScreen>
    with SingleTickerProviderStateMixin {
  String _fromCurrency = 'GHS';
  String _toCurrency = 'NGN';
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
            child: CustomHeaderAppLogoWidget(
              headerText: "Transfer",
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
                  // Instruction Text outside the tabs, centered
                  Center(
                    child: Text(
                      'Enter the amount you want to send',
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

                  // Modern Tab Bar for International and Local Transfers
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.lightBlue[50], // Light blue background
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: TabBar(
                      controller: _tabController,
                      tabs: [
                        Tab(
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: SizeConfig.heightOf(1),
                                horizontal: SizeConfig.widthOf(8)),
                            child: Text(
                              'International',
                              style: GoogleFonts.roboto(
                                textStyle: TextStyle(
                                  fontSize: 16, // Increased font size
                                  color: Colors.black, // Text color for the tab
                                ),
                              ),
                            ),
                          ),
                        ),
                        Tab(
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: SizeConfig.heightOf(1),
                                horizontal: SizeConfig.widthOf(8)),
                            child: Text(
                              'Local',
                              style: GoogleFonts.roboto(
                                textStyle: TextStyle(
                                  fontSize: 16, // Increased font size
                                  color: Colors.black, // Text color for the tab
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                      indicator: BoxDecoration(
                        color:
                            Colors.white, // White background for selected tab
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: Colors.transparent,
                          width: 0,
                        ),
                      ),
                      indicatorSize: TabBarIndicatorSize.tab,
                      indicatorPadding: EdgeInsets.symmetric(horizontal: -20),
                      labelColor: Colors.black,
                      unselectedLabelColor: Colors.black54,
                      labelStyle: GoogleFonts.roboto(),
                      unselectedLabelStyle: GoogleFonts.roboto(
                        textStyle: TextStyle(
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
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
                        _buildTransferContent(showReceiverGets: true),
                        // Local Transfer Tab
                        _buildTransferContent(showReceiverGets: false),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Send Money Button (Outside the TabBarView)
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: SizeConfig.widthOf(5),
              vertical: SizeConfig.heightOf(3),
            ),
            child: Center(
              child: SizedBox(
                width: SizeConfig.widthOf(80), // Adjust width as needed
                child: ElevatedButton(
                  onPressed: () {
                    // Implement the send money functionality
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
                    'Continue',
                    style: GoogleFonts.roboto(
                      textStyle: txStyle16.copyWith(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

// Build Transfer Content including instruction text, amount currency container, and optionally receiver gets section
  Widget _buildTransferContent({required bool showReceiverGets}) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: SizeConfig.widthOf(2)),
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // You Send Section
              _buildAmountCurrencyContainer(
                'You Send',
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
                labelTextSize: 12, // Reduced font size
                balanceTextSize: 10, // Reduced font size
                amountTextSize: 24, // Reduced font size
              ),

              // Spacing
              if (showReceiverGets) SizedBox(height: SizeConfig.heightOf(7)),

              // Receiver Gets Section (Only for International Transfers)
              if (showReceiverGets)
                _buildAmountCurrencyContainer(
                  'Receiver Gets',
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
                  labelTextSize: 12, // Reduced font size
                  amountTextSize: 24, // Reduced font size
                ),

              // Spacing before Note Section
              SizedBox(height: SizeConfig.heightOf(2)),

              // Note Section
              _buildNoteSection(),

              // Spacing
              Spacer(),

              // Note: Removed Send Money Button from here
            ],
          ),

          // Vertical Line with Icons (Only for International Transfers)
          if (showReceiverGets)
            Positioned(
              left: SizeConfig.widthOf(
                  5), // Adjust alignment for smaller containers
              top: SizeConfig.heightOf(
                  15), // Adjust to align with smaller containers
              bottom: SizeConfig.heightOf(
                  20), // Adjust to align with smaller containers
              child: Column(
                children: [
                  // Top Line
                  Container(
                    width: 1, // Width of the vertical line
                    height: SizeConfig.heightOf(0.8), // Reduced height
                    color: Color.fromARGB(255, 189, 189, 189), // Line color
                  ),

                  // First Icon with Border
                  _buildIconInLine(
                    icon: Icons.security,
                    iconSize: 7, // Reduced icon size
                    shapeSize: 12, // Reduced shape size
                  ),

                  // Middle Line
                  Container(
                    width: 1, // Width of the vertical line
                    height: SizeConfig.heightOf(0.8), // Reduced height
                    color: Color.fromARGB(255, 189, 189, 189), // Line color
                  ),

                  // Second Icon with Border
                  _buildIconInLine(
                    icon: Icons.electric_bolt,
                    iconSize: 8, // Reduced icon size
                    shapeSize: 12, // Reduced shape size
                  ),

                  // Bottom Line
                  Container(
                    width: 1, // Width of the vertical line
                    height: SizeConfig.heightOf(1.0), // Reduced height
                    color: Color.fromARGB(255, 189, 189, 189), // Line color
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }

// Build Icon in Line with Circular Background and Border
  Widget _buildIconInLine({
    required IconData icon,
    double iconSize = 20, // Default icon size
    double shapeSize = 40, // Default shape size
    Color backgroundColor = Colors.white, // Background color
    Color borderColor = Colors.grey, // Default border color
    double borderWidth = 1, // Border width
  }) {
    return Container(
      width: shapeSize, // Size of the circle
      height: shapeSize,
      decoration: BoxDecoration(
        color: backgroundColor,
        shape: BoxShape.circle,
        border: Border.all(
          color: borderColor,
          width: borderWidth,
        ),
      ),
      child: Center(
        child: Icon(
          icon,
          size: iconSize,
          color: Colors.grey, // Icon color
        ),
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
    double labelTextSize = 12, // Reduced font size
    double balanceTextSize = 10, // Reduced font size
    double amountTextSize = 24, // Reduced font size
  }) {
    return Container(
      padding: EdgeInsets.all(SizeConfig.widthOf(3)), // Adjust padding
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
                fontSize: 15,
                fontWeight: FontWeight.bold,
                color: textColor, // Color for section label
              ),
            ),
          ),
          SizedBox(height: SizeConfig.heightOf(0.5)), // Reduced spacing
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Amount Input
              Expanded(
                flex: 3,
                child: Container(
                  padding: EdgeInsets.only(
                      right: SizeConfig.widthOf(2)), // Adjust padding
                  child: TextFormField(
                    controller: controller,
                    keyboardType: TextInputType.number,
                    enabled: enabled,
                    style: GoogleFonts.roboto(
                      textStyle: TextStyle(
                        fontSize: 32, // Font size for entered amount
                        color: Colors.black, // Text color for entered amount
                      ),
                    ),
                    decoration: InputDecoration(
                      border: InputBorder.none, // Removed the border
                      contentPadding: EdgeInsets.symmetric(
                          horizontal: 0, vertical: 8), // Reduced padding
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
                        horizontal: SizeConfig.widthOf(3),
                        vertical: 8), // Adjust padding
                    decoration: BoxDecoration(
                      borderRadius:
                          BorderRadius.circular(15), // Adjust border radius
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
        assetPath = 'asset/images/currencies/ghs_flag.png';
        break;
      case 'NGN':
        assetPath = 'asset/images/currencies/ngn_flag.png';
        break;
      case 'GBP':
        assetPath = 'asset/images/currencies/gbp_flag.png';
        break;
      default:
        assetPath =
            'asset/images/currencies/default_flag.png'; // Add a default case if needed
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

  // Build Note Section without a label and with a transparent background
  Widget _buildNoteSection() {
    return Container(
      height: 70.0, // Set the desired height here
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
        maxLines: null, // Allows the text field to expand if needed
      ),
    );
  }
}
