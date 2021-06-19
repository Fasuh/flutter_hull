import 'package:equatable/equatable.dart';

abstract class Point extends Equatable {
  double get x;

  double get y;

  String get id;

  Point copyWith({
    double? x,
    double? y,
    String? id,
  });
}
