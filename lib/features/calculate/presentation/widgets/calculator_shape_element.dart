import 'package:flutter/material.dart';
import 'package:flutter_neumorphic_null_safety/flutter_neumorphic.dart';
import 'package:flutter_otoczka/core/style/colors.dart';
import 'package:flutter_otoczka/features/calculate/domain/entities/shape.dart';
import 'package:flutter_otoczka/core/style/text_styles.dart';
import 'package:flutter_otoczka/features/calculate/domain/entities/plane.dart';
import 'package:flutter_otoczka/generated/l10n.dart';

class CalculatorShapeElement extends StatelessWidget {
  const CalculatorShapeElement({
    Key? key,
    required this.plane,
  }) : super(key: key);

  final Plane plane;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 20.0),
        child: Neumorphic(
          padding: EdgeInsets.symmetric(vertical: 10.0),
          style: NeumorphicStyle(
              depth: -5,
          ),
          child: NeumorphicText(
            '${S.of(context).shapeIs}\n${plane.shape.name}',
            style: NeumorphicStyle(
                depth: 1.5,
                intensity: 200,
                color: defaultTextColor
            ),
            textStyle: NeumorphicTextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
