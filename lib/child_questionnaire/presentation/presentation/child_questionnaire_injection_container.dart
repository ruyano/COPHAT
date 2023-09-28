import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get_it/get_it.dart';
import '../../data/datasources/child_questionnaire_remote_data_source.dart';
import '../../data/repositories/child_questionnaire_remote_repository_impl.dart';
import '../../domain/repositories/child_questionnaire_remote_repository.dart';
import '../../domain/use_cases/create_child_questionnaire_use_case.dart';
import '../../domain/use_cases/delete_child_questionnaire_use_case.dart';
import '../../domain/use_cases/read_child_questionnaire_use_case.dart';
import '../../domain/use_cases/update_child_questionnaire_use_case.dart';
import '../bloc/child_questionnaire_bloc.dart';

final sl = GetIt.instance;

void init() {
  sl.reset();

  // Bloc
  sl.registerFactory(() => ChildQuestionnaireBloc(
    createChildQuestionnaireUseCase: sl(),
    readChildQuestionnairesUseCase: sl(),
    updateChildQuestionnaireUseCase: sl(),
    deleteChildQuestionnaireUseCase: sl(),
  ));

  // Use cases
  sl.registerLazySingleton(() => CreateChildQuestionnaireUseCase(sl()));
  sl.registerLazySingleton(() => ReadChildQuestionnairesUseCase(sl()));
  sl.registerLazySingleton(() => UpdateChildQuestionnaireUseCase(sl()));
  sl.registerLazySingleton(() => DeleteChildQuestionnaireUseCase(sl()));

  // Repositories
  sl.registerLazySingleton<ChildQuestionnaireRemoteRepository>(() =>
    ChildQuestionnaireRemoteRepositoryImpl(remoteDataSource: sl()),
  );

  // Data sources
  sl.registerLazySingleton<ChildQuestionnaireRemoteDataSource>(() =>
    ChildQuestionnaireRemoteDataSourceImpl(firestoreInstance: sl()),
  );

  // Core

  // External
  if (!GetIt.I.isRegistered<FirebaseFirestore>()) {
    GetIt.I.registerSingleton<FirebaseFirestore>(FirebaseFirestore.instance);
  }

  // Mappers
}
