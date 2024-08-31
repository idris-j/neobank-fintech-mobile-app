import 'dart:io';

import 'package:jeemo_pay/core/repositories/user_repository.dart';
import 'package:jeemo_pay/shared/colors.dart';
import 'package:jeemo_pay/shared/size.dart';
import 'package:jeemo_pay/shared/sizeConfig.dart';
import 'package:jeemo_pay/shared/text_style.dart';
import 'package:jeemo_pay/ui/features/login/login_repository.dart';
import 'package:jeemo_pay/ui/features/signup/signup_screen.dart';
import 'package:jeemo_pay/ui/widget/custom_app_bar.dart';
import 'package:jeemo_pay/ui/widget/custom_bottom_nav.dart';
import 'package:jeemo_pay/ui/widget/custom_button_load.dart';
import 'package:jeemo_pay/ui/widget/custom_form.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  LoginProvider? loginProv;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      loginProv = Provider.of<LoginProvider>(context, listen: false);
    });
  }

  @override
  void dispose() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      loginProv?.disposeController();
    });
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final loginProvider = Provider.of<LoginProvider>(context);
    final userProvider = Provider.of<UserProvider>(context);

    return Scaffold(
      appBar: CustomAppBar(),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: SizeConfig.widthOf(5)),
        child: ListView(
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            vertical20,
            Center(
              child: Text(
                "Welcome back!",
                style: txStyle27Bold,
              ),
            ),
            vertical10,
            Center(
              child: Text(
                "Securely login to your jeemo_pay account",
                style: txStyle16,
              ),
            ),
            vertical30,
            CustomTextField(
                labelText: "Phone Number",
                controller: loginProvider.phoneNumber,
                textInputType: TextInputType.number,
                readOnly: loginProvider.disableTextField,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (value) => loginProvider.validatePhoneNumber(value!),
                onChanged: (text) => loginProvider.checkLoginForm()),
            vertical15,
            Row(
              children: [
                Expanded(
                  child: CustomButtonLoad(
                      label: "LOG IN",
                      userProv: loginProvider.state,
                      onTap: loginProvider.loginComplete
                          ? () async {
                              bool u = await loginProvider.merchantLogin();
                              if (u) {
                                userProvider.fetchUserProfile();
                                Get.offAll(CustomBottomNav());
                              }
                            }
                          : null),
                ),
                horizontalx10,
                Center(
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.grey.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(6)),
                    child: Lottie.asset(
                        Platform.isIOS
                            ? "assets/lottie/face_id.json"
                            : "assets/lottie/biometric.json",
                        height: SizeConfig.heightOf(6),
                        width: SizeConfig.heightOf(6),
                        repeat: false),
                  ),
                ),
              ],
            ),
            vertical20,
            InkWell(
              onTap: () {
                Get.to(SingUpScreen());
              },
              child: RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  text: 'New to jeemo_pay? ',
                  style: txStyle14.copyWith(
                      color: Theme.of(context).iconTheme.color),
                  children: <TextSpan>[
                    TextSpan(
                      text: 'Register',
                      style: txStyle14.copyWith(color: appPrimaryColor),
                    )
                  ],
                ),
              ),
            ),
            vertical50,
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  "Forgot password?",
                  style: txStyle13.copyWith(color: Colors.grey),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
