// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:io';

import 'package:jeemo_pay/shared/colors.dart';
import 'package:jeemo_pay/shared/constant.dart';
import 'package:jeemo_pay/shared/responsive_state.dart';
import 'package:jeemo_pay/shared/sizeConfig.dart';
import 'package:jeemo_pay/shared/text_style.dart';
import 'package:jeemo_pay/shared/view_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomButtonLoad extends StatelessWidget {
  const CustomButtonLoad({
    Key? key,
    this.onTap,
    required this.label,
    this.textColor = Colors.white,
    this.buttonColor,
    this.height,
    this.borderColor,
    required this.userProv,
  }) : super(key: key);

  final String label;
  final Color? buttonColor;
  final Color? textColor;
  final double? height;
  final Color? borderColor;
  final VoidCallback? onTap;
  final ViewState userProv;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: userProv == ViewState.Busy ? null : onTap,
      child: Container(
        height: height ?? 50, // Reduced height
        width: 250, // Reduced width
        decoration: BoxDecoration(
          color: onTap == null ? customColor : buttonColor ?? appPrimaryColor,
          border: Border.all(color: borderColor ?? Colors.transparent),
          borderRadius: BUTTONBORDERRADIUS,
        ),
        child: Center(
          child: ResponsiveState(
            state: userProv,
            idleWidget: Text(
              label,
              textAlign: TextAlign.center,
              style: txStyle15.copyWith(
                  color: textColor ?? Colors.white,
                  fontWeight: FontWeight.bold // Make the text bold
                  ),
            ),
            busyWidget: SizedBox(
                height: 20,
                width: 20,
                child: Platform.isIOS
                    ? CupertinoActivityIndicator(
                        radius: 10.0,
                        animating: true,
                        color: Colors.white,
                      )
                    : CircularProgressIndicator(
                        color: Colors.white,
                        strokeWidth: 2,
                      )),
          ),
        ),
      ),
    );
  }
}
