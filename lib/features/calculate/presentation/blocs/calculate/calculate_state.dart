part of 'calculate_bloc.dart';

abstract class CalculateState extends Equatable {
  @override
  List<Object?> get props => [];
}

class InitialCalculateState extends CalculateState {}

class CalculateDataState extends CalculateState {
  CalculateDataState({required this.plane});

  final Plane plane;

  @override
  List<Object?> get props => [plane];
}
