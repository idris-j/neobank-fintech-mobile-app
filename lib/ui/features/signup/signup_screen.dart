import 'package:payprice/shared/size.dart';
import 'package:payprice/shared/sizeConfig.dart';
import 'package:payprice/shared/text_style.dart';
import 'package:payprice/ui/features/signup/create_password_screen.dart';
import 'package:payprice/ui/features/signup/signup_repository.dart';
import 'package:payprice/ui/widget/custom_app_bar.dart';
import 'package:payprice/ui/widget/custom_button_load.dart';
import 'package:payprice/ui/widget/custom_form.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

import 'package:provider/provider.dart';

class SingUpScreen extends StatefulWidget {
  const SingUpScreen({super.key});

  @override
  State<SingUpScreen> createState() => _SingUpScreenState();
}

class _SingUpScreenState extends State<SingUpScreen> {
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
      signUpProv?.disposeSignup();
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
                  "Create an account",
                  style: txStyle27Bold,
                ),
              ),
              Center(
                child: Text(
                  "Join the revolution",
                  style: txStyle16,
                ),
              ),
              vertical30,
              CustomTextField(
                  labelText: "First Name",
                  controller: signUpProvider.firstName,
                  // textInputType: TextInputType.number,
                  readOnly: signUpProvider.disableTextField,
                  validator: (value) => signUpProvider.validateName(value!),
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  onChanged: (text) => signUpProvider.checkSignUp()),
              vertical15,
              CustomTextField(
                  labelText: "Middle Name(Optional)",
                  controller: signUpProvider.middleName,
                  // textInputType: TextInputType.number,

                  readOnly: signUpProvider.disableTextField),
              vertical15,
              CustomTextField(
                  labelText: "Last Name",
                  controller: signUpProvider.lastName,
                  readOnly: signUpProvider.disableTextField,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (value) => signUpProvider.validateName(value!),
                  onChanged: (text) => signUpProvider.checkSignUp()),
              vertical15,
              CustomTextField(
                  labelText: "Email",
                  controller: signUpProvider.email,
                  readOnly: signUpProvider.disableTextField,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (value) => signUpProvider.validateEmail(value!),
                  onChanged: (text) => signUpProvider.checkSignUp()),
              vertical15,
              CustomTextField(
                  labelText: "Phone Number",
                  controller: signUpProvider.phoneNumber,
                  readOnly: signUpProvider.disableTextField,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (value) =>
                      signUpProvider.validatePhoneNumber(value!),
                  onChanged: (text) => signUpProvider.checkSignUp()),
              vertical30,
              CustomButtonLoad(
                  label: "Continue",
                  userProv: signUpProvider.state,
                  onTap: signUpProvider.signupCompleted
                      ? () {
                          if (!_key.currentState!.validate()) return;

                          Get.to(CreatePasswordScreen());
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
