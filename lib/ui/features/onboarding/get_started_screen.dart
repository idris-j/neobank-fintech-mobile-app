import 'package:jeemo_pay/services/theme_provider.dart';
import 'package:jeemo_pay/shared/colors.dart';
import 'package:jeemo_pay/shared/size.dart';
import 'package:jeemo_pay/shared/sizeConfig.dart';
import 'package:jeemo_pay/shared/text_style.dart';
import 'package:jeemo_pay/ui/features/home/home_screen.dart';
import 'package:jeemo_pay/ui/features/login/login_screen.dart';
import 'package:jeemo_pay/ui/features/signup/signup_screen.dart';
import 'package:jeemo_pay/ui/widget/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class GetStartedScreen extends StatelessWidget {
  const GetStartedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<GetStartedItem> items = [
      GetStartedItem(
          "assets/lottie/getStarted.json", "Your Eco-friendly Neobank!", true),
    ];
    final themeProvider = Provider.of<ThemeProvider>(context);

    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: SizeConfig.widthOf(5)),
        child: Column(
          children: [
            Expanded(
                child: PageView.builder(
                    itemCount: items.length,
                    itemBuilder: (context, index) {
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                              decoration: BoxDecoration(
                                  color: Color(0xFFFFFFFF),
                                  shape: BoxShape.circle),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: LottieBuilder.asset(
                                    "assets/lottie/getStarted.json",
                                    height: SizeConfig.heightOf(50),
                                    width: SizeConfig.heightOf(50)),
                              )),
                          vertical5s,
                          Text(
                            items.elementAt(index).title,
                            style: txStyle25,
                            textAlign: TextAlign.center,
                          ),
                        ],
                      );
                    })),
            CustomButton(
              label: "Get started",
              onTap: () {
                Get.to(SignUpScreen());
              },
            ),
            vertical2s,
            CustomButton(
              label: "Login",
              borderColor: Colors.white,
              buttonColor: Colors.transparent,
              textColor: themeProvider.isdark ? Colors.white : Colors.black,
              onTap: () {
                Get.to(HomeScreen());
              },
            ),
            vertical5s,
          ],
        ),
      ),
    );
  }
}

class GetStartedItem {
  final String image;
  final String title;
  final bool isLottie;

  GetStartedItem(this.image, this.title, this.isLottie);
}
