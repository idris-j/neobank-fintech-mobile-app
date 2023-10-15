import 'package:payprice/core/repositoies/user_repository.dart';
import 'package:payprice/shared/colors.dart';
import 'package:payprice/shared/constant.dart';
import 'package:payprice/shared/size.dart';
import 'package:payprice/shared/sizeConfig.dart';
import 'package:payprice/shared/text_style.dart';
import 'package:payprice/ui/features/collect_payment/collect_payment_screen.dart';
import 'package:payprice/ui/widget/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/route_manager.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: SizeConfig.widthOf(5)),
          child: Column(
            children: [
              vertical20,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        getGreeting(),
                        style: txStyle25Bold,
                      ),
                      Text(
                        userProvider.userProfileModel.data?.lastName ?? "User",
                        style: txStyle25Bold,
                      ),
                    ],
                  ),
                  Container(
                    width: SizeConfig.widthOf(30),
                    decoration: BoxDecoration(
                      // color: greyColor,
                      border: Border.all(color: greyColor),
                      borderRadius: KBORDERRADIUS,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 5, vertical: 5),
                      child: Row(children: [
                        Expanded(
                          child: Text(
                            userProvider.userProfileModel.data?.merchantId ??
                                "loading...",
                            style: txStyle12,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        horizontalx5,
                        Icon(
                          Icons.copy,
                          size: 15,
                          color: appPrimaryColor,
                        )
                      ]),
                    ),
                  )
                ],
              ),
              vertical5,
              Divider(),
              vertical20,
              Expanded(
                child: RefreshIndicator(
                  onRefresh: () async {
                    await userProvider.fetchUserProfile();
                  },
                  child: ListView(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            border: Border.all(color: appPrimaryColor),
                            borderRadius: KBORDERRADIUS),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Your total balance",
                                style: txStyle12,
                              ),
                              vertical5,
                              Text(
                                convertStringToCurrency("1350000"),
                                style: txStyle25Bold,
                              ),
                              vertical10,
                              SizedBox(
                                height: 20,
                                child: ListView(
                                  scrollDirection: Axis.horizontal,
                                  children: [
                                    PaymentBreakdownWidget(
                                      image: "asset/svgs/qrcode.svg",
                                      value: convertStringToCurrency("25000"),
                                    ),
                                    horizontalx10,
                                    PaymentBreakdownWidget(
                                      image: "asset/svgs/nfc.svg",
                                      value: convertStringToCurrency("15000"),
                                    ),
                                    horizontalx10,
                                    PaymentBreakdownWidget(
                                      image: "asset/svgs/link.svg",
                                      value: convertStringToCurrency("57000"),
                                    ),
                                    horizontalx10,
                                    PaymentBreakdownWidget(
                                      image: "asset/svgs/pig-money.svg",
                                      value: convertStringToCurrency("17000"),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      vertical30,
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: SizeConfig.widthOf(10)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            quickActionWidget(
                              title: "Receive",
                              image: "asset/svgs/hand-coins.svg",
                              onTap: () {
                                Get.to(CollectPaymentScreen());
                              },
                            ),
                            quickActionWidget(
                              title: "Send",
                              image: "asset/svgs/send.svg",
                              onTap: () {},
                            ),
                            quickActionWidget(
                              title: "Details",
                              image: "asset/svgs/user-plus.svg",
                              onTap: () {},
                            ),
                            quickActionWidget(
                              title: "Connect",
                              image: "asset/svgs/user-plus.svg",
                              onTap: () {},
                            ),
                          ],
                        ),
                      ),
                      vertical30,
                      vertical30,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Payment History",
                            style: txStyle14Bold,
                          ),
                          Row(
                            children: [
                              Text(
                                "See more",
                                style: txStyle12.copyWith(color: greyColor),
                              ),
                              horizontalx5,
                              Icon(
                                Icons.arrow_forward_ios,
                                color: greyColor,
                                size: 10,
                              )
                            ],
                          ),
                        ],
                      ),
                      vertical20,
                      ListView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: 3,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.only(bottom: 20),
                              child: Row(
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                        // shape: BoxShape.circle,
                                        borderRadius: BorderRadius.circular(5),
                                        border:
                                            Border.all(color: appPrimaryColor)),
                                    child: Padding(
                                      padding: const EdgeInsets.all(5),
                                      child: SvgPicture.asset(
                                        "asset/svgs/link.svg",
                                        height: 20,
                                        width: 20,
                                      ),
                                    ),
                                  ),
                                  horizontalx10,
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        convertStringToCurrency("5000"),
                                        style: txStyle12Bold,
                                      ),
                                      vertical5,
                                      Text(
                                        "${convertDateTimeDisplay(DateTime.now().toString())} • ${convertTimeDisplay(DateTime.now().toString())}",
                                        style: txStyle12,
                                      )
                                    ],
                                  )
                                ],
                              ),
                            );
                          }),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class PaymentBreakdownWidget extends StatelessWidget {
  final String image;
  final String value;

  const PaymentBreakdownWidget({
    super.key,
    required this.image,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(
          image,
          height: 15,
          width: 15,
          color: Theme.of(context).iconTheme.color,
        ),
        horizontalx5,
        Text(
          value,
          style: txStyle12Bold,
        ),
      ],
    );
  }
}

class quickActionWidget extends StatelessWidget {
  final String title;
  final String image;
  final VoidCallback onTap;

  const quickActionWidget({
    super.key,
    required this.title,
    required this.image,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
                border: Border.all(color: appPrimaryColor),
                borderRadius: KBORDERRADIUS),
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Center(
                child: SvgPicture.asset(
                  image,
                  height: 25,
                  width: 25,
                  color: Theme.of(context).iconTheme.color,
                ),
              ),
            ),
          ),
          vertical10,
          Text(
            title,
            style: txStyle13,
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }
}



// class LoanProgressWidget extends StatelessWidget {
//   final String total;
//   final String amountPaid;

//   const LoanProgressWidget(
//       {super.key, required this.total, required this.amountPaid});

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         Row(
//           children: [
//             Text(
//               "${convertStringToCurrency(amountPaid.toString())} / ",
//               style: txStyle12,
//             ),
//             Text(convertStringToCurrency(total.toString()), style: txStyle12),
//           ],
//         ),
//         vertical5,
//         FAProgressBar(
//           currentValue: double.tryParse(amountPaid)!,
//           maxValue: double.tryParse(total)!,
//           size: 10,
//           border: Border.all(color: appPrimaryColor.withOpacity(.5)),
//           progressColor: Colors.green,
//         )
//       ],
//     );
//   }
// }