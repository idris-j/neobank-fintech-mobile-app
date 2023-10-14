import 'package:flutter/material.dart';
import 'package:pin_code_text_field/pin_code_text_field.dart';

import '../../shared/colors.dart';
import '../../shared/sizeConfig.dart';
import '../../shared/text_style.dart';

class PINCodeInput extends StatefulWidget {
  const PINCodeInput(
      {Key? key,
      required this.next,
      this.error = false,
      required this.controller,
      required this.inputLenght,
      this.onChanged})
      : super(key: key);
  final int inputLenght;
  final bool error;
  final VoidCallback next;
  final controller;
  final String? Function(String?)? onChanged;

  @override
  _PINCodeInputState createState() => _PINCodeInputState();
}

class _PINCodeInputState extends State<PINCodeInput> {
//int pinLength = 6;
  late String errorMessage;

  @override
  Widget build(BuildContext context) {
    return PinCodeTextField(
      autofocus: true,
      onTextChanged: widget.onChanged,
      controller: widget.controller,
      highlight: true,
      hideCharacter: true,
      pinBoxColor: Colors.transparent,
      highlightColor: appPrimaryColor,
      defaultBorderColor: Theme.of(context).splashColor,
      hasTextBorderColor: Color(0xff6C757D),
      highlightPinBoxColor: Colors.transparent,
      maxLength: widget.inputLenght,
      hasError: widget.error,
      onDone: (text) {
        exec();
      },
      pinBoxWidth: SizeConfig.widthOf(12),
      pinBoxHeight: SizeConfig.heightOf(6),
      wrapAlignment: WrapAlignment.spaceAround,
      pinTextStyle: txStyle14,
      pinBoxBorderWidth: 1,
      pinBoxRadius: 8,
      keyboardType: TextInputType.number,
    );
  }

  exec() => widget.next();
  String getInput(String text) {
    return text;
  }
}
