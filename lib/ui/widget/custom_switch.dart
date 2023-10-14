import 'package:payprice/shared/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';

class SwitchToggle extends StatefulWidget {
  final bool serviceToggle;

  final Function(bool value) function;

  const SwitchToggle({
    super.key,
    required this.serviceToggle,
    required this.function,
  });

  @override
  State<SwitchToggle> createState() => _SwitchToggleState();
}

class _SwitchToggleState extends State<SwitchToggle> {
  @override
  Widget build(BuildContext context) {
    return FlutterSwitch(
        width: 43,
        height: 25,
        toggleSize: 20.0,
        valueFontSize: 12,
        value: widget.serviceToggle,
        borderRadius: 30.0,
        activeColor: appPrimaryColor,
        onToggle: widget.function);
  }
}
