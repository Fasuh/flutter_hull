import 'package:flutter/material.dart';
import 'package:flutter_neumorphic_null_safety/flutter_neumorphic.dart';
import 'package:flutter_otoczka/features/calculate/domain/entities/point.dart';
import 'package:flutter_otoczka/features/calculate/presentation/widgets/calculator_expandable_arrow.dart';
import 'package:flutter_otoczka/generated/l10n.dart';

class CalculatorPointExpandableHeader extends StatelessWidget {
  const CalculatorPointExpandableHeader({
    Key? key,
    required this.point,
  }) : super(key: key);

  final Point point;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            NeumorphicText(
              '${S.of(context).point} ${point.id}',
              style: NeumorphicStyle(depth: 1.5, intensity: 200),
              textStyle: NeumorphicTextStyle(fontSize: 32, fontWeight: FontWeight.bold),
            ),
            CalculatorExpandableArrow(),
          ],
        ),
      ),
    );
  }
}
