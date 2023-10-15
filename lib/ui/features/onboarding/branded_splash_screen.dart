import 'dart:async';

import 'package:payprice/ui/features/onboarding/get_started_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:payprice/ui/features/onboarding/nation_choose.dart';
import '../../../shared/sizeConfig.dart';

class brandedSplashScreen extends StatefulWidget {
  const brandedSplashScreen({super.key});

  @override
  State<brandedSplashScreen> createState() => _brandedSplashScreenState();
}

class _brandedSplashScreenState extends State<brandedSplashScreen> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    SizeConfig().init(context);
  }

  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 2), () async {
      Get.off(AutocompleteDropDown());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfffffffff),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                "asset/images/payprice-logo.png",
                height: SizeConfig.heightOf(55),
                width: SizeConfig.widthOf(55),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
