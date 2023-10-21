import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get_it/get_it.dart';
import '../../../data/datasources/patient_remote_data_source.dart';
import '../../../data/repositories/patient_remote_repository_impl.dart';
import '../../../domain/repositories/patient_remote_repository.dart';
import '../../../domain/use_cases/create_patient_use_case.dart';
import '../../../domain/use_cases/delete_patient_use_case.dart';
import '../../../domain/use_cases/read_patient_use_case.dart';
import '../../../domain/use_cases/update_patient_use_case.dart';
import '../bloc/patient_bloc.dart';

final sl = GetIt.instance;

void init() {
  sl.reset();

  // Bloc
  sl.registerFactory(() => PatientBloc(
    createPatientUseCase: sl(),
    readPatientsUseCase: sl(),
    updatePatientUseCase: sl(),
    deletePatientUseCase: sl(),
  ));

  // Use cases
  sl.registerLazySingleton(() => CreatePatientUseCase(sl()));
  sl.registerLazySingleton(() => ReadPatientsUseCase(sl()));
  sl.registerLazySingleton(() => UpdatePatientUseCase(sl()));
  sl.registerLazySingleton(() => DeletePatientUseCase(sl()));

  // Repositories
  sl.registerLazySingleton<PatientRemoteRepository>(() =>
    PatientRemoteRepositoryImpl(remoteDataSource: sl()),
  );

  // Data sources
  sl.registerLazySingleton<PatientRemoteDataSource>(() =>
    PatientRemoteDataSourceImpl(firestoreInstance: sl()),
  );

  // Core

  // External
  if (!GetIt.I.isRegistered<FirebaseFirestore>()) {
    GetIt.I.registerSingleton<FirebaseFirestore>(FirebaseFirestore.instance);
  }

  // Mappers
}
