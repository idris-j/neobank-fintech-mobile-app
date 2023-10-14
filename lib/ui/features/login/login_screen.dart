import 'dart:io';

import 'package:payprice/core/repositoies/user_repository.dart';
import 'package:payprice/shared/colors.dart';
import 'package:payprice/shared/size.dart';
import 'package:payprice/shared/sizeConfig.dart';
import 'package:payprice/shared/text_style.dart';
import 'package:payprice/ui/features/login/login_repository.dart';
import 'package:payprice/ui/features/signup/signup_screen.dart';
import 'package:payprice/ui/widget/custom_app_bar.dart';
import 'package:payprice/ui/widget/custom_bottom_nav.dart';
import 'package:payprice/ui/widget/custom_button_load.dart';
import 'package:payprice/ui/widget/custom_form.dart';
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
            Image.asset(
              "asset/images/brixb_logo.png",
              height: 50,
              width: 50,
            ),
            vertical20,
            Center(
              child: Text(
                "Hey there!",
                style: txStyle27Bold,
              ),
            ),
            Center(
              child: Text(
                "Log into your account to continue",
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
            CustomTextField(
                labelText: "Password",
                obscureText: true,
                controller: loginProvider.userPassword,
                readOnly: loginProvider.disableTextField,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (value) => loginProvider.validatePassword(value!),
                onChanged: (text) => loginProvider.checkLoginForm()),
            vertical20,
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  "Forgot password?",
                  style: txStyle13.copyWith(color: Colors.grey),
                )
              ],
            ),
            vertical30,
            Row(
              children: [
                Expanded(
                  child: CustomButtonLoad(
                      label: "Login",
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
                            ? "asset/lottie/face_id.json"
                            : "asset/lottie/biometric.json",
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
                  text: 'New to payprice? ',
                  style: txStyle14.copyWith(
                      color: Theme.of(context).iconTheme.color),
                  children: <TextSpan>[
                    TextSpan(
                      text: 'Create an account',
                      style: txStyle14.copyWith(color: appPrimaryColor),
                    )
                  ],
                ),
              ),
            ),
            vertical30,
          ],
        ),
      ),
    );
  }
}
