import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_otoczka/core/error/failures.dart';
import 'package:flutter_otoczka/features/calculate/domain/entities/point.dart';
import 'package:flutter_otoczka/features/calculate/domain/repositories/calculate_repository.dart';
import 'package:flutter_otoczka/core/usecase/usecase.dart';

class CreatePointUseCase extends UseCase<Point, CreatePointParam> {
  CreatePointUseCase({required this.repository});

  final CalculateRepository repository;

  @override
  Future<Either<Failure, Point>> call(CreatePointParam params) {
    return repository.createPoint(params);
  }
}

class CreatePointParam extends Equatable {
  CreatePointParam({
    required this.x,
    required this.y,
  });

  final double x;
  final double y;

  @override
  List<Object?> get props => [x, y];
}
