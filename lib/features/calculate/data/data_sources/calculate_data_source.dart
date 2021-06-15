import 'dart:html';

import 'package:flutter_otoczka/features/calculate/data/model/plane.dart';
import 'package:flutter_otoczka/features/calculate/data/model/point.dart';
import 'package:flutter_otoczka/features/calculate/domain/entities/plane.dart';
import 'package:flutter_otoczka/features/calculate/domain/entities/point.dart';
import 'package:flutter_otoczka/features/calculate/domain/entities/position.dart';
import 'package:flutter_otoczka/features/calculate/domain/entities/shape.dart';
import 'package:flutter_otoczka/features/calculate/domain/use_cases/get_plane_for_points_use_case.dart';

abstract class CalculateDataSource {
  Future<Plane> getPlaneForPoints(GetPlaneForPointsParam param);
  Future<Plane> initializePlane();
}

class CalculateDataSourceImpl extends CalculateDataSource {
  @override
  Future<Plane> getPlaneForPoints(GetPlaneForPointsParam param) async {
    final convexHull = calculateConvexHullFromPoints(param.points.cast<PointModel>());
    return PlaneModel(
      points: param.points,
      convexHull: convexHull,
      shape: getShapeFromLines(convexHull),
    );
  }

  // Calculate the outer ring
  List<Point> calculateConvexHullFromPoints(List<PointModel> points) {
    final lowestPoint = getLowestPoint(points) as PointModel;
    final pointsExcludingLowest = (List.from(points)..remove(lowestPoint)).cast<PointModel>();
    final sorted = lowestPoint.sortInDegreesRelationToThis(pointsExcludingLowest);
    return getConvexHullFromPoints(sorted, [lowestPoint]);
  }

  // Point furthest to the Y position, if two points have the same Y position sort them by X position
  List<Point> getConvexHullFromPoints(List<Point> points, List<Point> hull) {
    hull.add(points[0]);
    points.getRange(1, points.length).cast<PointModel>().forEach((point) {
      hull = tryAddPointToHull(List.from(hull), point);
    });
    final first = hull.first as PointModel;
    hull = tryAddPointToHull(List.from(hull), first);
    // remove duplicates
    return hull.toSet().toList();
  }

  List<Point> tryAddPointToHull(List<Point> hull, PointModel point) {
    final last = hull.last;
    final preLast = hull.elementAt(hull.length-2) as PointModel;
    final position = point.positionInRelationToLine(preLast, last);
    if(!hull.contains(point)){
      hull.add(point);
    }
    if(position != Position.Left) {
      if(position == Position.Collinear) {
        final lengthA = preLast.lengthFromPoint(last);
        final lengthB = preLast.lengthFromPoint(point);
        if(lengthB > lengthA) {
          hull.remove(last);
        }
      } else {
        hull.remove(last);
      }
    }
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

  @override
  Future<Plane> initializePlane() async {
    final points = [
      PointModel(x: 0.0, y: 0.0),
      PointModel(x: 2.0, y: 0.0),
      PointModel(x: 2.0, y: 2.0),
      PointModel(x: 0.0, y: 2.0),
    ];
    return getPlaneForPoints(GetPlaneForPointsParam(points: points));
  }
}
