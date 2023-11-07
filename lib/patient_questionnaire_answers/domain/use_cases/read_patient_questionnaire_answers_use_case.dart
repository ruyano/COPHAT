import 'package:cophat/core/error/failure.dart';
import 'package:cophat/core/models/answers_model.dart';
import 'package:dartz/dartz.dart';
import '../../../core/use_case.dart';
import '../repositories/patient_questionnaire_answers_remote_repository.dart';

class ReadPatientQuestionnaireAnswerssUseCase implements UseCase<List<AnswersModel>, NoParams> {

  final PatientQuestionnaireAnswersRemoteRepository remoteRepository;

  ReadPatientQuestionnaireAnswerssUseCase(this.remoteRepository);

  @override
  Future<Either<ServerFailure, List<AnswersModel>>> call(NoParams noParams) async {
    return await remoteRepository.readPatientQuestionnaireAnswerss();
  }
}
