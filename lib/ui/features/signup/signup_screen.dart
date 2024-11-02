import 'package:jeemo_pay/shared/size.dart';
import 'package:jeemo_pay/shared/sizeConfig.dart';
import 'package:jeemo_pay/shared/text_style.dart';
import 'package:jeemo_pay/ui/features/login/login_screen.dart';
import 'package:jeemo_pay/ui/features/signup/create_password_screen.dart';
import 'package:jeemo_pay/ui/features/signup/signup_provider.dart';
import 'package:jeemo_pay/ui/widget/custom_app_bar.dart';
import 'package:jeemo_pay/ui/widget/custom_button_load.dart';
import 'package:jeemo_pay/ui/widget/custom_form.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:provider/provider.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
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
            children: [
              vertical20,
              Center(
                child: Text(
                  "Create Your Account",
                  style: txStyle27Bold,
                ),
              ),
              vertical10,
              Center(
                child: Text(
                  "Join us for a seamless experience",
                  style: txStyle16,
                ),
              ),
              vertical15,
              CustomTextField(
                labelText: "First Name",
                controller: signUpProvider.firstName,
                readOnly: signUpProvider.disableTextField,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (value) => signUpProvider.validateName(value!),
                onChanged: (text) => signUpProvider.checkSignUp(),
              ),
              vertical15,
              CustomTextField(
                labelText: "Last Name",
                controller: signUpProvider.lastName,
                readOnly: signUpProvider.disableTextField,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (value) => signUpProvider.validateName(value!),
                onChanged: (text) => signUpProvider.checkSignUp(),
              ),
              vertical15,
              CustomTextField(
                labelText: "Email",
                controller: signUpProvider.email,
                readOnly: signUpProvider.disableTextField,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (value) => signUpProvider.validateEmail(value!),
                onChanged: (text) => signUpProvider.checkSignUp(),
              ),
              vertical15,
              CustomTextField(
                labelText: "Phone Number",
                controller: signUpProvider.phoneNumber,
                readOnly: signUpProvider.disableTextField,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (value) =>
                    signUpProvider.validatePhoneNumber(value!),
                onChanged: (text) => signUpProvider.checkSignUp(),
              ),
              vertical30,
              CustomButtonLoad(
                label: "CONTINUE",
                userProv: signUpProvider.state,
                onTap: signUpProvider.signupCompleted
                    ? () {
                        if (!_key.currentState!.validate()) return;

                        Get.to(
                            CreatePasswordScreen()); // Navigate to CreatePasswordScreen
                      }
                    : null,
              ),
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
