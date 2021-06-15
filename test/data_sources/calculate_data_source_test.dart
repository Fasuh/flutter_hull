import 'package:flutter_otoczka/features/calculate/data/data_sources/calculate_data_source.dart';
import 'package:flutter_otoczka/features/calculate/data/model/point.dart';
import 'package:flutter_otoczka/features/calculate/domain/entities/shape.dart';
import 'package:flutter_otoczka/features/calculate/domain/use_cases/get_plane_for_points_use_case.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  CalculateDataSourceImpl dataSource = CalculateDataSourceImpl();

  group('Wyciąganie punktu najdalej wysuniętego ', () {
    test('zwykłe wyciąganie po pozycji Y', () {
      final List<PointModel> points = [
        PointModel(x: 0.0, y: 1.0),
        PointModel(x: 0.0, y: 10.0),
        PointModel(x: 0.0, y: 2.0),
        PointModel(x: 0.0, y: 3.0),
        PointModel(x: 0.0, y: 8.0),
      ];

      final PointModel expected = PointModel(x: 0.0, y: 1.0);

      final furthest = dataSource.getLowestPoint(points);
      expect(furthest, expected);
    });

    test('Wyciąganie po pozycji X jeżeli Y jest takie same', () {
      final List<PointModel> points = [
        PointModel(x: 2.0, y: 0.0),
        PointModel(x: 3.0, y: 0.0),
        PointModel(x: 10.0, y: 0.0),
        PointModel(x: 4.0, y: 0.0),
        PointModel(x: 6.0, y: 0.0),
      ];

      final PointModel expected = PointModel(x: 2.0, y: 0.0);

      final furthest = dataSource.getLowestPoint(points);
      expect(furthest, expected);
    });

    test('Wyciąganie mieszane priorytetyzuje pozycje Y', () {
      final List<PointModel> points = [
        PointModel(x: 1.0, y: 4.0),
        PointModel(x: 15.0, y: 3.0),
        PointModel(x: 10.0, y: 5.0),
        PointModel(x: 4.0, y: 2.0),
        PointModel(x: 2.0, y: 2.0),
        PointModel(x: 6.0, y: 5.0),
      ];

      final PointModel expected = PointModel(x: 2.0, y: 2.0);

      final furthest = dataSource.getLowestPoint(points);
      expect(furthest, expected);
    });
  });

  group('wyznaczanie otoczki', () {
    test('Poprawnie wyznacz otoczkę z czterech punktów', () async {
      final List<PointModel> points = [
        PointModel(x: 2.0, y: 2.0),
        PointModel(x: 2.0, y: 0.0),
        PointModel(x: 1.0, y: 0.50),
        PointModel(x: 0.0, y: 0.0),
      ];
      final List<PointModel> expected = [
        PointModel(x: 0.0, y: 0.0),
        PointModel(x: 2.0, y: 0.0),
        PointModel(x: 2.0, y: 2.0),
      ];

      final actual = await dataSource.getPlaneForPoints(GetPlaneForPointsParam(points: points));

      expect(actual.convexHull, expected);
    });

    test('Poprawnie wyznacz otoczkę z czterech punktów współliniowych na osi X', () async {
      final List<PointModel> points = [
        PointModel(x: 0.0, y: 0.0),
        PointModel(x: 2.0, y: 0.0),
        PointModel(x: 1.0, y: 0.0),
        PointModel(x: 4.0, y: 0.0),
      ];
      final List<PointModel> expected = [
        PointModel(x: 0.0, y: 0.0),
        PointModel(x: 4.0, y: 0.0),
      ];

      final actual = await dataSource.getPlaneForPoints(GetPlaneForPointsParam(points: points));

      expect(actual.convexHull, expected);
    });

    test('Poprawnie wyznacz otoczkę z czterech punktów współliniowych na osi Y', () async {
      final List<PointModel> points = [
        PointModel(x: 0.0, y: 0.0),
        PointModel(x: 0.0, y: 2.0),
        PointModel(x: 0.0, y: 1.0),
        PointModel(x: 0.0, y: 4.0),
      ];
      final List<PointModel> expected = [
        PointModel(x: 0.0, y: 0.0),
        PointModel(x: 0.0, y: 4.0),
      ];

      final actual = await dataSource.getPlaneForPoints(GetPlaneForPointsParam(points: points));

      expect(actual.convexHull, expected);
    });

    test('Poprawnie wyznacz otoczkę punktów z czego pierwszy i ostatni są współliniowe', () async {
      final List<PointModel> points = [
        PointModel(x: 2.0, y: 2.0),
        PointModel(x: 2.0, y: 0.0),
        PointModel(x: 1.0, y: 1.0),
        PointModel(x: 0.0, y: 0.0),
      ];
      final List<PointModel> expected = [
        PointModel(x: 0.0, y: 0.0),
        PointModel(x: 2.0, y: 0.0),
        PointModel(x: 2.0, y: 2.0),
      ];

      final actual = await dataSource.getPlaneForPoints(GetPlaneForPointsParam(points: points));

      expect(actual.convexHull, expected);
    });

    test('Poprawnie wyznacz otoczkę punktów z czego pierwszy i ostatni są tym samym punktem', () async {
      final List<PointModel> points = [
        PointModel(x: 2.0, y: 2.0),
        PointModel(x: 2.0, y: 0.0),
        PointModel(x: 0.0, y: 0.0),
        PointModel(x: 0.0, y: 0.0),
      ];
      final List<PointModel> expected = [
        PointModel(x: 0.0, y: 0.0),
        PointModel(x: 2.0, y: 0.0),
        PointModel(x: 2.0, y: 2.0),
      ];

      final actual = await dataSource.getPlaneForPoints(GetPlaneForPointsParam(points: points));

      expect(actual.convexHull, expected);
    });

    test('Poprawnie wyznacz otoczkę punktów które są w tych samych kooordynatach', () async {
      final List<PointModel> points = [
        PointModel(x: 0.0, y: 0.0),
        PointModel(x: 0.0, y: 0.0),
        PointModel(x: 0.0, y: 0.0),
        PointModel(x: 0.0, y: 0.0),
      ];
      final List<PointModel> expected = [
        PointModel(x: 0.0, y: 0.0),
      ];

      final actual = await dataSource.getPlaneForPoints(GetPlaneForPointsParam(points: points));

      expect(actual.convexHull, expected);
    });
  });

  group('Wyznaczanie kształtu otoczki', () {
    test('Kształt otoczki punkt', () async {
      final List<PointModel> points = [
        PointModel(x: 0.0, y: 0.0),
        PointModel(x: 0.0, y: 0.0),
        PointModel(x: 0.0, y: 0.0),
        PointModel(x: 0.0, y: 0.0),
      ];

      final expected = Shape.Dot;

      final actual = await dataSource.getPlaneForPoints(GetPlaneForPointsParam(points: points));

      expect(actual.shape, expected);
    });

    test('Kształt otoczki linia', () async {
      final List<PointModel> points = [
        PointModel(x: 0.0, y: 0.0),
        PointModel(x: 0.0, y: 2.0),
        PointModel(x: 0.0, y: 1.0),
        PointModel(x: 0.0, y: 4.0),
      ];

      final expected = Shape.Line;

      final actual = await dataSource.getPlaneForPoints(GetPlaneForPointsParam(points: points));

      expect(actual.shape, expected);
    });

    test('Kształt otoczki trójkąt', () async {
      final List<PointModel> points = [
        PointModel(x: 0.0, y: 0.0),
        PointModel(x: 2.0, y: 2.0),
        PointModel(x: 0.0, y: 1.0),
        PointModel(x: 0.0, y: 4.0),
      ];

      final expected = Shape.Triangle;

      final actual = await dataSource.getPlaneForPoints(GetPlaneForPointsParam(points: points));

      expect(actual.shape, expected);
    });

    test('Kształt otoczki Kwadrat', () async {
      final List<PointModel> points = [
        PointModel(x: 0.0, y: 0.0),
        PointModel(x: 2.0, y: 0.0),
        PointModel(x: 2.0, y: 2.0),
        PointModel(x: 0.0, y: 2.0),
      ];

      final expected = Shape.Square;

      final actual = await dataSource.getPlaneForPoints(GetPlaneForPointsParam(points: points));

      expect(actual.shape, expected);
    });

    test('Kształt otoczki Czworokąt nie będący kwadratem', () async {
      final List<PointModel> points = [
        PointModel(x: 0.0, y: 0.0),
        PointModel(x: 3.0, y: 0.0),
        PointModel(x: 2.0, y: 2.0),
        PointModel(x: 0.0, y: 2.0),
      ];

      final expected = Shape.Quadrangle;

      final actual = await dataSource.getPlaneForPoints(GetPlaneForPointsParam(points: points));

      expect(actual.shape, expected);
    });

    test('Nie każdy prostokąt jest kwadratem', () async {
      final List<PointModel> points = [
        PointModel(x: 0.0, y: 0.0),
        PointModel(x: 2.5, y: 0.0),
        PointModel(x: 2.5, y: 1.5),
        PointModel(x: 0.0, y: 1.5),
      ];

      final expected = Shape.Quadrangle;

      final actual = await dataSource.getPlaneForPoints(GetPlaneForPointsParam(points: points));

      expect(actual.shape, expected);
    });
  });
}
