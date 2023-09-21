import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cophat/guardian_questionnaire/domain/use_cases/create_guardian_question_use_case.dart';
import 'package:cophat/guardian_questionnaire/domain/use_cases/delete_guardian_question_use_case.dart';
import 'package:cophat/guardian_questionnaire/domain/use_cases/update_guardian_question_use_case.dart';
import 'package:get_it/get_it.dart';
import '../../data/datasources/guardian_questionnaire_remote_data_source.dart';
import '../../data/repositories/guardian_questionnaire_remote_repository_impl.dart';
import '../../domain/repositories/guardian_questionnaire_remote_repository.dart';
import '../../domain/use_cases/read_guardian_question_use_case.dart';
import '../bloc/guardian_questionnaire_bloc.dart';

final sl = GetIt.instance;

void init() {
  sl.reset();

  // Blocs
  sl.registerFactory(() => GuardianQuestionnaireBloc(
    createGuardianQuestionUseCase: sl(),
    readGuardianQuestionsUseCase: sl(),
    updateGuardianQuestionUseCase: sl(),
    deleteGuardianQuestionUseCase: sl(),
  ));

  // Use cases
  sl.registerLazySingleton(() => CreateGuardianQuestionUseCase(sl()));
  sl.registerLazySingleton(() => ReadGuardianQuestionsUseCase(sl()));
  sl.registerLazySingleton(() => UpdateGuardianQuestionUseCase(sl()));
  sl.registerLazySingleton(() => DeleteGuardianQuestionUseCase(sl()));

  // Repositories
  sl.registerLazySingleton<GuardianQuestionnaireRemoteRepository>(() =>
    GuardianQuestionnaireRemoteRepositoryImpl(remoteDataSource: sl()),
  );

  // Data sources
  sl.registerLazySingleton<GuardianQuestionnaireRemoteDataSource>(() =>
      GuardianQuestionnaireRemoteDataSourceImpl(firestoreInstance: sl()),
  );

  // Core

  // External
  if (!GetIt.I.isRegistered<FirebaseFirestore>()) {
    GetIt.I.registerSingleton<FirebaseFirestore>(FirebaseFirestore.instance);
  }

  // Mappers
}
