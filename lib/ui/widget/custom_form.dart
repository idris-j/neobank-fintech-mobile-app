// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:jeemo_pay/shared/colors.dart';
import 'package:jeemo_pay/shared/constant.dart';
import 'package:jeemo_pay/shared/size.dart';
import 'package:jeemo_pay/shared/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextField extends StatefulWidget {
  final bool darkenText;
  final bool? hasLeading;
  final bool? isDate;
  final bool isCard;
  final bool? readOnly;
  final bool? changePhoneNumber;
  final int? maxLines;
  final Widget? prefix;
  final String? hintText;
  final String? labelText;
  final bool? hasBorder;
  final String? Function(String?)? validator;
  final bool obscureText;
  final Widget? suffixIcon;
  final VoidCallback? onTap;
  final String? imgUri;
  final TextInputFormatter? formatters;
  final TextEditingController? controller;
  final TextInputAction? textInputAction;
  final TextInputType? textInputType;
  final AutovalidateMode? autovalidateMode;
  final String? Function(String?)? onChanged;

  ///labelText cannot be used when hintText is used
  const CustomTextField({
    Key? key,
    this.hasLeading = false,
    this.isDate = false,
    this.isCard = false,
    this.readOnly = false,
    this.changePhoneNumber = false,
    this.formatters,
    this.maxLines,
    this.validator,
    this.prefix,
    this.hintText,
    this.labelText,
    this.hasBorder,
    this.obscureText = false,
    this.suffixIcon,
    this.onTap,
    this.imgUri,
    this.controller,
    this.textInputAction = TextInputAction.done,
    this.textInputType,
    this.autovalidateMode,
    this.onChanged,
    this.darkenText = false,
  }) : super(key: key);

  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool hide = false;
  FocusNode myFocusNode = FocusNode();
  @override
  void initState() {
    super.initState();
    hide = widget.obscureText;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "${widget.labelText}",
          style: txStyle14,
        ),
        vertical5,
        Container(
          color: Color(0xffF9FAFB),
          child: Row(
            children: [
              Expanded(
                child: TextFormField(
                  focusNode: myFocusNode,
                  autocorrect: false,
                  inputFormatters: [
                    widget.formatters ?? FilteringTextInputFormatter.deny(''),
                  ],
                  autovalidateMode: widget.autovalidateMode,
                  keyboardType: widget.textInputType,
                  textInputAction: widget.textInputAction,
                  readOnly: widget.readOnly!,
                  controller: widget.controller,
                  onTap: widget.onTap,
                  obscureText: hide,
                  obscuringCharacter: '•',
                  maxLines: widget.maxLines ?? 1,
                  validator: widget.validator,
                  onChanged: widget.onChanged,
                  style: txStyle16,
                  cursorColor: Colors.black,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(horizontal: 10),
                    prefixIcon: widget.prefix,
                    // isDense: true,
                    fillColor: Colors.red,
                    filled: false,
                    hintText: widget.hintText,
                    hintStyle: txStyle16.copyWith(
                        color: widget.darkenText
                            ? Theme.of(context).iconTheme.color
                            : Colors.grey),
                    border: InputBorder.none,

                    // enabledBorder: OutlineInputBorder(
                    //   borderSide:
                    //       BorderSide(color: Color(0xff667080).withOpacity(0.4)),
                    //   borderRadius: BorderRadius.all(Radius.circular(10)),
                    // ),
                    // border: OutlineInputBorder(
                    //   borderRadius: BorderRadius.all(Radius.circular(8)),
                    // ),
                    // suffixIcon: Icon(Icons.visibility_off)
                  ),
                ),
              ),
              widget.obscureText
                  ? Row(
                      children: [
                        // horizontalx10,
                        InkWell(
                          onTap: () {
                            setState(() {
                              hide = !hide;
                            });
                          },
                          child: hide
                              ? const Icon(
                                  Icons.visibility_outlined,
                                  size: 20,
                                  color: appPrimaryColor,
                                )
                              : const Icon(
                                  Icons.visibility_off_outlined,
                                  size: 20,
                                  color: appPrimaryColor,
                                ),
                        ),
                      ],
                    )
                  : widget.suffixIcon != null
                      ? widget.suffixIcon!
                      : const SizedBox.shrink()
            ],
          ),
        ),
      ],
    );
  }
}
