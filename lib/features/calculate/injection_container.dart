import 'package:flutter_otoczka/features/calculate/domain/use_cases/initialize_plane_use_case.dart';
import 'package:flutter_otoczka/features/calculate/presentation/blocs/calculate/calculate_bloc.dart';

import '../../injection_container.dart';
import 'data/data_sources/calculate_data_source.dart';
import 'data/repositories/calculate_repository_impl.dart';
import 'domain/repositories/calculate_repository.dart';
import 'domain/use_cases/get_plane_for_points_use_case.dart';

mixin CalculateInjector on Injector {
  @override
  Future<void> init() async {
    await super.init();

    // blocs
    sl.registerFactory(() => CalculateBloc(
          getPlaneForPointsUseCase: sl(),
          initializePlaneUseCase: sl(),
        ));

    // use cases
    sl.registerLazySingleton(() => GetPlaneForPointsUseCase(repository: sl()));
    sl.registerLazySingleton(() => InitializePlaneUseCase(repository: sl()));

    // repositories
    sl.registerLazySingleton<CalculateRepository>(() => CalculateRepositoryImpl(dataSource: sl()));

    // data sources
    sl.registerLazySingleton<CalculateDataSource>(() => CalculateDataSourceImpl());
  }
}
