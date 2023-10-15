// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:io';

import 'package:payprice/shared/colors.dart';
import 'package:payprice/shared/constant.dart';
import 'package:payprice/shared/responsive_state.dart';
import 'package:payprice/shared/sizeConfig.dart';
import 'package:payprice/shared/text_style.dart';
import 'package:payprice/shared/view_state.dart';
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
        height: height ?? 60,
        width: 350,
        decoration: BoxDecoration(
          color: onTap == null ? Colors.black : buttonColor ?? appPrimaryColor,
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
                  color: textColor ?? Colors.black,
                  fontWeight: FontWeight.w500),
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
