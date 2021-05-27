part of 'calculate_bloc.dart';

abstract class CalculateEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class CalculateAddPointEvent extends CalculateEvent {
  CalculateAddPointEvent({
    required this.x,
    required this.y,
  });

  final double x;
  final double y;

  @override
  List<Object?> get props => [x, y];
}
