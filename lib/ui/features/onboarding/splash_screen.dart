import 'dart:async';

import 'package:jeemo_pay/shared/colors.dart';
import 'package:jeemo_pay/ui/features/onboarding/branded_splash_screen.dart';
import 'package:jeemo_pay/ui/features/onboarding/get_started_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import '../../../shared/sizeConfig.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    SizeConfig().init(context);
  }

  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 2), () async {
      Get.off(brandedSplashScreen());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: customColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                "assets/images/jeemo_pay-favicon.png",
                height: SizeConfig.heightOf(25),
                width: SizeConfig.widthOf(25),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
