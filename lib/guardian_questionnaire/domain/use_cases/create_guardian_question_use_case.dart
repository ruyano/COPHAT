import 'package:cophat/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../core/use_case.dart';
import '../../data/models/guardian_question_model.dart';
import '../entities/guardian_question_entity.dart';
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

  final GuardianQuestionModel question;

  const CreateGuardianQuestionUseCaseParams({
    required this.question,
        });

  @override
  List<Object> get props => [
    question,
  ];
}
