import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_otoczka/core/error/failures.dart';
import 'package:flutter_otoczka/core/usecase/usecase.dart';
import 'package:flutter_otoczka/features/calculate/domain/entities/plane.dart';
import 'package:flutter_otoczka/features/calculate/domain/entities/point.dart';
import 'package:flutter_otoczka/features/calculate/domain/use_cases/get_plane_for_points_use_case.dart';
import 'package:flutter_otoczka/features/calculate/domain/use_cases/initialize_plane_use_case.dart';

part 'calculate_event.dart';

part 'calculate_state.dart';

class CalculateBloc extends Bloc<CalculateEvent, CalculateState> {
  CalculateBloc({
    required this.getPlaneForPointsUseCase,
    required this.initializePlaneUseCase,
  }) : super(InitialCalculateState());

  final InitializePlaneUseCase initializePlaneUseCase;
  final GetPlaneForPointsUseCase getPlaneForPointsUseCase;

  late Plane _plane;

  @override
  Stream<CalculateState> mapEventToState(CalculateEvent event) async* {
    if (event is InitializePlaneEvent) {
      yield* _mapInitializePlaneEvent();
    } else if (event is UpdatePlaneEvent) {
      yield* _mapUpdatePlaneEvent(event);
    }
  }

  Stream<CalculateState> _mapInitializePlaneEvent() async* {
    final result = await initializePlaneUseCase(NoParams());
    yield* result.fold((error) async* {
      yield ErrorInitializationCalculateState(failure: error);
    }, (data) async* {
      _plane = data.copyWith();
      yield CalculateSuccessDataState(plane: _plane.copyWith());
    });
  }

  Stream<CalculateState> _mapUpdatePlaneEvent(UpdatePlaneEvent event) async* {
    final newList = List.from(_plane.points).cast<Point>()
      ..removeWhere((element) => element.id == event.point.id)
      ..add(event.point);

    final result = await getPlaneForPointsUseCase(
      GetPlaneForPointsParam(points: newList),
    );
    yield* result.fold((error) async* {
      yield CalculateErrorDataState(plane: _plane, failure: error);
    }, (data) async* {
      _plane = data.copyWith();
      yield CalculateSuccessDataState(plane: _plane.copyWith());
    });
  }
}
