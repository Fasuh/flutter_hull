import 'dart:math' as Math;

import 'package:flutter_otoczka/features/calculate/domain/entities/point.dart';
import 'package:flutter_otoczka/features/calculate/domain/entities/position.dart';
import 'package:vector_math/vector_math.dart';

class PointModel extends Point {
  PointModel({
    required this.x,
    required this.y,
  });

  final double x;
  final double y;

  // Position in relation to Line made with points "a" and "b"
  Position positionInRelationToLine(Point a, Point b) {
    final position = (a.x - b.x) * (this.y - b.y) - (this.x - b.x) * (a.y - b.y);
    if (position > 0) {
      return Position.Left;
    } else if (position < 0) {
      return Position.Right;
    } else {
      return Position.Collinear;
    }
  }

  // Sort points by degrees from point
  List<Point> sortInDegreesRelationToThis(List<PointModel> points) {
    return List.from(points).cast<PointModel>()
      ..sort((a, b) {
        final degreesB = b.degreesInRelationToPoint(this);
        final degreesA = a.degreesInRelationToPoint(this);
        return degreesA.compareTo(degreesB);
      });
  }

  double degreesInRelationToPoint(Point other) {
    return degrees(Math.atan2(other.y - this.y, other.x - this.x));
  }

  @override
  Point copyWith({double? x, double? y}) {
    return PointModel(
      x: x ?? this.x,
      y: y ?? this.y,
    );
  }

  List<Object?> get props => [
        x,
        y,
      ];
}
