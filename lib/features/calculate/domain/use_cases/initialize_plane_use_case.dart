import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_otoczka/core/error/failures.dart';
import 'package:flutter_otoczka/features/calculate/domain/entities/plane.dart';
import 'package:flutter_otoczka/features/calculate/domain/entities/point.dart';
import 'package:flutter_otoczka/features/calculate/domain/repositories/calculate_repository.dart';
import 'package:flutter_otoczka/core/usecase/usecase.dart';

class InitializePlaneUseCase extends UseCase<Plane, NoParams> {
  InitializePlaneUseCase({required this.repository});

  final CalculateRepository repository;

  @override
  Future<Either<Failure, Plane>> call(NoParams params) {
    return repository.initializePlane();
  }
}
