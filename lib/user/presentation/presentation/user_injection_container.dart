import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cophat/login/domain/use_cases/auth_create_user_use_case.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import '../../data/datasources/user_remote_data_source.dart';
import '../../data/repositories/user_remote_repository_impl.dart';
import '../../domain/repositories/user_remote_repository.dart';
import '../../domain/use_cases/create_user_use_case.dart';
import '../../domain/use_cases/delete_user_use_case.dart';
import '../../domain/use_cases/read_user_use_case.dart';
import '../../domain/use_cases/update_user_use_case.dart';
import '../bloc/user_bloc.dart';

final sl = GetIt.instance;

void init() {
  sl.reset();

  // Bloc
  sl.registerFactory(() => UserBloc(
    createUserUseCase: sl(),
    readUsersUseCase: sl(),
    updateUserUseCase: sl(),
    deleteUserUseCase: sl(),
  ));

  // Use cases
  sl.registerLazySingleton(() => CreateUserUseCase(sl()));
  sl.registerLazySingleton(() => ReadUsersUseCase(sl()));
  sl.registerLazySingleton(() => UpdateUserUseCase(sl()));
  sl.registerLazySingleton(() => DeleteUserUseCase(sl()));

  // Repositories
  sl.registerLazySingleton<UserRemoteRepository>(() =>
      UserRemoteRepositoryImpl(remoteDataSource: sl()),
  );

  // Data sources
  sl.registerLazySingleton<UserRemoteDataSource>(() =>
      UserRemoteDataSourceImpl(
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
