import 'package:equatable/equatable.dart';
import 'package:flutter_otoczka/features/calculate/domain/entities/point.dart';
import 'package:flutter_otoczka/features/calculate/domain/entities/shape.dart';

abstract class Plane extends Equatable {
  List<Point> get points;

  List<Point> get convexHull;

  Shape get shape;

  Plane copyWith({
    List<Point>? points,
    List<Point>? lines,
  });
}
