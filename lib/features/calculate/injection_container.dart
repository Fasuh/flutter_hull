import '../../injection_container.dart';
import 'data/data_sources/calculate_data_source.dart';
import 'data/repositories/calculate_repository_impl.dart';
import 'domain/repositories/calculate_repository.dart';
import 'domain/use_cases/get_plane_for_points_use_case.dart';

mixin CalculateInjector on Injector {
  @override
  Future<void> init() async {
    await super.init();
    
    // use cases
    sl.registerLazySingleton(() => GetPlaneForPointsUseCase(repository: sl()));

       // repositories
    sl.registerLazySingleton<CalculateRepository>(() => CalculateRepositoryImpl(dataSource: sl()));

       // data sources
    sl.registerLazySingleton<CalculateDataSource>(
            () => CalculateDataSourceImpl());


  }
}