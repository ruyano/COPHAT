import 'package:cophat/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../core/models/question_model.dart';
import '../../../core/use_case.dart';
import '../repositories/guardian_questionnaire_remote_repository.dart';

class CreateGuardianQuestionUseCase implements UseCase<void, CreateGuardianQuestionUseCaseParams> {

  final GuardianQuestionnaireRemoteRepository remoteRepository;

  CreateGuardianQuestionUseCase(this.remoteRepository);

  @override
  Future<Either<ServerFailure, void>> call(CreateGuardianQuestionUseCaseParams params) async {
    await remoteRepository.createQuestion(params.question);
    return right(null);
  }
}

class CreateGuardianQuestionUseCaseParams extends Equatable {

  final QuestionModel question;

  const CreateGuardianQuestionUseCaseParams({
    required this.question,
        });

  @override
  List<Object> get props => [
    question,
  ];
}
