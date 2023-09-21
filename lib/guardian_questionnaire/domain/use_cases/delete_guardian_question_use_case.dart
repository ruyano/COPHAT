import 'package:cophat/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import '../../../core/use_case.dart';
import '../../data/models/guardian_question_model.dart';
import '../repositories/guardian_questionnaire_remote_repository.dart';

class DeleteGuardianQuestionUseCase implements UseCase<void, DeleteGuardianQuestionUseCaseCaseParams> {

  final GuardianQuestionnaireRemoteRepository remoteRepository;

  DeleteGuardianQuestionUseCase(this.remoteRepository);

  @override
  Future<Either<ServerFailure, void>> call(DeleteGuardianQuestionUseCaseCaseParams params) async {
    await remoteRepository.deleteQuestion(params.id);
    return right(null);
  }
}

class DeleteGuardianQuestionUseCaseCaseParams extends Equatable {

  final String id;

  const DeleteGuardianQuestionUseCaseCaseParams({
    required this.id,
        });

  @override
  List<Object> get props => [
    id,
  ];
}
