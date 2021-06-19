import 'package:flutter/material.dart';
import 'package:flutter_neumorphic_null_safety/flutter_neumorphic.dart';
import 'package:flutter_otoczka/core/style/colors.dart';
import 'package:flutter_otoczka/generated/l10n.dart';

class CalculatorTitle extends StatelessWidget {
  const CalculatorTitle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return NeumorphicText(
      S.of(context).appTitle,
      style: NeumorphicStyle(
        depth: 1.5,
        intensity: 200,
        color: defaultTextColor,
      ),
      textStyle: NeumorphicTextStyle(
        fontSize: 32,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
