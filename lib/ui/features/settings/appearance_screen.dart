import 'dart:developer';

import 'package:jeemo_pay/services/theme_provider.dart';
import 'package:jeemo_pay/shared/cache.dart';
import 'package:jeemo_pay/shared/colors.dart';
import 'package:jeemo_pay/shared/size.dart';
import 'package:jeemo_pay/shared/sizeConfig.dart';
import 'package:jeemo_pay/shared/text_style.dart';
import 'package:jeemo_pay/ui/widget/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:provider/provider.dart';

class AppearanceScreen extends StatefulWidget {
  const AppearanceScreen({super.key});

  @override
  State<AppearanceScreen> createState() => _AppearanceScreenState();
}

class _AppearanceScreenState extends State<AppearanceScreen> {
  int? selectedRadio;
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      selectedTheme();
    });
  }

  selectedTheme() async {
    bool isDark = await localStorage().getBool("is_dark") ?? false;
    bool isSystem = await localStorage().getBool("is_system") ?? true;
    if (isSystem) {
      setSelectedRadio(3);
    } else {
      if (isDark) {
        setSelectedRadio(1);
      } else {
        setSelectedRadio(2);
      }
    }
    log("dark $isDark system $isSystem index $selectedRadio");
  }

  setSelectedRadio(int val) {
    setState(() {
      selectedRadio = val;
    });
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return Scaffold(
      appBar: const CustomAppBar(),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: SizeConfig.widthOf(10)),
        child: Column(
          children: [
            vertical30,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    SvgPicture.asset(
                      "asset/svgs/moon-filled.svg",
                      height: 30,
                      width: 30,
                      color: Theme.of(context).iconTheme.color,
                    ),
                    vertical10,
                    Text(
                      "Dark",
                      style: txStyle16,
                    ),
                    Radio(
                      value: 1,
                      groupValue: selectedRadio,
                      activeColor: appPrimaryColor,
                      onChanged: (val) async {
                        localStorage().saveBool("is_system", false);

                        themeProvider.toggleToDarkTheme();
                        // ThemeService().switchTheme
                        print("Radio $val");
                        setSelectedRadio(val!);
                      },
                    ),
                  ],
                ),
                Column(
                  children: [
                    SvgPicture.asset(
                      "asset/svgs/bulb.svg",
                      height: 30,
                      width: 30,
                      color: Theme.of(context).iconTheme.color,
                    ),
                    vertical10,
                    Text(
                      "Light",
                      style: txStyle16,
                    ),
                    Radio(
                      value: 2,
                      groupValue: selectedRadio,
                      activeColor: appPrimaryColor,
                      onChanged: (val) async {
                        localStorage().saveBool("is_system", false);
                        themeProvider.toggleToLightTheme();

                        print("Radio $val");
                        setSelectedRadio(val!);
                        // Restart.restartApp();
                      },
                    ),
                  ],
                ),
                Column(
                  children: [
                    SvgPicture.asset(
                      "asset/svgs/adjustments-alt.svg",
                      height: 30,
                      width: 30,
                      color: Theme.of(context).iconTheme.color,
                    ),
                    vertical10,
                    Text(
                      "System",
                      style: txStyle16,
                    ),
                    Radio(
                      value: 3,
                      groupValue: selectedRadio,
                      activeColor: appPrimaryColor,
                      onChanged: (val) async {
                        localStorage().saveBool("is_system", true);
                        print("Radio $val");
                        setSelectedRadio(val!);
                        // Restart.restartApp();
                      },
                    ),
                  ],
                ),
              ],
            ),
            vertical20,
            Text(
              "If you select “system”, Speedly would adjust appearance based on your device settings.",
              textAlign: TextAlign.center,
              style: txStyle12.copyWith(color: Colors.grey),
            )
          ],
        ),
      ),
    );
  }
}
