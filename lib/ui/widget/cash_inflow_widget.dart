import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jeemo_pay/shared/colors.dart';
import 'package:jeemo_pay/shared/constant.dart';
import 'package:jeemo_pay/shared/size.dart';
import 'package:jeemo_pay/shared/text_style.dart';
import 'package:jeemo_pay/ui/features/analytics/cash_in_flow_analytics_screen.dart';
import 'package:jeemo_pay/ui/widget/utils.dart';

class CashInflowWidget extends StatelessWidget {
  const CashInflowWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.to(const CashInflowScreen());
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white, // White background
          borderRadius: BorderRadius.circular(10), // Smooth border radius
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 2,
              blurRadius: 5,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Your cash inflow",
                style: txStyle12.copyWith(color: appSecondaryColor),
              ),
              vertical5,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    convertStringToCurrency("450000"),
                    style: txStyle25Bold.copyWith(color: appPrimaryColor),
                  ),
                  Text(
                    "+20.5%",
                    style: txStyle20Bold.copyWith(color: customColor),
                  ),
                ],
              ),
              vertical20,
              // "View Analytics" text is kept visible
              Text(
                "View Analytics",
                style: txStyle12.copyWith(color: appPrimaryColor),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
