import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get_it/get_it.dart';
import '../../../child_questionnaire/data/datasources/child_questionnaire_remote_data_source.dart';
import '../../../child_questionnaire/data/repositories/child_questionnaire_remote_repository_impl.dart';
import '../../../child_questionnaire/domain/repositories/child_questionnaire_remote_repository.dart';
import '../../../child_questionnaire/domain/use_cases/read_child_questionnaire_use_case.dart';
import '../../data/datasources/patient_questionnaire_answers_remote_data_source.dart';
import '../../data/repositories/patient_questionnaire_answers_remote_repository_impl.dart';
import '../../domain/repositories/patient_questionnaire_answers_remote_repository.dart';
import '../../domain/use_cases/create_patient_questionnaire_answers_use_case.dart';
import '../../domain/use_cases/delete_patient_questionnaire_answers_use_case.dart';
import '../../domain/use_cases/read_patient_questionnaire_answers_use_case.dart';
import '../../domain/use_cases/update_patient_questionnaire_answers_use_case.dart';
import '../bloc/patient_questionnaire_answers_bloc.dart';

final sl = GetIt.instance;

void init() {
  sl.reset();

  // Bloc
  sl.registerFactory(() => PatientQuestionnaireAnswersBloc(
    createPatientQuestionnaireAnswersUseCase: sl(),
    readPatientQuestionnaireAnswerssUseCase: sl(),
    updatePatientQuestionnaireAnswersUseCase: sl(),
    deletePatientQuestionnaireAnswersUseCase: sl(),
    readChildQuestionnairesUseCase: sl(),
  ));

  // Use cases
  sl.registerLazySingleton(() => CreatePatientQuestionnaireAnswersUseCase(sl()));
  sl.registerLazySingleton(() => ReadPatientQuestionnaireAnswerssUseCase(sl()));
  sl.registerLazySingleton(() => UpdatePatientQuestionnaireAnswersUseCase(sl()));
  sl.registerLazySingleton(() => DeletePatientQuestionnaireAnswersUseCase(sl()));

  sl.registerLazySingleton(() => ReadChildQuestionnairesUseCase(sl()));

  // Repositories
  sl.registerLazySingleton<PatientQuestionnaireAnswersRemoteRepository>(() =>
    PatientQuestionnaireAnswersRemoteRepositoryImpl(remoteDataSource: sl()),
  );
  sl.registerLazySingleton<ChildQuestionnaireRemoteRepository>(() =>
      ChildQuestionnaireRemoteRepositoryImpl(remoteDataSource: sl()),
  );

  // Data sources
  sl.registerLazySingleton<PatientQuestionnaireAnswersRemoteDataSource>(() =>
    PatientQuestionnaireAnswersRemoteDataSourceImpl(firestoreInstance: sl()),
  );
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
