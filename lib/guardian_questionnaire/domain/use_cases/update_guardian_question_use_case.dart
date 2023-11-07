import 'package:cophat/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import '../../../core/models/question_model.dart';
import '../../../core/use_case.dart';
import '../repositories/guardian_questionnaire_remote_repository.dart';

class UpdateGuardianQuestionUseCase implements UseCase<void, UpdateGuardianQuestionUseCaseParams> {

  final GuardianQuestionnaireRemoteRepository remoteRepository;

  UpdateGuardianQuestionUseCase(this.remoteRepository);

  @override
  Future<Either<ServerFailure, void>> call(UpdateGuardianQuestionUseCaseParams params) async {
    await remoteRepository.updateQuestion(params.question);
    return right(null);
  }
}

class UpdateGuardianQuestionUseCaseParams extends Equatable {

  final QuestionModel question;

  const UpdateGuardianQuestionUseCaseParams({
    required this.question,
        });

  @override
  List<Object> get props => [
    question,
  ];
}
