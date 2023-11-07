import 'package:dartz/dartz.dart';

import '../../../core/error/failure.dart';
import '../../../core/models/answers_model.dart';

abstract class PatientQuestionnaireAnswersRemoteRepository {
  Future<Either<ServerFailure, void>> createPatientQuestionnaireAnswers(AnswersModel patientQuestionnaireAnswers);
  Future<Either<ServerFailure, List<AnswersModel>>> readPatientQuestionnaireAnswerss();
  Future<Either<ServerFailure, void>> updatePatientQuestionnaireAnswers(AnswersModel patientQuestionnaireAnswers);
  Future<Either<ServerFailure, void>> deletePatientQuestionnaireAnswers(String id);
}
