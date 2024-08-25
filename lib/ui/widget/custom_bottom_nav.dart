import 'package:jeemo_pay/core/repositories/user_repository.dart';
import 'package:jeemo_pay/shared/colors.dart';
import 'package:jeemo_pay/ui/features/settings/setting_screen.dart';
import 'package:jeemo_pay/ui/widget/custom_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:provider/provider.dart';

import '../../shared/text_style.dart';
import '../features/home/home_screen.dart';

class CustomBottomNav extends StatefulWidget {
  const CustomBottomNav({Key? key}) : super(key: key);

  @override
  _CustomBottomNavState createState() => _CustomBottomNavState();
}

class _CustomBottomNavState extends State<CustomBottomNav> {
  static const List<Widget> _widgetOptions = <Widget>[
    HomeScreen(),
    HomeScreen(),
    SettingScreen(),
    SettingScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    final userProv = Provider.of<UserProvider>(context);

    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(userProv.selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
          elevation: 10,
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: appPrimaryColor,
          unselectedItemColor: Colors.grey,
          selectedLabelStyle: txStyle10.copyWith(height: 1.5),
          unselectedLabelStyle: txStyle10,
          items: [
            userProv.selectedIndex == 0
                ? BottomNavigationBarItem(
                    icon: SvgPicture.asset(
                      "asset/svgs/house.svg",
                      color: appPrimaryColor,
                      height: 20,
                      width: 20,
                    ),
                    label: "Home")
                : BottomNavigationBarItem(
                    icon: SvgPicture.asset(
                      "asset/svgs/house.svg",
                      color: Colors.grey,
                      height: 20,
                      width: 20,
                    ),
                    label: "Home"),
            userProv.selectedIndex == 1
                ? BottomNavigationBarItem(
                    icon: SvgPicture.asset(
                      "asset/svgs/cash-banknote.svg",
                      color: appPrimaryColor,
                      height: 20,
                      width: 20,
                    ),
                    label: "Payment",
                  )
                : BottomNavigationBarItem(
                    icon: SvgPicture.asset(
                      "asset/svgs/cash-banknote.svg",
                      height: 20,
                      width: 20,
                      color: Colors.grey,
                    ),
                    label: "Payment"),
            userProv.selectedIndex == 2
                ? BottomNavigationBarItem(
                    icon: SvgPicture.asset(
                      "asset/svgs/pig-money.svg",
                      color: appPrimaryColor,
                      height: 20,
                      width: 20,
                    ),
                    label: "Savings",
                  )
                : BottomNavigationBarItem(
                    icon: SvgPicture.asset(
                      "asset/svgs/pig-money.svg",
                      color: Colors.grey,
                      height: 20,
                      width: 20,
                    ),
                    label: "Savings"),
            userProv.selectedIndex == 3
                ? BottomNavigationBarItem(
                    icon: CustomNetworkImage(
                        imageUrl: userProv
                                .userProfileModel.data?.profilePicture ??
                            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSwsArWf2lZuLGqco6QoGM13keJb078XIgNWA&usqp=CAU",
                        radius: 30),
                    label: "Profile",
                  )
                : BottomNavigationBarItem(
                    icon: CustomNetworkImage(
                        imageUrl: userProv
                                .userProfileModel.data?.profilePicture ??
                            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSwsArWf2lZuLGqco6QoGM13keJb078XIgNWA&usqp=CAU",
                        radius: 25),
                    label: "Profile"),
          ],
          currentIndex: userProv.selectedIndex,
          onTap: (int index) {
            userProv.updateSelectedIndex(index);
          }),
    );
  }
}
