import 'package:flutter/material.dart';
import 'package:flutter_otoczka/features/calculate/domain/entities/point.dart';
import 'package:flutter_otoczka/features/calculate/presentation/widgets/calculator_point_expandable_body_value.dart';
import 'package:flutter_otoczka/generated/l10n.dart';

typedef OnPointChanged = Function(Point point);

class CalculatorPointExpandableBody extends StatelessWidget {
  const CalculatorPointExpandableBody({
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
      child: Column(
        children: [
          CalculatorPointExpandableBodyValue(
            label: S.of(context).calculatorPointX,
            value: point.x,
            onChanged: (value) {
              onChanged(point.copyWith(x: value));
            },
          ),
          CalculatorPointExpandableBodyValue(
            label: S.of(context).calculatorPointY,
            value: point.y,
            onChanged: (value) {
              onChanged(point.copyWith(y: value));
            },
          ),
        ],
      ),
    );
  }
}
