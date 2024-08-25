import 'package:jeemo_pay/shared/colors.dart';
import 'package:jeemo_pay/shared/sizeConfig.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/snackbar/snackbar_controller.dart';

SnackbarController displayInfo(
    {required String error, required String message, Widget? icons}) {
  SnackbarController controller = Get.snackbar(
    "",
    message,
    maxWidth: SizeConfig.screenWidth,
    margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
    snackStyle: SnackStyle.FLOATING,
    snackPosition: SnackPosition.TOP,
    borderRadius: 8,
    borderColor: appPrimaryColor,
    borderWidth: 1,
    colorText: Get.theme.iconTheme.color,
    backgroundColor: appPrimaryColor.withOpacity(0.3),
    titleText: SizedBox.shrink(),
    icon: icons ??
        Icon(
          Icons.error_outline,
          color: Get.theme.iconTheme.color,
        ),
  );
  return controller;
}
