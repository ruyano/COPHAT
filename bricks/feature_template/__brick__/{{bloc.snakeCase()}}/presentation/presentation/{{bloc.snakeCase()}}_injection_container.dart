import 'package:get_it/get_it.dart';
import 'package:pubbank/utils/new_api.dart';

import '../../data/datasources/{{bloc.snakeCase()}}_remote_data_source.dart';
import '../../data/repositories/{{bloc.snakeCase()}}_remote_repository_impl.dart';
import '../../domain/repositories/{{bloc.snakeCase()}}_remote_repository.dart';
import '../../domain/use_cases/get_{{bloc.snakeCase()}}_use_case.dart';
import '../bloc/{{bloc.snakeCase()}}_bloc.dart';

final sl = GetIt.instance;

void init() {
  sl.reset();

  // Blocs
  sl.registerFactory(() => {{bloc.pascalCase()}}Bloc(
    get{{bloc.pascalCase()}}UseCase: sl(),
  ));

  // Use cases
  sl.registerLazySingleton(() => Get{{bloc.pascalCase()}}UseCase(sl()));

  // Repositories
  sl.registerLazySingleton<{{bloc.pascalCase()}}RemoteRepository>(() =>
    {{bloc.pascalCase()}}RemoteRepositoryImpl(remoteDataSource: sl()),
  );

  // Data sources
  sl.registerLazySingleton<{{bloc.pascalCase()}}RemoteDataSource>(() =>
    {{bloc.pascalCase()}}RemoteDataSourceImpl(api: sl()),
  );

  // Core

  // External
  if (!GetIt.I.isRegistered<NewApi>()) {
    GetIt.I.registerSingleton<NewApi>(NewApi());
  }

  // Mappers
}
