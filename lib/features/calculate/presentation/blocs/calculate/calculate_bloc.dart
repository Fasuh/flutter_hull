import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_otoczka/features/calculate/domain/entities/plane.dart';
import 'package:flutter_otoczka/features/calculate/domain/entities/point.dart';

part 'calculate_event.dart';

part 'calculate_state.dart';

class CalculateBloc extends Bloc<CalculateEvent, CalculateState> {
  CalculateBloc() : super(InitialCalculateState());

  @override
  Stream<CalculateState> mapEventToState(CalculateEvent event) {
    // TODO: implement mapEventToState
    throw UnimplementedError();
  }
}