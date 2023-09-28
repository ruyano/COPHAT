import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get_it/get_it.dart';
import '../../data/datasources/family_remote_data_source.dart';
import '../../data/repositories/family_remote_repository_impl.dart';
import '../../domain/repositories/family_remote_repository.dart';
import '../../domain/use_cases/create_family_use_case.dart';
import '../../domain/use_cases/delete_family_use_case.dart';
import '../../domain/use_cases/read_family_use_case.dart';
import '../../domain/use_cases/update_family_use_case.dart';
import '../bloc/family_bloc.dart';

final sl = GetIt.instance;

void init() {
  sl.reset();

  // Bloc
  sl.registerFactory(() => FamilyBloc(
    createFamilyUseCase: sl(),
    readFamilysUseCase: sl(),
    updateFamilyUseCase: sl(),
    deleteFamilyUseCase: sl(),
  ));

  // Use cases
  sl.registerLazySingleton(() => CreateFamilyUseCase(sl()));
  sl.registerLazySingleton(() => ReadFamilysUseCase(sl()));
  sl.registerLazySingleton(() => UpdateFamilyUseCase(sl()));
  sl.registerLazySingleton(() => DeleteFamilyUseCase(sl()));

  // Repositories
  sl.registerLazySingleton<FamilyRemoteRepository>(() =>
    FamilyRemoteRepositoryImpl(remoteDataSource: sl()),
  );

  // Data sources
  sl.registerLazySingleton<FamilyRemoteDataSource>(() =>
    FamilyRemoteDataSourceImpl(firestoreInstance: sl()),
  );

  // Core

  // External
  if (!GetIt.I.isRegistered<FirebaseFirestore>()) {
    GetIt.I.registerSingleton<FirebaseFirestore>(FirebaseFirestore.instance);
  }

  // Mappers
}
