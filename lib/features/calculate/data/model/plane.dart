import 'package:flutter_otoczka/features/calculate/domain/entities/plane.dart';
import 'package:flutter_otoczka/features/calculate/domain/entities/point.dart';
import 'package:flutter_otoczka/features/calculate/domain/entities/shape.dart';

class PlaneModel extends Plane {
  PlaneModel({
    required this.points,
    required this.convexHull,
    required this.shape,
  });

  final List<Point> points;
  final List<Point> convexHull;
  final Shape shape;

  Plane copyWith({
    List<Point>? points,
    List<Point>? lines,
    Shape? shape,
  }) {
    return PlaneModel(
      points: points ?? this.points,
      convexHull: lines ?? this.convexHull,
      shape: shape ?? this.shape,
    );
  }

  List<Object?> get props => [
        points,
        convexHull,
        shape,
      ];
}
