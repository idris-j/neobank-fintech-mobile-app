import 'package:dotted_border/dotted_border.dart';
import 'package:jeemo_pay/shared/colors.dart';
import 'package:jeemo_pay/shared/shared_utils.dart';
import 'package:jeemo_pay/shared/size.dart';
import 'package:jeemo_pay/shared/sizeConfig.dart';
import 'package:jeemo_pay/shared/text_style.dart';
import 'package:jeemo_pay/ui/features/collect_payment/payment_repository.dart';
import 'package:jeemo_pay/ui/widget/custom_app_bar.dart';
import 'package:jeemo_pay/ui/widget/custom_button.dart';
import 'package:jeemo_pay/ui/widget/custom_button_load.dart';
import 'package:jeemo_pay/ui/widget/custom_form.dart';
import 'package:jeemo_pay/ui/widget/money_formatter_widget.dart';
import 'package:jeemo_pay/ui/widget/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/route_manager.dart';
import 'package:provider/provider.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:share_plus/share_plus.dart';

class QrCodeScreen extends StatefulWidget {
  const QrCodeScreen({super.key});

  @override
  State<QrCodeScreen> createState() => _QrCodeScreenState();
}

class _QrCodeScreenState extends State<QrCodeScreen> {
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
      paymentProv?.disposePaymentLink();
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
                  "QR Code",
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
              "Generate QR code for anyone to scan and accept payment",
              style: txStyle14,
            ),
            vertical30,
            Expanded(
              child: ListView(
                children: [
                  Center(
                    child: Text(
                      "Select Qr code type",
                      style: txStyle12.copyWith(color: greyColor),
                    ),
                  ),
                  vertical10,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: () {
                          paymentProvider.toggleQrCodeType("1");
                        },
                        child: Stack(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                        border: Border.all(color: greyColor),
                                        borderRadius: BorderRadius.circular(7)),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10, vertical: 10),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          SvgPicture.asset(
                                            "asset/svgs/nfc.svg",
                                            color: Theme.of(context)
                                                .iconTheme
                                                .color,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  vertical5,
                                  Text(
                                    "Custom\nQr Code",
                                    style: txStyle14,
                                  )
                                ],
                              ),
                            ),
                            paymentProvider.selectedQrCode == "1"
                                ? Positioned(
                                    right: 5,
                                    top: 5,
                                    child: Container(
                                        decoration: BoxDecoration(
                                            color: appPrimaryColor,
                                            shape: BoxShape.circle),
                                        child: Icon(
                                          Icons.done,
                                          size: 15,
                                          color: Colors.white,
                                        )),
                                  )
                                : SizedBox.shrink()
                          ],
                        ),
                      ),
                      horizontalx30,
                      InkWell(
                        onTap: () {
                          paymentProvider.toggleQrCodeType("2");
                        },
                        child: Stack(
                          children: [
                            Column(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                      border: Border.all(color: greyColor),
                                      borderRadius: BorderRadius.circular(7)),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10, vertical: 10),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        SvgPicture.asset(
                                          "asset/svgs/nfc.svg",
                                          color:
                                              Theme.of(context).iconTheme.color,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                vertical5,
                                Text(
                                  "General\nQR Code",
                                  style: txStyle14,
                                )
                              ],
                            ),
                            paymentProvider.selectedQrCode == "2"
                                ? Positioned(
                                    right: 5,
                                    top: 5,
                                    child: Container(
                                        decoration: BoxDecoration(
                                            color: appPrimaryColor,
                                            shape: BoxShape.circle),
                                        child: Icon(
                                          Icons.done,
                                          size: 15,
                                          color: Colors.white,
                                        )),
                                  )
                                : SizedBox.shrink()
                          ],
                        ),
                      ),
                    ],
                  ),
                  vertical30,
                  paymentProvider.selectedQrCode == "2"
                      ? SizedBox.shrink()
                      : Column(
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
                              onChanged: (p0) =>
                                  paymentProvider.checkPaymentLink(),
                              controller: paymentProvider.amountController,

                              // validator: (value) => userProv.validateAmount(value!),
                              decoration: InputDecoration(
                                // prefixText: "₦",
                                hintText: '£50',
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
                            vertical30,
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CustomTextField(
                                  labelText: "Customer email",
                                  hintText: "johndoe@gmail.com",
                                  controller: paymentProvider.emailController,
                                  onChanged: (p0) =>
                                      paymentProvider.checkPaymentLink(),
                                ),
                                vertical5,
                                Text(
                                  "Email provided assist us to send email receipt to customers",
                                  style: txStyle12.copyWith(color: greyColor),
                                )
                              ],
                            ),
                          ],
                        ),
                  vertical30,
                  CustomButtonLoad(
                      userProv: paymentProvider.state,
                      onTap: paymentProvider.paymentLinkCompleted
                          ? () async {
                              bool u =
                                  await paymentProvider.generatePaymentLink();
                              if (u) {
                                Get.to(GeneratedQrCodeScreen());
                              }
                            }
                          : null,
                      label: "Generate QR Code")
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class GeneratedQrCodeScreen extends StatefulWidget {
  const GeneratedQrCodeScreen({super.key});

  @override
  State<GeneratedQrCodeScreen> createState() => _GeneratedQrCodeScreenState();
}

class _GeneratedQrCodeScreenState extends State<GeneratedQrCodeScreen> {
  PaymentProvider? paymentProv;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      paymentProv = Provider.of<PaymentProvider>(context, listen: false);
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
                "Qr Code",
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
          vertical30,
          DottedBorder(
            borderType: BorderType.RRect,
            radius: const Radius.circular(10),
            dashPattern: [8, 4],
            color: appPrimaryColor,
            child: ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(7)),
              child: Container(
                decoration: BoxDecoration(
                  color: appPrimaryColor.withOpacity(.2),
                ),
                child: QrImageView(
                  //         dataModuleStyle: QrDataModuleStyle(
                  // color: Theme.of(context).iconTheme.color,

                  //         ),

                  embeddedImageStyle: const QrEmbeddedImageStyle(),
                  data:
                      '${paymentProvider.generateLinkModel.body?.data?.authUrl}',
                  version: QrVersions.auto,
                  size: SizeConfig.heightOf(27),
                ),
              ),
            ),
          ),
          vertical10,
          Text(
            "Powerd and secured by FlutterWave",
            style: txStyle12,
          ),
          vertical30,
          Row(
            children: [
              Expanded(child: CustomButton(onTap: () {}, label: "Share")),
              horizontalx10,
              Expanded(
                  child: CustomButton(
                      buttonColor: Colors.transparent,
                      borderColor: appPrimaryColor,
                      textColor: appPrimaryColor,
                      onTap: () {},
                      label: "Download")),
            ],
          )
        ]),
      ),
    );
  }
}
