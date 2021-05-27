import 'package:dartz/dartz.dart';
import 'package:flutter_otoczka/core/error/failures.dart';
import 'package:flutter_otoczka/features/calculate/domain/entities/plane.dart';
import 'package:flutter_otoczka/features/calculate/domain/entities/point.dart';
import 'package:flutter_otoczka/features/calculate/domain/use_cases/create_point_use_case.dart';
import 'package:flutter_otoczka/features/calculate/domain/use_cases/get_plane_for_points_use_case.dart';

abstract class CalculateRepository {
  Future<Either<Failure, Plane>> getPlaneForPoints(GetPlaneForPointsParam param);
  Future<Either<Failure, Point>> createPoint(CreatePointParam param);
}