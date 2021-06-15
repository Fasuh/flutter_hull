part of 'calculate_bloc.dart';

abstract class CalculateEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class InitializePlaneEvent extends CalculateEvent {}

class UpdatePlaneEvent extends CalculateEvent {
  UpdatePlaneEvent({required this.points});

  final List<Point> points;

  @override
  List<Object?> get props => [points];
}
