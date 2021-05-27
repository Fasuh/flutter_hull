import 'package:flutter_otoczka/features/calculate/domain/entities/plane.dart';
import 'package:flutter_otoczka/features/calculate/domain/entities/point.dart';
import 'package:flutter_otoczka/features/calculate/domain/entities/shape.dart';

class PlaneModel extends Plane {
  PlaneModel({
    required this.points,
    required this.lines,
    required this.shape,
  });

  final List<Point> points;
  final List<Point> lines;
  final Shape shape;

  Plane copyWith({
    List<Point>? points,
    List<Point>? lines,
    Shape? shape,
  }) {
    return PlaneModel(
      points: points ?? this.points,
      lines: lines ?? this.lines,
      shape: shape ?? this.shape,
    );
  }

  List<Object?> get props => [
        points,
        lines,
        shape,
      ];
}
