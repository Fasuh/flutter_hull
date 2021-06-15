import 'package:dartz/dartz.dart';
import 'package:flutter_otoczka/core/error/failures.dart';
import 'package:flutter_otoczka/core/error/form_decoder.dart';
import 'package:flutter_otoczka/features/calculate/data/data_sources/calculate_data_source.dart';
import 'package:flutter_otoczka/features/calculate/domain/entities/plane.dart';
import 'package:flutter_otoczka/features/calculate/domain/repositories/calculate_repository.dart';
import 'package:flutter_otoczka/features/calculate/domain/use_cases/get_plane_for_points_use_case.dart';

class CalculateRepositoryImpl extends CalculateRepository {
  CalculateRepositoryImpl({required this.dataSource});

  final CalculateDataSource dataSource;

  Future<Either<Failure, Plane>> getPlaneForPoints(GetPlaneForPointsParam param) async {
    try {
      final result = await dataSource.getPlaneForPoints(param);
      return Right(result);
    } catch(error) {
      return Left(handleError(error: error, defaultFailure: DefaultCalculateFailure()));
    }
  }

  Future<Either<Failure, Plane>> initializePlane() async {
    try {
      final result = await dataSource.initializePlane();
      return Right(result);
    } catch(error) {
      return Left(handleError(error: error, defaultFailure: DefaultCalculateFailure()));
    }
  }
}