import 'package:flutter/material.dart';
import 'package:get/get.dart'; // Import Get package
import 'package:lottie/lottie.dart';
import 'package:jeemo_pay/shared/size.dart';
import 'package:jeemo_pay/shared/text_style.dart';

class HomeCardSectionWidget extends StatelessWidget {
  final String title;
  final String description;
  final String lottieAsset;
  final Color backgroundColor;
  final VoidCallback onTap;

  const HomeCardSectionWidget({
    super.key,
    required this.title,
    required this.description,
    required this.lottieAsset,
    required this.backgroundColor,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(10),
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
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: txStyle14.copyWith(color: Colors.white),
              ),
              vertical10,
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SizedBox(
                    height: 100,
                    child: Lottie.asset(lottieAsset),
                  ),
                ],
              ),
              vertical10,
              Text(
                description,
                style: txStyle13.copyWith(color: Colors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
