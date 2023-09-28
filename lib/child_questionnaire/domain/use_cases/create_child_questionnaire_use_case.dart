import 'package:cophat/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import '../../../core/use_case.dart';
import '../../data/models/child_questionnaire_model.dart';
import '../repositories/child_questionnaire_remote_repository.dart';

class CreateChildQuestionnaireUseCase implements UseCase<void, CreateChildQuestionnaireUseCaseParams> {

  final ChildQuestionnaireRemoteRepository remoteRepository;

  CreateChildQuestionnaireUseCase(this.remoteRepository);

  @override
  Future<Either<Failure, void>> call(CreateChildQuestionnaireUseCaseParams params) async {
    await remoteRepository.createChildQuestionnaire(params.childQuestionnaire);
    return right(null);
  }
}

class CreateChildQuestionnaireUseCaseParams extends Equatable {

  final ChildQuestionnaireModel childQuestionnaire;

  const CreateChildQuestionnaireUseCaseParams({
    required this.childQuestionnaire,
  });

  @override
  List<Object> get props => [
    childQuestionnaire,
  ];
}
