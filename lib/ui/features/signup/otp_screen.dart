import 'package:jeemo_pay/shared/cache.dart';
import 'package:jeemo_pay/shared/colors.dart';
import 'package:jeemo_pay/shared/size.dart';
import 'package:jeemo_pay/shared/sizeConfig.dart';
import 'package:jeemo_pay/shared/text_style.dart';
import 'package:jeemo_pay/ui/features/signup/complete_signup_screen.dart';
import 'package:jeemo_pay/ui/features/signup/signup_repository.dart';
import 'package:jeemo_pay/ui/widget/custom_app_bar.dart';
import 'package:jeemo_pay/ui/widget/custom_button_load.dart';
import 'package:jeemo_pay/ui/widget/pinCode_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:provider/provider.dart';

class OTPVerificationScreen extends StatefulWidget {
  const OTPVerificationScreen({super.key});

  @override
  State<OTPVerificationScreen> createState() => _OTPVerificationScreenState();
}

class _OTPVerificationScreenState extends State<OTPVerificationScreen> {
  final TextEditingController otpController = TextEditingController();
  bool hasError = false;
  // final _key = GlobalKey<FormState>();

  SignUpProvider? signUpProv;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      signUpProv = Provider.of<SignUpProvider>(context, listen: false);
    });
  }

  @override
  void dispose() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      signUpProv?.disposeOTP();
    });
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final signupProvider = Provider.of<SignUpProvider>(context);

    return Scaffold(
      appBar: const CustomAppBar(),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: SizeConfig.widthOf(5)),
        child: ListView(
          children: [
            Center(
              child: Image.asset(
                "assets/images/brixb_logo.png",
                height: 50,
                width: 50,
              ),
            ),
            vertical20,
            Center(
              child: Text(
                "OTP Verification",
                style: txStyle27Bold,
              ),
            ),
            Center(
              child: Text(
                "You are almost done! Enter the 6-digit code sent to ${signupProvider?.phoneNumber.text}.",
                style: txStyle16,
                textAlign: TextAlign.center,
              ),
            ),
            vertical30,
            Center(
              child: PINCodeInput(
                inputLenght: 6,
                error: hasError,
                next: () async {},
                controller: signupProvider.otp,
                onChanged: (text) => signupProvider.checkOTP(),
              ),
            ),
            vertical20,
            InkWell(
              onTap: () {},
              child: RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  text: 'Didn’t receive OTP? ',
                  style: txStyle14.copyWith(
                      color: Theme.of(context).iconTheme.color),
                  children: <TextSpan>[
                    TextSpan(
                      text: 'Resend OTP',
                      style: txStyle14.copyWith(color: appPrimaryColor),
                    )
                  ],
                ),
              ),
            ),
            vertical50,
            CustomButtonLoad(
                label: "Finish",
                userProv: signupProvider.state,
                onTap: signupProvider.otpCompleted
                    ? () async {
                        bool res = await signupProvider.validateOTP();
                        if (res) {
                          Get.close(3);
                          localStorage().clearStorage();
                          Get.to(SignUpCompletedScreen());
                        }
                      }
                    : null),
          ],
        ),
      ),
    );
  }
}
