import 'package:flutter/material.dart';
import 'package:flutter_neumorphic_null_safety/flutter_neumorphic.dart';
import 'package:flutter_otoczka/core/style/colors.dart';
import 'package:flutter_otoczka/features/calculate/domain/entities/plane.dart';
import 'package:flutter_otoczka/features/calculate/presentation/canvas/calculator_painter.dart';
import 'package:flutter_otoczka/generated/l10n.dart';

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
        child: Stack(
          children: [
            Positioned(
              top: 0.0,
              right: 0.0,
              child: Neumorphic(
                style: NeumorphicStyle(
                  depth: -4,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      NeumorphicText(
                        S.of(context).pointsAre,
                        style: NeumorphicStyle(
                          depth: 1.5,
                          intensity: 200,
                          color: defaultTextColor,
                        ),
                      ),
                      ...plane.convexHull.map((point) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 4.0),
                          child: NeumorphicText(
                            '${point.id} - ${S.of(context).calculatorPointX}: ${point.x}, ${S.of(context).calculatorPointY}: ${point.y}',
                            style: NeumorphicStyle(
                              depth: 1.5,
                              intensity: 200,
                              color: defaultTextColor,
                            ),
                          ),
                        );
                      })
                    ],
                  ),
                ),
              ),
            ),
            CustomPaint(
              painter: CalculatorPainter(
                plane: plane,
              ),
              child: Container(),
            ),
          ],
        ),
      ),
    );
  }
}
