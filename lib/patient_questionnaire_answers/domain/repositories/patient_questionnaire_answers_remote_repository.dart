import 'package:dartz/dartz.dart';

import '../../../core/error/failure.dart';
import '../../data/models/patient_questionnaire_answers_model.dart';
import '../../domain/entities/patient_questionnaire_answers_entity.dart';

abstract class PatientQuestionnaireAnswersRemoteRepository {
  Future<Either<ServerFailure, void>> createPatientQuestionnaireAnswers(PatientQuestionnaireAnswersModel patientQuestionnaireAnswers);
  Future<Either<ServerFailure, List<PatientQuestionnaireAnswersEntity>>> readPatientQuestionnaireAnswerss();
  Future<Either<ServerFailure, void>> updatePatientQuestionnaireAnswers(PatientQuestionnaireAnswersModel patientQuestionnaireAnswers);
  Future<Either<ServerFailure, void>> deletePatientQuestionnaireAnswers(String id);
}
