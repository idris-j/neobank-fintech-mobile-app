import 'package:dotted_border/dotted_border.dart';
import 'package:payprice/shared/colors.dart';
import 'package:payprice/shared/shared_utils.dart';
import 'package:payprice/shared/size.dart';
import 'package:payprice/shared/sizeConfig.dart';
import 'package:payprice/shared/text_style.dart';
import 'package:payprice/ui/features/collect_payment/payment_repository.dart';
import 'package:payprice/ui/widget/custom_app_bar.dart';
import 'package:payprice/ui/widget/custom_button.dart';
import 'package:payprice/ui/widget/custom_button_load.dart';
import 'package:payprice/ui/widget/custom_form.dart';
import 'package:payprice/ui/widget/money_formatter_widget.dart';
import 'package:payprice/ui/widget/pinCode_field%20copy.dart';
import 'package:payprice/ui/widget/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/route_manager.dart';
import 'package:lottie/lottie.dart';
import 'package:pin_code_text_field/pin_code_text_field.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';

class NFCScreen extends StatefulWidget {
  const NFCScreen({super.key});

  @override
  State<NFCScreen> createState() => _NFCScreenState();
}

class _NFCScreenState extends State<NFCScreen> {
  late FocusNode myFocusNode;
  PaymentProvider? paymentProv;

  @override
  void initState() {
    super.initState();
    myFocusNode = FocusNode();
    myFocusNode.requestFocus();
    paymentProv = Provider.of<PaymentProvider>(context, listen: false);
  }

  @override
  void dispose() {
    // Clean up the focus node when the Form is disposed.
    WidgetsBinding.instance.addPostFrameCallback((_) {
      myFocusNode.dispose();
      paymentProv?.disposeNFC();
    });
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final paymentProvider = Provider.of<PaymentProvider>(context);

    return Scaffold(
      appBar: CustomAppBar(),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: SizeConfig.widthOf(5)),
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  "NFC",
                  style: txStyle27Bold,
                ),
                horizontalx5,
                Icon(
                  Icons.info_outline,
                  size: 15,
                  color: greyColor,
                )
              ],
            ),
            vertical10,
            Text(
              "A secure method for charging users through their debit cards.",
              style: txStyle14,
            ),
            vertical30,
            Expanded(
              child: ListView(
                children: [
                  Column(
                    children: [
                      Text(
                        "How much are you receiving",
                        style: txStyle12.copyWith(color: greyColor),
                      ),
                      TextFormField(
                        focusNode: myFocusNode,
                        textAlign: TextAlign.center,
                        cursorColor: appPrimaryColor,
                        style: txStyle27Bold,
                        keyboardType: TextInputType.number,
                        // controller: amountController,
                        inputFormatters: [MoneyFormatter()],
                        onChanged: (p0) => paymentProvider.checkNFCPayment(),
                        controller: paymentProvider.nfcAmountController,

                        // validator: (value) => userProv.validateAmount(value!),
                        decoration: InputDecoration(
                          // prefixText: "₦",
                          hintText: '₦5000',
                          hintStyle: txStyle27Bold.copyWith(
                              color: appPrimaryColor.withOpacity(0.2),
                              fontSize: 30),
                          border: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          errorBorder: InputBorder.none,
                          disabledBorder: InputBorder.none,
                        ),
                      ),
                    ],
                  ),
                  vertical30,
                  CustomButtonLoad(
                      userProv: paymentProvider.state,
                      onTap: paymentProvider.nfcCompleted
                          ? () async {
                              Get.to(ReadCardScreen());
                            }
                          : null,
                      label: "Proceed")
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class ReadCardScreen extends StatefulWidget {
  const ReadCardScreen({super.key});

  @override
  State<ReadCardScreen> createState() => _ReadCardScreenState();
}

class _ReadCardScreenState extends State<ReadCardScreen> {
  PaymentProvider? paymentProv;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      paymentProv = Provider.of<PaymentProvider>(context, listen: false);
      Future.delayed(Duration(seconds: 3), () {
        showCustomBottomSheet(ReadCardDetailsSheet(), context);
      });
    });
  }

  @override
  void dispose() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      paymentProv?.disposeGeneratedPaymentLink();
    });
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final paymentProvider = Provider.of<PaymentProvider>(context);

    return Scaffold(
      appBar: CustomAppBar(),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: SizeConfig.widthOf(5)),
        child: Column(children: [
          Row(
            children: [
              Text(
                "NFC",
                style: txStyle27Bold,
              ),
              horizontalx5,
              Icon(
                Icons.info_outline,
                size: 15,
                color: greyColor,
              )
            ],
          ),
          vertical10,
          Text(
            "Please request the customer's card and tap it against the back of your phone.",
            style: txStyle14,
          ),
          vertical30,
          Lottie.asset("asset/lottie/nfc.json", height: 300, width: 300),
        ]),
      ),
    );
  }
}

class ReadCardDetailsSheet extends StatelessWidget {
  const ReadCardDetailsSheet({super.key});

  @override
  Widget build(BuildContext context) {
    final paymentProvider = Provider.of<PaymentProvider>(context);
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: SizeConfig.widthOf(5), vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "Customer Card",
            style: txStyle27Bold,
          ),
          vertical30,
          Text(
            "Card Number",
            style: txStyle14.copyWith(color: greyColor),
          ),
          Text(
            "2188 *** *** *** *** 4545",
            style: txStyle14,
          ),
          vertical50,
          CustomButtonLoad(
            label: "Initiate Card Charge",
            userProv: paymentProvider.state,
            onTap: () async {
              bool u = await paymentProvider.chargeCard();
              if (u) {
                Get.close(3);
                Get.off(UserOtpScreen());
              }
            },
          ),
          vertical30,
        ],
      ),
    );
  }
}

class UserOtpScreen extends StatelessWidget {
  const UserOtpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final paymentProvider = Provider.of<PaymentProvider>(context);

    return Scaffold(
      appBar: CustomAppBar(),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: SizeConfig.widthOf(5)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "User Verification",
              style: txStyle27Bold,
            ),
            vertical10,
            Text(
              "A 4-digit code has been sent to the user. Please request the OTP and enter it.",
              style: txStyle14,
            ),
            vertical30,
            Center(
              child: PINCodeInput(
                inputLenght: 4,
                error: false,
                next: () async {
                  Get.off(NFCCompleted());
                },
                controller: paymentProvider.nfcOTPController,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class NFCCompleted extends StatelessWidget {
  const NFCCompleted({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: SizeConfig.widthOf(5)),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Lottie.asset("asset/lottie/done.json",
                  height: 300, width: 300, repeat: false),
              vertical20,
              Text(
                "Charge Completed",
                style: txStyle27Bold,
              ),
              vertical10,
              Text(
                "You will be notified shortly",
                style: txStyle14,
              ),
              vertical30,
              CustomButton(
                  onTap: () {
                    Get.close(1);
                  },
                  label: "Done")
            ],
          ),
        ),
      ),
    );
  }
}
