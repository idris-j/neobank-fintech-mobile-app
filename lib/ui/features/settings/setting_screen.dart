import 'package:jeemo_pay/core/repositories/user_repository.dart';
import 'package:jeemo_pay/shared/colors.dart';
import 'package:jeemo_pay/shared/constant.dart';
import 'package:jeemo_pay/shared/size.dart';
import 'package:jeemo_pay/shared/sizeConfig.dart';
import 'package:jeemo_pay/shared/text_style.dart';
import 'package:jeemo_pay/ui/features/settings/appearance_screen.dart';
import 'package:jeemo_pay/ui/widget/custom_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  @override
  Widget build(BuildContext context) {
    final userProv = Provider.of<UserProvider>(context);

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: SizeConfig.widthOf(5)),
          child: Column(
            children: [
              vertical20,
              Row(
                children: [
                  CustomNetworkImage(
                      imageUrl: userProv
                              .userProfileModel.data?.profilePicture ??
                          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSwsArWf2lZuLGqco6QoGM13keJb078XIgNWA&usqp=CAU",
                      radius: 60),
                  horizontalx10,
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "${userProv.userProfileModel.data?.firstName} ${userProv.userProfileModel.data?.lastName}",
                        style: txStyle20Bold,
                      ),
                      vertical5,
                      Text(
                        userProv.userProfileModel.data?.merchantId ??
                            "loading...",
                        style: txStyle12,
                      ),
                    ],
                  )
                ],
              ),
              vertical20,
              Expanded(
                child: ListView(
                  children: [
                    SettingOptionsWidget(
                      title: "Appearance",
                      image: "asset/svgs/palette.svg",
                      onTap: () {
                        Get.to(AppearanceScreen());
                      },
                    ),
                    vertical10,
                    SettingOptionsWidget(
                      title: "Security",
                      image: "asset/svgs/lock.svg",
                      onTap: () {
                        Get.to(AppearanceScreen());
                      },
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SettingOptionsWidget extends StatelessWidget {
  final String title;
  final String image;
  final VoidCallback onTap;

  const SettingOptionsWidget({
    super.key,
    required this.title,
    required this.image,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(
              color: appPrimaryColor,
            ),
            borderRadius: KBORDERRADIUS),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Row(
            children: [
              SvgPicture.asset(
                image,
                height: 20,
                width: 20,
                color: Theme.of(context).iconTheme.color,
              ),
              horizontalx10,
              Text(
                title,
                style: txStyle16,
              ),
              Spacer(),
              Icon(
                Icons.arrow_forward_ios,
                color: appPrimaryColor,
                size: 15,
              )
            ],
          ),
        ),
      ),
    );
  }
}
