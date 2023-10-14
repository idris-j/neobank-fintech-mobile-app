import 'dart:developer';

import 'package:payprice/core/api/api_utils/network_exception.dart';
import 'package:payprice/core/api/user_api/user_api.dart';
import 'package:payprice/core/data_models/generae_link_model.dart';
import 'package:payprice/shared/base_view_model.dart';
import 'package:payprice/shared/locator.dart';
import 'package:payprice/shared/shared_utils.dart';
import 'package:payprice/shared/validator.dart';
import 'package:payprice/shared/view_state.dart';
import 'package:flutter/material.dart';

class PaymentProvider extends BaseNotifier with Validators {
  var userApi = locator<UserApi>();
  GenerateLinkModel generateLinkModel = GenerateLinkModel();

  TextEditingController amountController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  bool paymentLinkCompleted = false;

  bool nfcCompleted = false;
  TextEditingController nfcAmountController = TextEditingController();
  TextEditingController nfcOTPController = TextEditingController();


  checkNFCPayment() {
    if (nfcAmountController.text.isNotEmpty) {
      nfcCompleted = true;
      notifyListeners();
      return;
    }
    nfcCompleted = false;
    notifyListeners();
  }

  Future<bool> chargeCard() async {
    setState(ViewState.Busy);
    try {
      await Future.delayed(Duration(seconds: 3));
      setState(ViewState.Idle);
      return true;
    } catch (e) {
      setState(ViewState.Idle);
    }
    return false;
  }

  String selectedQrCode = "1";

  toggleQrCodeType(String text) {
    selectedQrCode = text;
    notifyListeners();
    checkPaymentLink();
  }

  checkPaymentLink() {
    if (amountController.text.isNotEmpty &&
        emailController.text.isNotEmpty &&
        selectedQrCode == "1") {
      paymentLinkCompleted = true;
      notifyListeners();
      return;
    }
    if (selectedQrCode == "2") {
      paymentLinkCompleted = true;
      notifyListeners();
      return;
    }
    paymentLinkCompleted = false;
    notifyListeners();
  }

  Future<bool> generatePaymentLink() async {
    setState(ViewState.Busy);
    try {
      generateLinkModel = await userApi.generateLink(
          amount: amountController.text.replaceAll(",", ""),
          email: emailController.text);
      setState(ViewState.Idle);
      return true;
    } on NetworkException {
      displayInfo(
          error: 'No Internet!',
          message: 'Please check your internet Connection');
    } catch (e) {
      displayInfo(error: "Error!", message: "$e");
      log("$e");
    }
    setState(ViewState.Idle);
    return false;
  }

  disposeGeneratedPaymentLink() {
    generateLinkModel = GenerateLinkModel();
    notifyListeners();
  }

  disposePaymentLink() {
    amountController.text = "";
    emailController.text = "";
    paymentLinkCompleted = false;
    notifyListeners();
  }

  disposeNFC() {
    nfcAmountController.text = "";
    nfcCompleted = false;
    notifyListeners();
  }
}
