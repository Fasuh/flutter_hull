import 'package:flutter/material.dart';
import 'package:flutter_otoczka/features/calculate/domain/entities/point.dart';
import 'package:flutter_otoczka/features/calculate/presentation/widgets/calculator_point_expandable.dart';
import 'package:flutter_otoczka/features/calculate/presentation/widgets/calculator_point_expandable_body.dart';

class CalculatorPointsSection extends StatelessWidget {
  const CalculatorPointsSection({
    Key? key,
    required this.points,
    required this.onChanged,
  }) : super(key: key);

  final List<Point> points;
  final OnPointChanged onChanged;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 5.0),
      child: Container(
        child: Column(
          children: points
              .map(
                (point) => CalculatorPointExpandable(
                  point: point,
                  onChanged: onChanged,
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}
