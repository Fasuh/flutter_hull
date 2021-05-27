import 'package:flutter_otoczka/features/calculate/data/model/plane.dart';
import 'package:flutter_otoczka/features/calculate/data/model/point.dart';
import 'package:flutter_otoczka/features/calculate/domain/entities/plane.dart';
import 'package:flutter_otoczka/features/calculate/domain/entities/point.dart';
import 'package:flutter_otoczka/features/calculate/domain/entities/position.dart';
import 'package:flutter_otoczka/features/calculate/domain/entities/shape.dart';
import 'package:flutter_otoczka/features/calculate/domain/use_cases/create_point_use_case.dart';
import 'package:flutter_otoczka/features/calculate/domain/use_cases/get_plane_for_points_use_case.dart';

abstract class CalculateDataSource {
  Future<Plane> getPlaneForPoints(GetPlaneForPointsParam param);

  Future<Point> createPoint(CreatePointParam param);
}

class CalculateDataSourceImpl extends CalculateDataSource {
  @override
  Future<Plane> getPlaneForPoints(GetPlaneForPointsParam param) async {
    final lines = calculateOuterRingFromPoints(param.points.cast<PointModel>());
    return PlaneModel(
      points: param.points,
      lines: lines,
      shape: getShapeFromLines(lines),
    );
  }

  @override
  Future<Point> createPoint(CreatePointParam param) async {
    return PointModel(
      x: param.x,
      y: param.y,
    );
  }

  // Calculate the outer ring
  List<Point> calculateOuterRingFromPoints(List<PointModel> points) {
    final lowestPoint = getLowestPoint(points) as PointModel;
    final sorted = lowestPoint.sortInDegreesRelationToThis(points);
    return getOuterRingFromPoints(sorted);
  }

  // Point furthest to the Y position, if two points have the same Y position sort them by X position
  List<Point> getOuterRingFromPoints(List<Point> points) {
    List<Point> hull = <Point>[points.first, points.elementAt(1)];
    points.getRange(2, points.length).cast<PointModel>().forEach((point) {
      final hullLastA = hull.last;
      final hullLastB = hull.elementAt(hull.length-2);
      final position = point.positionInRelationToLine(hullLastA, hullLastB);
      if(position == Position.Left) {
        hull.add(point);
      }
    });
    return hull;
  }

  // Point furthest to the Y position, if two points have the same Y position sort them by X position
  Point getLowestPoint(List<Point> points) {
    return points.cast<PointModel>().reduce((current, point) {
      if (current.y < point.y || (current.y == point.y && current.x < point.x)) {
        return current;
      } else {
        return point;
      }
    });
  }

  // Get shape of the ring
  Shape getShapeFromLines(List<Point> points) {
    return Shape.Polygon;
  }
}
