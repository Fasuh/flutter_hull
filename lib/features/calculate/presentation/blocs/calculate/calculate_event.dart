part of 'calculate_bloc.dart';

abstract class CalculateEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class InitializePlaneEvent extends CalculateEvent {}

class UpdatePlaneEvent extends CalculateEvent {
  UpdatePlaneEvent({required this.point});

  final Point point;

  @override
  List<Object?> get props => [point];
}
