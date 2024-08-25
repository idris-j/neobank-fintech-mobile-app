import 'package:jeemo_pay/shared/colors.dart';
import 'package:jeemo_pay/shared/size.dart';
import 'package:jeemo_pay/shared/sizeConfig.dart';
import 'package:jeemo_pay/shared/text_style.dart';
import 'package:jeemo_pay/ui/features/collect_payment/customlink_screen.dart';
import 'package:jeemo_pay/ui/features/collect_payment/nfc_screen.dart';
import 'package:jeemo_pay/ui/features/collect_payment/qrcode_screen.dart';
import 'package:jeemo_pay/ui/widget/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/route_manager.dart';

class CollectPaymentScreen extends StatefulWidget {
  const CollectPaymentScreen({super.key});

  @override
  State<CollectPaymentScreen> createState() => _CollectPaymentScreenState();
}

class _CollectPaymentScreenState extends State<CollectPaymentScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: SizeConfig.widthOf(5)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Collect Payment",
              style: txStyle27Bold,
            ),
            vertical10,
            Text(
              "Take payments using our collection of secure and convenient channels.",
              style: txStyle14,
            ),
            vertical30,
            Expanded(
              child: ListView(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: SizeConfig.widthOf(10)),
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        // runSpacing: SizeConfig.widthOf(5),
                        // spacing: SizeConfig.widthOf(5),
                        children: [
                          InkWell(
                            onTap: () {
                              Get.to(NFCScreen());
                            },
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
                                          color:
                                              Theme.of(context).iconTheme.color,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                vertical5,
                                Text(
                                  "NFC",
                                  style: txStyle14,
                                )
                              ],
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              Get.to(QrCodeScreen());
                            },
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
                                          "asset/svgs/qrcode.svg",
                                          color:
                                              Theme.of(context).iconTheme.color,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                vertical5,
                                Text(
                                  "QR\nCode",
                                  style: txStyle14,
                                  textAlign: TextAlign.center,
                                )
                              ],
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              Get.to(PaymentLinkScreen());
                            },
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
                                          "asset/svgs/link.svg",
                                          color:
                                              Theme.of(context).iconTheme.color,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                vertical5,
                                Text(
                                  "Custom\nLink",
                                  style: txStyle14,
                                  textAlign: TextAlign.center,
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
