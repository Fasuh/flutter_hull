import 'package:flutter/material.dart';
import 'package:flutter_neumorphic_null_safety/flutter_neumorphic.dart';
import 'package:flutter_otoczka/features/calculate/domain/entities/plane.dart';
import 'package:flutter_otoczka/features/calculate/presentation/canvas/calculator_painter.dart';

class CalculatorCanvas extends StatelessWidget {
  const CalculatorCanvas({
    Key? key,
    required this.plane,
  }) : super(key: key);

  final Plane plane;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Neumorphic(
        style: NeumorphicStyle(
          depth: -5,
        ),
        child: CustomPaint(
          painter: CalculatorPainter(
            plane: plane,
          ),
          child: Container(),
        ),
      ),
    );
  }
}
