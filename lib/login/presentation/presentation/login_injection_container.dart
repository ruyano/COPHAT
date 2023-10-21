import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';

import '../../data/datasources/login_remote_data_source.dart';
import '../../data/repositories/login_remote_repository_impl.dart';
import '../../domain/repositories/login_remote_repository.dart';
import '../../domain/use_cases/do_login_use_case.dart';
import '../bloc/login_bloc.dart';

final sl = GetIt.instance;

void init() {
  sl.reset();

  // Blocs
  sl.registerFactory(() => LoginBloc(
    doLoginUseCase: sl(),
  ));

  // Use cases
  sl.registerLazySingleton(() => doLoginUseCase(sl()));

  // Repositories
  sl.registerLazySingleton<LoginRemoteRepository>(() =>
    LoginRemoteRepositoryImpl(remoteDataSource: sl()),
  );

  // Data sources
  sl.registerLazySingleton<LoginRemoteDataSource>(() =>
    LoginRemoteDataSourceImpl(
      firestoreInstance: sl(),
      authInstance: sl(),
    ),
  );

  // Core

  // External
  if (!GetIt.I.isRegistered<FirebaseFirestore>()) {
    GetIt.I.registerSingleton<FirebaseFirestore>(FirebaseFirestore.instance);
  }

  if (!GetIt.I.isRegistered<FirebaseAuth>()) {
    GetIt.I.registerSingleton<FirebaseAuth>(FirebaseAuth.instance);
  }

  // Mappers
}
