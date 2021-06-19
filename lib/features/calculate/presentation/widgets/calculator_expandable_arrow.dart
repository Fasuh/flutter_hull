import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic_null_safety/flutter_neumorphic.dart';

class CalculatorExpandableArrow extends StatelessWidget {
  const CalculatorExpandableArrow({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final notifier = ExpandableController.of(context, required: true)!;
    return NeumorphicButton(
      minDistance: 0.001,
      style: NeumorphicStyle(
        boxShape: NeumorphicBoxShape.stadium(),
      ),
      padding: EdgeInsets.zero,
      onPressed: notifier.toggle,
      child: NeumorphicIcon(
        notifier.expanded ? Icons.keyboard_arrow_up_rounded : Icons.keyboard_arrow_down_rounded,
        style: NeumorphicStyle(
          depth: 1.5,
          intensity: 200,
        ),
        size: 40,
      ),
    );
  }
}
