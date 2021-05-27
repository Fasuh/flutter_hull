import 'package:flutter/material.dart';
import 'package:flutter_otoczka/features/calculate/data/data_sources/calculate_data_source.dart';
import 'package:flutter_otoczka/features/calculate/data/model/point.dart';
import 'package:flutter_otoczka/features/calculate/domain/entities/point.dart';
import 'package:flutter_otoczka/features/calculate/domain/entities/position.dart';
import 'package:flutter_otoczka/features/calculate/domain/entities/shape.dart';
import 'package:flutter_otoczka/features/calculate/domain/use_cases/get_plane_for_points_use_case.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_otoczka/main.dart';

void main() {
  group('Wyznaczanie kątu między punktami', () {
    final PointModel firstPoint = PointModel(x: 1.0, y: 1.0);

    test('kąt 90', () {
      final PointModel other = PointModel(x: 2.0, y: 0.0);
      final double expected = 90.0;
      expect(other.degreesInRelationToPoint(firstPoint), expected);
    });

    test('kąt 180', () {
      final PointModel other = PointModel(x: 2.0, y: 1.0);
      final double expected = 180.0;
      expect(other.degreesInRelationToPoint(firstPoint), expected);
    });

    test('kąt 0', () {
      final PointModel other = PointModel(x: 0.0, y: 1.0);
      final double expected = 0.0;
      expect(other.degreesInRelationToPoint(firstPoint), expected);
    });
  });

  group('Sortowanie z użyciem kąta między punktami', () {
    final PointModel point = PointModel(x: 0.0, y: 0.0);

    test('0 powinno być przed 180', () {
      final List<PointModel> points = [
        PointModel(x: 1.0, y: 0.0),
        PointModel(x: -1.0, y: 0.0),
      ];
      final List<PointModel> expected = [
        PointModel(x: -1.0, y: 0.0),
        PointModel(x: 1.0, y: 0.0),
      ];

      expect(point.sortInDegreesRelationToThis(points), expected);
    });

    test('90 powinno być przed 180', () {
      final List<PointModel> points = [
        PointModel(x: 1.0, y: 0.0),
        PointModel(x: 0.0, y: -1.0),
      ];
      final List<PointModel> expected = [
        PointModel(x: 0.0, y: -1.0),
        PointModel(x: 1.0, y: 0.0),
      ];

      expect(point.sortInDegreesRelationToThis(points), expected);
    });

    test('zwykłe sortowanie', () {
      final List<PointModel> points = [
        PointModel(x: 1.0, y: -1.0),
        PointModel(x: 1.0, y: 0.0),
        PointModel(x: -1.0, y: 0.0),
        PointModel(x: -1.0, y: -1.0),
        PointModel(x: 0.0, y: -1.0),
      ];
      final List<PointModel> expected = [
        PointModel(x: -1.0, y: 0.0),
        PointModel(x: -1.0, y: -1.0),
        PointModel(x: 0.0, y: -1.0),
        PointModel(x: 1.0, y: -1.0),
        PointModel(x: 1.0, y: 0.0),
      ];

      expect(point.sortInDegreesRelationToThis(points), expected);
    });
  });

  group('Pozycja w relacji do lini', () {
    final Point a = PointModel(x: 1.0, y: 0.0);
    final Point b = PointModel(x: -1.0, y: 0.0);

    test('Pozycja na lewo od linii', () {
      final PointModel c = PointModel(x: 0.0, y: 1.0);

      final position = c.positionInRelationToLine(a, b);
      expect(position, Position.Left);
    });

    test('Pozycja na prawo od linii', () {
      final PointModel c = PointModel(x: 0.0, y: -1.0);

      final position = c.positionInRelationToLine(a, b);
      expect(position, Position.Right);
    });

    test('Pozycja na współliniowa', () {
      final PointModel c = PointModel(x: 0.0, y: 0.0);

      final position = c.positionInRelationToLine(a, b);
      expect(position, Position.Collinear);
    });
  });
}
