import 'package:jeemo_pay/core/providers/user_provider.dart';
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

    // Ensure selectedIndex is not null
    final selectedIndex = userProv.selectedIndex ?? 0;

    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(selectedIndex),
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
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              "assets/svgs/house.svg",
              color: selectedIndex == 0 ? appPrimaryColor : Colors.grey,
              height: 20,
              width: 20,
            ),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              "assets/svgs/cash-banknote.svg",
              color: selectedIndex == 1 ? appPrimaryColor : Colors.grey,
              height: 20,
              width: 20,
            ),
            label: "Payment",
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              "assets/svgs/pig-money.svg",
              color: selectedIndex == 2 ? appPrimaryColor : Colors.grey,
              height: 20,
              width: 20,
            ),
            label: "Savings",
          ),
          BottomNavigationBarItem(
            icon: CustomNetworkImage(
              imageUrl: userProv.userProfile?.data?.profilePicture ??
                  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSwsArWf2lZuLGqco6QoGM13keJb078XIgNWA&usqp=CAU",
              radius: selectedIndex == 3 ? 30 : 25,
            ),
            label: "Profile",
          ),
        ],
        currentIndex: selectedIndex,
        onTap: (int index) {
          userProv.updateSelectedIndex(index);
        },
      ),
    );
  }
}
