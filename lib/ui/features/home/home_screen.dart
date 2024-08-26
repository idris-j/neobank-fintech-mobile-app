import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:jeemo_pay/core/repositories/user_repository.dart';
import 'package:jeemo_pay/shared/colors.dart';
import 'package:jeemo_pay/shared/constant.dart';
import 'package:jeemo_pay/shared/size.dart';
import 'package:jeemo_pay/shared/sizeConfig.dart';
import 'package:jeemo_pay/shared/text_style.dart';
import 'package:jeemo_pay/ui/features/collect_payment/collect_payment_screen.dart';
import 'package:jeemo_pay/ui/features/settings/setting_screen.dart';
import 'package:jeemo_pay/ui/features/user/menu_screen.dart';
import 'package:jeemo_pay/ui/widget/cash_inflow_widget.dart';
import 'package:jeemo_pay/ui/widget/custom_network_image.dart';
import 'package:jeemo_pay/ui/widget/home_card_section_widget.dart';
import 'package:jeemo_pay/ui/widget/scrollable_balance_widget.dart';
import 'package:jeemo_pay/ui/widget/utils.dart';
import 'package:provider/provider.dart';
import 'package:lottie/lottie.dart';
import 'package:jeemo_pay/ui/widget/bottom_navigation_widget.dart';
import 'package:jeemo_pay/ui/widget/pop_up_menu_widget.dart';

// Import the new screens
import 'package:jeemo_pay/ui/features/user/wallet_screen.dart';
import 'package:jeemo_pay/ui/features/transfer_funds/send_money_screen.dart';
import 'package:jeemo_pay/ui/features/user/transaction_history_screen.dart';
import 'package:jeemo_pay/ui/features/user/user_account_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  // Define the list of screens to display
  late final List<Widget> _screens;

  @override
  void initState() {
    super.initState();
    _screens = [
      HomeContentScreen(
          onPopupMenuSelected: _onPopupMenuSelected), // Pass the function
      WalletScreen(), // Wallet content
      SendMoneyScreen(), // Send money content
      TransactionScreen(), // Transaction history content
      UserAccountScreen(), // User account content
    ];
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _onPopupMenuSelected(String value) {
    switch (value) {
      case 'Bank Details':
        // Navigate to Bank Details screen
        break;
      case 'Transaction Statement':
        // Navigate to Transaction Statement screen
        break;
      case 'Currency Converter':
        // Navigate to Currency Converter screen
        break;
      case 'Add New Account':
        // Navigate to Add New Account screen
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: IndexedStack(
          index: _selectedIndex,
          children: _screens,
        ),
      ),
      bottomNavigationBar: BottomNavigationWidget(
        selectedIndex: _selectedIndex,
        onItemTapped: _onItemTapped,
      ),
    );
  }
}

// This widget represents the original home screen content
class HomeContentScreen extends StatelessWidget {
  final Function(String) onPopupMenuSelected;

