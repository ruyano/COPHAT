import 'package:cophat/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import '../../../core/use_case.dart';
import '../repositories/patient_questionnaire_answers_remote_repository.dart';
import '../entities/patient_questionnaire_answers_entity.dart';

class ReadPatientQuestionnaireAnswerssUseCase implements UseCase<List<PatientQuestionnaireAnswersEntity>, NoParams> {

  final PatientQuestionnaireAnswersRemoteRepository remoteRepository;

  ReadPatientQuestionnaireAnswerssUseCase(this.remoteRepository);

  @override
  Future<Either<ServerFailure, List<PatientQuestionnaireAnswersEntity>>> call(NoParams noParams) async {
    return await remoteRepository.readPatientQuestionnaireAnswerss();
  }
}
