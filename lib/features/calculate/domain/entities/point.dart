import 'package:equatable/equatable.dart';

abstract class Point extends Equatable {
  double get x;

  double get y;

  Point copyWith({
    double? x,
    double? y,
  });
}
