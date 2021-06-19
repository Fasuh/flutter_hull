import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic_null_safety/flutter_neumorphic.dart';
import 'package:flutter_otoczka/features/calculate/domain/entities/point.dart';
import 'package:flutter_otoczka/features/calculate/presentation/widgets/calculator_point_expandable_body.dart';
import 'package:flutter_otoczka/features/calculate/presentation/widgets/calculator_point_expandable_body_value.dart';
import 'package:flutter_otoczka/features/calculate/presentation/widgets/calculator_point_expandable_header.dart';

class CalculatorPointExpandable extends StatelessWidget {
  const CalculatorPointExpandable({
    Key? key,
    required this.point,
    required this.onChanged,
  }) : super(key: key);

  final Point point;
  final OnPointChanged onChanged;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Neumorphic(
        child: ExpandableNotifier(
          child: Expandable(
            collapsed: CalculatorPointExpandableHeader(
              point: point,
            ),
            expanded: Column(
              children: [
                CalculatorPointExpandableHeader(
                  point: point,
                ),
                CalculatorPointExpandableBody(
                  point: point,
                  onChanged: onChanged,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
