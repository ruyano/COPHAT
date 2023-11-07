import 'package:cophat/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import '../../../core/models/answers_model.dart';
import '../../../core/use_case.dart';
import '../repositories/patient_questionnaire_answers_remote_repository.dart';

class CreatePatientQuestionnaireAnswersUseCase implements UseCase<void, CreatePatientQuestionnaireAnswersUseCaseParams> {

  final PatientQuestionnaireAnswersRemoteRepository remoteRepository;

  CreatePatientQuestionnaireAnswersUseCase(this.remoteRepository);

  @override
  Future<Either<Failure, void>> call(CreatePatientQuestionnaireAnswersUseCaseParams params) async {
    return await remoteRepository.createPatientQuestionnaireAnswers(params.patientQuestionnaireAnswers);
  }
}

class CreatePatientQuestionnaireAnswersUseCaseParams extends Equatable {

  final AnswersModel patientQuestionnaireAnswers;

  const CreatePatientQuestionnaireAnswersUseCaseParams({
    required this.patientQuestionnaireAnswers,
  });

  @override
  List<Object> get props => [
    patientQuestionnaireAnswers,
  ];
}
