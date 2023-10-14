import 'package:payprice/shared/colors.dart';
import 'package:payprice/shared/responsive_state.dart';
import 'package:payprice/shared/size.dart';
import 'package:payprice/shared/text_style.dart';
import 'package:payprice/shared/view_state.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomAlertModal extends StatefulWidget {
  final VoidCallback confirm;
  final String confirmText;
  final String cancelText;
  final String content;
  final String title;
  final bool hasButton;
  final bool hasCancelButton;
  final ViewState userProv;
  const CustomAlertModal({
    super.key,
    required this.confirm,
    required this.confirmText,
    required this.cancelText,
    required this.content,
    required this.title,
    this.hasButton = true,
    this.hasCancelButton = true,
    required this.userProv,
  });

  @override
  State<CustomAlertModal> createState() => _CustomAlertModalState();
}

class _CustomAlertModalState extends State<CustomAlertModal> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Center(child: Text(widget.title)),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ResponsiveState(
            state: widget.userProv,
            idleWidget: Text(
              widget.content,
              textAlign: TextAlign.left,
              style: txStyle14.copyWith(height: 1.5),
            ),
            busyWidget: const Center(
              child: CircularProgressIndicator(
                strokeWidth: 6,
                color: appPrimaryColor,
              ),
            ),
          ),
        ],
      ),
      actions: [
        widget.hasButton
            ? Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    widget.hasCancelButton
                        ? Row(
                            children: [
                              InkWell(
                                onTap: () {
                                  Get.back();
                                },
                                child: Container(
                                  height: 35,
                                  width: 100,
                                  decoration: BoxDecoration(
                                    color: Colors.transparent,
                                    border: Border.all(color: appPrimaryColor),
                                    borderRadius: BorderRadius.circular(7),
                                  ),
                                  child: Center(
                                      child: Text(
                                    widget.cancelText,
                                    style: txStyle14,
                                  )),
                                ),
                              ),
                              horizontalx10,
                            ],
                          )
                        : const SizedBox.shrink(),
                    InkWell(
                      onTap: widget.confirm,
                      child: Container(
                        height: 35,
                        width: 100,
                        decoration: BoxDecoration(
                          color: appPrimaryColor,
                          border: Border.all(color: appPrimaryColor),
                          borderRadius: BorderRadius.circular(7),
                        ),
                        child: Center(
                            child: Text(
                          widget.confirmText,
                          style: txStyle14wt,
                        )),
                      ),
                    ),
                  ],
                ),
              )
            : const SizedBox.shrink()
      ],
    );
  }
}
