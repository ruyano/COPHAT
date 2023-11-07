import 'package:cophat/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import '../../../core/models/answers_model.dart';
import '../../../core/use_case.dart';
import '../repositories/patient_questionnaire_answers_remote_repository.dart';

class UpdatePatientQuestionnaireAnswersUseCase implements UseCase<void, UpdatePatientQuestionnaireAnswersUseCaseParams> {

  final PatientQuestionnaireAnswersRemoteRepository remoteRepository;

  UpdatePatientQuestionnaireAnswersUseCase(this.remoteRepository);

  @override
  Future<Either<Failure, void>> call(UpdatePatientQuestionnaireAnswersUseCaseParams params) async {
    return await remoteRepository.updatePatientQuestionnaireAnswers(params.patientQuestionnaireAnswers);
  }
}

class UpdatePatientQuestionnaireAnswersUseCaseParams extends Equatable {

  final AnswersModel patientQuestionnaireAnswers;

  const UpdatePatientQuestionnaireAnswersUseCaseParams({
    required this.patientQuestionnaireAnswers,
  });

  @override
  List<Object> get props => [
    patientQuestionnaireAnswers,
  ];
}
