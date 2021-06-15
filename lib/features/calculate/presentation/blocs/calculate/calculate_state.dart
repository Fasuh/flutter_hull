part of 'calculate_bloc.dart';

abstract class CalculateState extends Equatable {
  @override
  List<Object?> get props => [];
}

class InitialCalculateState extends CalculateState {}

class ErrorInitializationCalculateState extends CalculateState {
  ErrorInitializationCalculateState({required this.failure});

  final Failure failure;

  @override
  List<Object?> get props => [failure];
}

abstract class CalculateDataState extends CalculateState {
  Plane get plane;
}

class CalculateSuccessDataState extends CalculateDataState {
  CalculateSuccessDataState({required this.plane});

  final Plane plane;

  @override
  List<Object?> get props => [plane];
}

class CalculateErrorDataState extends CalculateDataState {
  CalculateErrorDataState({
    required this.plane,
    required this.failure,
  });

  final Plane plane;
  final Failure failure;

  @override
  List<Object?> get props => [
        plane,
        failure,
      ];
}
