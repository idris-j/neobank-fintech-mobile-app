import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:jeemo_pay/core/repositories/user_repository.dart';
import 'package:jeemo_pay/shared/colors.dart';
import 'package:jeemo_pay/shared/constant.dart';
import 'package:jeemo_pay/shared/size.dart';
import 'package:jeemo_pay/shared/sizeConfig.dart';
import 'package:jeemo_pay/shared/text_style.dart';
import 'package:jeemo_pay/ui/features/collect_payment/collect_payment_screen.dart';
import 'package:jeemo_pay/ui/widget/utils.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    // Handle navigation based on the index here
    // Example: Get.to(PageForSelectedTab());
  }

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: SizeConfig.widthOf(5)),
          child: Column(
            children: [
              vertical20,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        getGreeting(),
                        style: txStyle25Bold.copyWith(color: appPrimaryColor),
                      ),
                      Text(
                        userProvider.userProfileModel.data?.lastName ?? "User",
                        style: txStyle25Bold.copyWith(color: appSecondaryColor),
                      ),
                    ],
                  ),
                  Container(
                    width: SizeConfig.widthOf(30),
                    decoration: BoxDecoration(
                      border: Border.all(color: greyColor),
                      borderRadius: KBORDERRADIUS,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 5, vertical: 5),
                      child: Row(children: [
                        Expanded(
                          child: Text(
                            userProvider.userProfileModel.data?.merchantId ??
                                "loading...",
                            style: txStyle12,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        horizontalx5,
                        Icon(
                          Icons.copy,
                          size: 15,
                          color: appPrimaryColor,
                        )
                      ]),
                    ),
                  )
                ],
              ),
              vertical5,
              Divider(color: greyColor),
              vertical20,
              Expanded(
                child: RefreshIndicator(
                  onRefresh: () async {
                    await userProvider.fetchUserProfile();
                  },
                  child: ListView(
                    children: [
                      // Available Balance Section
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white, // White background
                          borderRadius:
                              BorderRadius.circular(10), // Smooth border radius
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
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Your total balance",
                                style: txStyle12.copyWith(
                                    color: appSecondaryColor),
                              ),
                              vertical5,
                              Text(
                                convertStringToCurrency("1350000"),
                                style: txStyle25Bold.copyWith(
                                    color: appPrimaryColor),
                              ),
                              vertical10,
                              SizedBox(
                                height: 20,
                                child: ListView(
                                  scrollDirection: Axis.horizontal,
                                  children: [
                                    PaymentBreakdownWidget(
                                      icon: Icons.nfc,
                                      value: convertStringToCurrency("25000"),
                                    ),
                                    horizontalx10,
                                    PaymentBreakdownWidget(
                                      icon: Icons.nfc,
                                      value: convertStringToCurrency("15000"),
                                    ),
                                    horizontalx10,
                                    PaymentBreakdownWidget(
                                      icon: Icons.link,
                                      value: convertStringToCurrency("57000"),
                                    ),
                                    horizontalx10,
                                    PaymentBreakdownWidget(
                                      icon: Icons.monetization_on,
                                      value: convertStringToCurrency("17000"),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      vertical30,
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: SizeConfig.widthOf(10)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            quickActionWidget(
                              title: "Add Money",
                              icon: Icons.add_circle,
                              onTap: () {},
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
                            quickActionWidget(
                              title: "More",
                              icon: Icons.more_horiz,
                              onTap: () {},
                            ),
                          ],
                        ),
                      ),
                      vertical30,
                      vertical30,
                      // Cash Inflow Section
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white, // White background
                          borderRadius:
                              BorderRadius.circular(10), // Smooth border radius
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
                          padding: const EdgeInsets.all(15),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Cash Inflow",
                                    style: txStyle12Bold.copyWith(
                                        color: appPrimaryColor),
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        "See more",
                                        style: txStyle10.copyWith(
                                            color: greyColor),
                                      ),
                                      horizontalx5,
                                      Icon(
                                        Icons.arrow_forward_ios,
                                        color: greyColor,
                                        size: 8,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              vertical20,
                              ListView.builder(
                                shrinkWrap: true,
                                physics: NeverScrollableScrollPhysics(),
                                itemCount: 3,
                                itemBuilder: (context, index) {
                                  return Padding(
                                    padding: const EdgeInsets.only(bottom: 20),
                                    child: Row(
                                      children: [
                                        Container(
                                          decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: lightGray,
                                              border: Border.all(
                                                  color: appPrimaryColor)),
                                          child: Padding(
                                            padding: const EdgeInsets.all(5),
                                            child: Icon(
                                              Icons.link,
                                              size: 15,
                                              color: appPrimaryColor,
                                            ),
                                          ),
                                        ),
                                        horizontalx10,
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              convertStringToCurrency("5000"),
                                              style: txStyle10Bold.copyWith(
                                                  color: appPrimaryColor),
                                            ),
                                            vertical5,
                                            Text(
                                              "${convertDateTimeDisplay(DateTime.now().toString())} • ${convertTimeDisplay(DateTime.now().toString())}",
                                              style: txStyle10.copyWith(
                                                  color: appSecondaryColor),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                      vertical15,
                      // Cash Outflow Section
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white, // White background
                          borderRadius:
                              BorderRadius.circular(10), // Smooth border radius
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
                          padding: const EdgeInsets.all(15),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Cash Outflow",
                                    style: txStyle12Bold.copyWith(
                                        color: appPrimaryColor),
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        "See more",
                                        style: txStyle10.copyWith(
                                            color: greyColor),
                                      ),
                                      horizontalx5,
                                      Icon(
                                        Icons.arrow_forward_ios,
                                        color: greyColor,
                                        size: 8,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              vertical20,
                              ListView.builder(
                                shrinkWrap: true,
                                physics: NeverScrollableScrollPhysics(),
                                itemCount: 3,
                                itemBuilder: (context, index) {
                                  return Padding(
                                    padding: const EdgeInsets.only(bottom: 20),
                                    child: Row(
                                      children: [
                                        Container(
                                          decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: lightGray,
                                              border: Border.all(
                                                  color: appPrimaryColor)),
                                          child: Padding(
                                            padding: const EdgeInsets.all(5),
                                            child: Icon(
                                              Icons.link,
                                              size: 15,
                                              color: appPrimaryColor,
                                            ),
                                          ),
                                        ),
                                        horizontalx10,
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              convertStringToCurrency("5000"),
                                              style: txStyle10Bold.copyWith(
                                                  color: appPrimaryColor),
                                            ),
                                            vertical5,
                                            Text(
                                              "${convertDateTimeDisplay(DateTime.now().toString())} • ${convertTimeDisplay(DateTime.now().toString())}",
                                              style: txStyle10.copyWith(
                                                  color: appSecondaryColor),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: <BottomNavigationBarItem>[
          _buildBottomNavItem(Icons.home, 'Home', 0),
          _buildBottomNavItem(Icons.swap_horiz, 'Transfer', 1),
          _buildBottomNavItem(Icons.notifications, 'Notifications', 2),
          _buildBottomNavItem(Icons.history, 'History', 3),
          _buildBottomNavItem(Icons.account_circle, 'Account', 4),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }

  BottomNavigationBarItem _buildBottomNavItem(
      IconData icon, String label, int index) {
    return BottomNavigationBarItem(
      icon: AnimatedSwitcher(
        duration: Duration(milliseconds: 300),
        child: Icon(
          icon,
          key: ValueKey<int>(index),
          color: _selectedIndex == index ? appPrimaryColor : Colors.black,
          size: 24.0,
        ),
      ),
      label: label,
    );
  }
}

class PaymentBreakdownWidget extends StatelessWidget {
  final IconData icon;
  final String value;

  const PaymentBreakdownWidget({
    super.key,
    required this.icon,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          size: 15,
          color: appPrimaryColor,
        ),
        horizontalx5,
        Text(
          value,
          style: txStyle12Bold.copyWith(color: appPrimaryColor),
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
              border: Border.all(color: appPrimaryColor),
              color: lightGray, // Background color
            ),
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Center(
                child: Icon(
                  icon,
                  size: 25,
                  color: Theme.of(context).iconTheme.color,
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
