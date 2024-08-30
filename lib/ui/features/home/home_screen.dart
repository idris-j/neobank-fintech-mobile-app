import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:jeemo_pay/core/repositories/user_repository.dart';
import 'package:jeemo_pay/shared/colors.dart';
import 'package:jeemo_pay/shared/constant.dart';
import 'package:jeemo_pay/shared/size.dart';
import 'package:jeemo_pay/shared/sizeConfig.dart';
import 'package:jeemo_pay/shared/text_style.dart';
import 'package:jeemo_pay/ui/content/about_us.dart';
import 'package:jeemo_pay/ui/content/loan_and_about_bottom_sheet.dart';
import 'package:jeemo_pay/ui/content/loan_details.dart';
import 'package:jeemo_pay/ui/features/collect_payment/collect_payment_screen.dart';
import 'package:jeemo_pay/ui/features/offers_screen/main_loan_screen.dart';
import 'package:jeemo_pay/ui/features/offers_screen/travel_loan_screen.dart';
import 'package:jeemo_pay/ui/features/settings/setting_screen.dart';
import 'package:jeemo_pay/ui/features/user/menu_screen.dart';
import 'package:jeemo_pay/ui/widget/bottom_assurance_widget.dart';
import 'package:jeemo_pay/ui/widget/cash_inflow_widget.dart';
import 'package:jeemo_pay/ui/widget/home_custom_header_widget.dart';
import 'package:jeemo_pay/ui/widget/custom_network_image.dart';
import 'package:jeemo_pay/ui/widget/home_card_section_widget.dart';
import 'package:jeemo_pay/ui/widget/scrollable_balance_widget.dart';
import 'package:jeemo_pay/ui/widget/utils.dart';
import 'package:provider/provider.dart';
import 'package:lottie/lottie.dart';
import 'package:jeemo_pay/ui/widget/bottom_navigation_widget.dart';
import 'package:jeemo_pay/ui/widget/pop_up_menu_widget.dart';

// Import the new screens
import 'package:jeemo_pay/ui/features/cards/cards_screen.dart';
import 'package:jeemo_pay/ui/features/transfer_funds/send_money_screen.dart';
import 'package:jeemo_pay/ui/features/user/transaction_history_screen.dart';
import 'package:jeemo_pay/ui/features/user/account_screens/user_account_screen.dart';

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
          HomeCustomHeaderWidget(),
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
                          onTap: () {
                            Get.to(() => SendMoneyScreen());
                          },
                        ),
                        quickActionWidget(
                          title: "Loan",
                          icon: Icons.money_off,
                          onTap: () {
                            Get.to(() => LoanOptionsScreen());
                          },
                        ),
                        PopupMenuWidget(
                          onSelected: onPopupMenuSelected,
                        ),
                      ],
                    ),
                  ),
                  vertical30,
                  // New Loan Options Section
                  GestureDetector(
                    onTap: () {
                      // Navigate to TravelLoanScreen when tapped
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => TravelLoanScreen(),
                        ),
                      );
                    },
                    child: Container(
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
                              "Request loan to travel abroad.",
                              style: txStyle12.copyWith(color: Colors.white),
                              textAlign: TextAlign.left,
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
                  ),
                  vertical30,
                  // Cash Inflow Section
                  const CashInflowWidget(),

                  // Home Card Section with Lottie
                  vertical30,
                  HomeCardSectionWidget(
                    title: "📍 What is Jeemo.io?",
                    description: "All you need to know about your digital bank",
                    lottieAsset: 'asset/lottie/master_jeemo.json',
                    backgroundColor: const Color.fromARGB(255, 105, 9, 139),
                    onTap: () {
                      showAboutUsBottomSheet(context);
                    },
                  ),
                  vertical20,
                  HomeCardSectionWidget(
                    title: "📍 Loan assistance for your travel needs",
                    description: "Fund your wallet with ease",
                    lottieAsset: 'asset/lottie/travel_money.json',
                    backgroundColor: const Color.fromARGB(255, 0, 0, 0),
                    onTap: () {
                      showLoanDetailsBottomSheet(context);
                    },
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
