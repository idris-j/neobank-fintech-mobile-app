import 'package:payprice/shared/size.dart';
import 'package:payprice/shared/sizeConfig.dart';
import 'package:payprice/shared/text_style.dart';
import 'package:payprice/ui/features/signup/otp_screen.dart';
import 'package:payprice/ui/features/signup/signup_repository.dart';
import 'package:payprice/ui/widget/custom_app_bar.dart';
import 'package:payprice/ui/widget/custom_button_load.dart';
import 'package:payprice/ui/widget/custom_form.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

import 'package:provider/provider.dart';

class CreatePasswordScreen extends StatefulWidget {
  const CreatePasswordScreen({super.key});

  @override
  State<CreatePasswordScreen> createState() => _CreatePasswordScreenState();
}

class _CreatePasswordScreenState extends State<CreatePasswordScreen> {
  SignUpProvider? signUpProv;
  final _key = GlobalKey<FormState>();

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
      signUpProv?.disposePassword();
    });
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final signUpProvider = Provider.of<SignUpProvider>(context);

    return Scaffold(
      appBar: CustomAppBar(),
      body: Form(
        key: _key,
        child: Padding(
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
                  "Create Password",
                  style: txStyle27Bold,
                ),
              ),
              Center(
                child: Text(
                  "Secure your account",
                  style: txStyle16,
                ),
              ),
              vertical30,
              CustomTextField(
                labelText: "Password",
                obscureText: true,
                controller: signUpProvider.merchantPassword,
                readOnly: signUpProvider.disableTextField,
                onChanged: (text) => signUpProvider.checkPassword(),
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (value) => signUpProvider.validatePassword(value!),
              ),
              vertical15,
              CustomTextField(
                labelText: "Confirm Password",
                obscureText: true,
                controller: signUpProvider.cPassword,
                readOnly: signUpProvider.disableTextField,
                onChanged: (text) => signUpProvider.checkPassword(),
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (value) => signUpProvider.confirmPassword(value!),
              ),
              vertical15,
              CustomButtonLoad(
                  label: "Continue",
                  userProv: signUpProvider.state,
                  onTap: signUpProvider.passwordCompleted
                      ? () async {
                            if (!_key.currentState!.validate()) return;
      
                          bool res = await signUpProvider.merchantSignUp();
      
                          if (res) {
                            bool res1 = await signUpProvider.sendOtp();
      
                            if (res1) {
                              Get.to(OTPVerificationScreen());
                            }
                          }
                        }
                      : null),
              vertical30,
            ],
          ),
        ),
      ),
    );
  }
}
