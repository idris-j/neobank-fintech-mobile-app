import 'package:jeemo_pay/shared/size.dart';
import 'package:jeemo_pay/shared/sizeConfig.dart';
import 'package:jeemo_pay/shared/text_style.dart';
import 'package:jeemo_pay/ui/features/login/login_screen.dart';
import 'package:jeemo_pay/ui/features/signup/create_password_screen.dart';
import 'package:jeemo_pay/ui/features/signup/signup_repository.dart';
import 'package:jeemo_pay/ui/widget/custom_app_bar.dart';
import 'package:jeemo_pay/ui/widget/custom_button_load.dart';
import 'package:jeemo_pay/ui/widget/custom_form.dart';
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
          padding: EdgeInsets.symmetric(horizontal: SizeConfig.widthOf(7)),
          child: ListView(
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                "asset/images/jeemo_pay-logo-yellow.png",
                height: 50,
                width: 50,
              ),
              vertical20,
              Center(
                child: Text(
                  "Create a Secure Account",
                  style: txStyle27Bold,
                ),
              ),
              vertical10,
              Center(
                child: Text(
                  "Welcome to the future of payments and sustainability",
                  style: txStyle16,
                ),
              ),
              vertical30,
              CustomTextField(
                  labelText: "Full Name",
                  //hintText: 'Full Name',
                  controller: signUpProvider.firstName,
                  // textInputType: TextInputType.number,
                  readOnly: signUpProvider.disableTextField,
                  validator: (value) => signUpProvider.validateName(value!),
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  onChanged: (text) => signUpProvider.checkSignUp()),
              vertical15,
              CustomTextField(
                  labelText: "Business Name",
                  //hintText: 'Business Name',
                  controller: signUpProvider.middleName,
                  // textInputType: TextInputType.number,

                  readOnly: signUpProvider.disableTextField),
              vertical15,
              CustomTextField(
                  labelText: "Business Reg. No.",
                  //hintText: 'Business Reg. No.',
                  controller: signUpProvider.lastName,
                  readOnly: signUpProvider.disableTextField,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (value) => signUpProvider.validateName(value!),
                  onChanged: (text) => signUpProvider.checkSignUp()),
              vertical15,
              CustomTextField(
                  labelText: "Email",
                  //hintText: 'Email',
                  controller: signUpProvider.email,
                  readOnly: signUpProvider.disableTextField,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (value) => signUpProvider.validateEmail(value!),
                  onChanged: (text) => signUpProvider.checkSignUp()),
              vertical15,
              CustomTextField(
                  labelText: "Phone Number",
                  //hintText: 'Phone Number',
                  controller: signUpProvider.phoneNumber,
                  readOnly: signUpProvider.disableTextField,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (value) =>
                      signUpProvider.validatePhoneNumber(value!),
                  onChanged: (text) => signUpProvider.checkSignUp()),
              vertical30,
              CustomButtonLoad(
                  label: "CREATE ACCOUNT",
                  userProv: signUpProvider.state,
                  onTap: signUpProvider.signupCompleted
                      ? () {
                          if (!_key.currentState!.validate()) return;

                          Get.to(CreatePasswordScreen());
                        }
                      : null),
              vertical30,
              InkWell(
                onTap: () {
                  Get.to(LoginScreen());
                },
                child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    text: 'Already have an account? ',
                    style: txStyle14.copyWith(
                        color: Theme.of(context).iconTheme.color),
                    children: <TextSpan>[
                      TextSpan(
                        text: 'Login',
                        style: txStyle14.copyWith(color: Colors.black),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
