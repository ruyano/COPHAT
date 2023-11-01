import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import '../../../core/error/failure.dart';
import '../../../core/use_case.dart';
import '../repositories/patient_questionnaire_answers_remote_repository.dart';

class DeletePatientQuestionnaireAnswersUseCase implements UseCase<void, DeletePatientQuestionnaireAnswersUseCaseParams> {

  final PatientQuestionnaireAnswersRemoteRepository remoteRepository;

  DeletePatientQuestionnaireAnswersUseCase(this.remoteRepository);

  @override
  Future<Either<Failure, void>> call(DeletePatientQuestionnaireAnswersUseCaseParams params) async {
    return await remoteRepository.deletePatientQuestionnaireAnswers(params.id);
  }
}

class DeletePatientQuestionnaireAnswersUseCaseParams extends Equatable {

  final String id;

  const DeletePatientQuestionnaireAnswersUseCaseParams({
    required this.id,
  });

  @override
  List<Object> get props => [
    id,
  ];
}
