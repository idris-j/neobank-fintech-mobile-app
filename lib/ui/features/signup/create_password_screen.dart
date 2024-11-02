import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:provider/provider.dart';

import 'package:jeemo_pay/shared/size.dart';
import 'package:jeemo_pay/shared/sizeConfig.dart';
import 'package:jeemo_pay/shared/text_style.dart';
import 'package:jeemo_pay/ui/features/signup/otp_screen.dart';
import 'package:jeemo_pay/ui/features/signup/signup_provider.dart';
import 'package:jeemo_pay/ui/widget/custom_app_bar.dart';
import 'package:jeemo_pay/ui/widget/custom_button_load.dart';
import 'package:jeemo_pay/ui/widget/custom_form.dart';

class CreatePasswordScreen extends StatefulWidget {
  const CreatePasswordScreen({Key? key}) : super(key: key);

  @override
  State<CreatePasswordScreen> createState() => _CreatePasswordScreenState();
}

class _CreatePasswordScreenState extends State<CreatePasswordScreen> {
  final _key = GlobalKey<FormState>();

  // Initialize separate controllers for both fields
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<SignUpProvider>(context, listen: false)
        ..passwordController = _passwordController
        ..confirmPasswordController = _confirmPasswordController;
    });
  }

  @override
  void dispose() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<SignUpProvider>(context, listen: false).disposePassword();
    });
    _passwordController.dispose();
    _confirmPasswordController.dispose();
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
            children: [
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
                controller: _passwordController, // Use local controller
                readOnly: signUpProvider.disableTextField,
                onChanged: (text) {
                  signUpProvider.checkPassword();
                },
                validator: (value) {
                  return signUpProvider.validatePassword(value ?? "");
                },
              ),
              vertical15,
              CustomTextField(
                labelText: "Confirm Password",
                obscureText: true,
                controller: _confirmPasswordController, // Use local controller
                readOnly: signUpProvider.disableTextField,
                onChanged: (text) {
                  signUpProvider.checkPassword();
                },
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (value) {
                  return signUpProvider.validateConfirmPassword(
                      value ?? "", _passwordController.text);
                },
              ),
              vertical15,
              CustomButtonLoad(
                label: "Continue",
                userProv: signUpProvider.state,
                onTap: signUpProvider.passwordCompleted
                    ? () async {
                        if (!_key.currentState!.validate()) return;

                        // Ensure the password is set correctly
                        signUpProvider.passwordController.text =
                            _passwordController.text;

                        bool res = await signUpProvider.register();

                        if (res) {
                          bool res1 = await signUpProvider.sendOtp();

                          if (res1) {
                            Get.to(OTPVerificationScreen());
                          }
                        }
                      }
                    : null,
              ),
              vertical30,
            ],
          ),
        ),
      ),
    );
  }
}
