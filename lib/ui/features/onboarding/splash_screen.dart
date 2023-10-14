import 'dart:async';

import 'package:payprice/ui/features/onboarding/get_started_screen.dart';
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
      Get.off(GetStartedScreen());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                "asset/images/brixb_logo.png",
                height: SizeConfig.heightOf(20),
                width: SizeConfig.widthOf(20),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
