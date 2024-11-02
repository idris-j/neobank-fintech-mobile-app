import 'package:dotted_border/dotted_border.dart';
import 'package:jeemo_pay/shared/colors.dart';
import 'package:jeemo_pay/shared/shared_utils.dart';
import 'package:jeemo_pay/shared/size.dart';
import 'package:jeemo_pay/shared/sizeConfig.dart';
import 'package:jeemo_pay/shared/text_style.dart';
import 'package:jeemo_pay/ui/features/collect_payment/payment_provider.dart';
import 'package:jeemo_pay/ui/widget/custom_app_bar.dart';
import 'package:jeemo_pay/ui/widget/custom_button.dart';
import 'package:jeemo_pay/ui/widget/custom_button_load.dart';
import 'package:jeemo_pay/ui/widget/custom_form.dart';
import 'package:jeemo_pay/ui/widget/money_formatter_widget.dart';
import 'package:jeemo_pay/ui/widget/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/route_manager.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';

class PaymentLinkScreen extends StatefulWidget {
  const PaymentLinkScreen({super.key});

  @override
  State<PaymentLinkScreen> createState() => _PaymentLinkScreenState();
}

class _PaymentLinkScreenState extends State<PaymentLinkScreen> {
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
                  "Payment Link",
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
              "Create a personalized payment link for individuals to use for making payments.",
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
                        onChanged: (p0) => paymentProvider.checkPaymentLink(),
                        controller: paymentProvider.amountController,

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
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomTextField(
                        labelText: "Customer email",
                        hintText: "johndoe@gmail.com",
                        controller: paymentProvider.emailController,
                        onChanged: (p0) => paymentProvider.checkPaymentLink(),
                      ),
                      vertical5,
                      Text(
                        "Email provided assist us to send email receipt to customers",
                        style: txStyle12.copyWith(color: greyColor),
                      )
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
                                Get.to(GeneratedLinkScreen());
                              }
                            }
                          : null,
                      label: "Generate link")
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class GeneratedLinkScreen extends StatefulWidget {
  const GeneratedLinkScreen({super.key});

  @override
  State<GeneratedLinkScreen> createState() => _GeneratedLinkScreenState();
}

class _GeneratedLinkScreenState extends State<GeneratedLinkScreen> {
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
                "Payment Link",
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
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          "${paymentProvider.generateLinkModel.body?.data?.authUrl}",
                          overflow: TextOverflow.ellipsis,
                          style: txStyle14Bold,
                        ),
                      ),
                      horizontalx10,
                      InkWell(
                        onTap: () async {
                          await Clipboard.setData(ClipboardData(
                              text:
                                  "${paymentProvider.generateLinkModel.body?.data?.authUrl}"));
                          // ignore: use_build_context_synchronously
                          displayInfo(
                              error: "Payment link",
                              message: "Link copied",
                              icons: Icon(Icons.done));
                          // customFlutterToast(
                          //     "Referral cose copied to clipboard", context);
                        },
                        child: const Icon(Icons.copy,
                            color: appPrimaryColor, size: 18),
                      ),
                      horizontalx20,
                      InkWell(
                        onTap: () {
                          Share.share(
                              "Hello there 👋, please make a payment of ${convertStringToCurrency(paymentProvider.amountController.text.replaceAll(",", ""))} using this link \n${paymentProvider.generateLinkModel.body?.data?.authUrl} \n\n powered by jeemo_pay");
                        },
                        child: const Icon(Icons.share_outlined,
                            color: appPrimaryColor, size: 18),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
