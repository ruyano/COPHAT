import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import '../../../core/error/failure.dart';
import '../../../core/use_case.dart';
import '../repositories/child_questionnaire_remote_repository.dart';

class DeleteChildQuestionnaireUseCase implements UseCase<void, DeleteChildQuestionnaireUseCaseParams> {

  final ChildQuestionnaireRemoteRepository remoteRepository;

  DeleteChildQuestionnaireUseCase(this.remoteRepository);

  @override
  Future<Either<Failure, void>> call(DeleteChildQuestionnaireUseCaseParams params) async {
    await remoteRepository.deleteChildQuestionnaire(params.id);
    return right(null);
  }
}

class DeleteChildQuestionnaireUseCaseParams extends Equatable {

  final String id;

  const DeleteChildQuestionnaireUseCaseParams({
    required this.id,
  });

  @override
  List<Object> get props => [
    id,
  ];
}
