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
    final position = (b.x - a.x) * (this.y - a.y) - (this.x - a.x) * (b.y - a.y);
    if (position > 0) {
      return Position.Left;
    } else if (position < 0) {
      return Position.Right;
    } else {
      return Position.Collinear;
    }
  }

  // Length in relation to point
  double lengthFromPoint(Point other) {
    return Math.sqrt(Math.pow((other.x - this.x), 2) + Math.pow((other.y - this.y), 2));
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
    return degrees(Math.atan2(this.y - other.y, this.x - other.x));
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
