import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get_it/get_it.dart';
import '../../data/datasources/{{featureName.snakeCase()}}_remote_data_source.dart';
import '../../data/repositories/{{featureName.snakeCase()}}_remote_repository_impl.dart';
import '../../domain/repositories/{{featureName.snakeCase()}}_remote_repository.dart';
import '../../domain/use_cases/create_{{featureName.snakeCase()}}_use_case.dart';
import '../../domain/use_cases/delete_{{featureName.snakeCase()}}_use_case.dart';
import '../../domain/use_cases/read_{{featureName.snakeCase()}}_use_case.dart';
import '../../domain/use_cases/update_{{featureName.snakeCase()}}_use_case.dart';
import '../bloc/{{featureName.snakeCase()}}_bloc.dart';

final sl = GetIt.instance;

void init() {
  sl.reset();

  // Bloc
  sl.registerFactory(() => {{featureName.pascalCase()}}Bloc(
    create{{featureName.pascalCase()}}UseCase: sl(),
    read{{featureName.pascalCase()}}sUseCase: sl(),
    update{{featureName.pascalCase()}}UseCase: sl(),
    delete{{featureName.pascalCase()}}UseCase: sl(),
  ));

  // Use cases
  sl.registerLazySingleton(() => Create{{featureName.pascalCase()}}UseCase(sl()));
  sl.registerLazySingleton(() => Read{{featureName.pascalCase()}}sUseCase(sl()));
  sl.registerLazySingleton(() => Update{{featureName.pascalCase()}}UseCase(sl()));
  sl.registerLazySingleton(() => Delete{{featureName.pascalCase()}}UseCase(sl()));

  // Repositories
  sl.registerLazySingleton<{{featureName.pascalCase()}}RemoteRepository>(() =>
    {{featureName.pascalCase()}}RemoteRepositoryImpl(remoteDataSource: sl()),
  );

  // Data sources
  sl.registerLazySingleton<{{featureName.pascalCase()}}RemoteDataSource>(() =>
    {{featureName.pascalCase()}}RemoteDataSourceImpl(firestoreInstance: sl()),
  );

  // Core

  // External
  if (!GetIt.I.isRegistered<FirebaseFirestore>()) {
    GetIt.I.registerSingleton<FirebaseFirestore>(FirebaseFirestore.instance);
  }

  // Mappers
}