  // Pass the callback as a parameter
  const HomeContentScreen({required this.onPopupMenuSelected});

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: SizeConfig.widthOf(5)),
      child: Column(
        children: [
          vertical20,
          Row(
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
                          'asset/images/jeemo_menu_icon.png', // Path to your image asset
                          fit: BoxFit.contain,
                          width: 20.0, // Set the size of the image here
                          height: 20.0, // Set the size of the image here
                        ),
                        iconSize:
                            20.0, // Set the size of the button (not the image)
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
                    userProvider.userProfileModel.data?.profilePicture ??
                        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSwsArWf2lZuLGqco6QoGM13keJb078XIgNWA&usqp=CAU",
                  ),
                ),
              ),
            ],
          ),
          vertical5,
          vertical20,
          Expanded(
            child: RefreshIndicator(
              onRefresh: () async {
                await userProvider.fetchUserProfile();
              },
              child: ListView(
                children: [
                  ScrollableBalanceWidget(),
                  // Available Balance Section
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: SizeConfig.widthOf(10)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        quickActionWidget(
                          title: "Add Money",
                          icon: Icons.add,
                          onTap: () {
                            Get.to(() => CollectPaymentScreen());
                          },
                        ),
                        quickActionWidget(
                          title: "Exchange",
                          icon: Icons.swap_horiz,
                          onTap: () {},
                        ),
                        quickActionWidget(
                          title: "Loan",
                          icon: Icons.money_off,
                          onTap: () {},
                        ),
                        PopupMenuWidget(
                          onSelected: onPopupMenuSelected,
                        ),
                      ],
                    ),
                  ),
                  vertical30,
                  // New Loan Options Section
                  Container(
                    decoration: BoxDecoration(
                      color: customColor, // Background color
                      borderRadius:
                          BorderRadius.circular(10), // Smooth border radius
                    ),
                    padding: EdgeInsets.all(15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment
                          .spaceBetween, // Space between text and icon
                      children: [
                        Expanded(
                          child: Text(
                            "Our travel loan options",
                            style: txStyle12.copyWith(color: Colors.white),
                            textAlign: TextAlign
                                .left, // Center text horizontally within the row
                          ),
                        ),
                        Icon(
                          Icons.arrow_forward_ios, // Greater than icon
                          color: Colors.white,
                          size: 16, // Adjust size as needed
                        ),
                      ],
                    ),
                  ),
                  vertical30,
                  // Cash Inflow Section
                  const CashInflowWidget(),

                  // Home Card Section with Lottie
                  vertical30,
                  const HomeCardSectionWidget(
                    title: "📍 What is Jeemo.io?",
                    description: "All you need to know about your digital bank",
                    lottieAsset: 'asset/lottie/master_jeemo.json',
                    backgroundColor: Color.fromARGB(255, 105, 9, 139),
                  ),
                  vertical20,
                  const HomeCardSectionWidget(
                    title: "📍 Loan assistance for your travel needs",
                    description: "Fund your wallet with ease",
                    lottieAsset: 'asset/lottie/travel_money.json',
                    backgroundColor: Color.fromARGB(255, 0, 0, 0),
                  ),
                  vertical20,
                  // New Section with Lottie Animation
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget quickActionWidget({
    required String title,
    required IconData icon,
    required Function onTap,
  }) {
    return Column(
      children: [
        GestureDetector(
          onTap: () => onTap(),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white, // White background
              borderRadius: BorderRadius.circular(10), // Smooth border radius
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  spreadRadius: 2,
                  blurRadius: 5,
                  offset: Offset(0, 3),
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Icon(
                icon,
                color: Colors.black, // Use custom color for icons
                size: 30,
              ),
            ),
          ),
        ),
        SizedBox(height: 10), // Spacing between the icon and text
        Text(
          title,
          style: txStyle12,
        ),
      ],
    );
  }
}

class PaymentBreakdownWidget extends StatelessWidget {
  final IconData icon;
  final String value;

  const PaymentBreakdownWidget({
    Key? key,
    required this.icon,
    required this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          color: appPrimaryColor,
          size: 16, // Adjust size as needed
        ),
        horizontalx5,
        Text(
          value,
          style: txStyle12.copyWith(color: appPrimaryColor),
        ),
      ],
    );
  }
}

class quickActionWidget extends StatelessWidget {
  final String title;
  final IconData icon;
  final VoidCallback onTap;

  const quickActionWidget({
    super.key,
    required this.title,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle, // Circular shape
              color: Colors.white, // White background
              border: Border.all(color: appPrimaryColor), // Border color
            ),
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Center(
                child: Icon(
                  icon,
                  size: 25,
                  color: appPrimaryColor, // Icon color
                ),
              ),
            ),
          ),
          vertical10,
          Text(
            title,
            style: txStyle13.copyWith(color: appPrimaryColor),
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }
}
