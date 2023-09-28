import 'package:cophat/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import '../../../core/use_case.dart';
import '../../data/models/child_questionnaire_model.dart';
import '../repositories/child_questionnaire_remote_repository.dart';

class UpdateChildQuestionnaireUseCase implements UseCase<void, UpdateChildQuestionnaireUseCaseParams> {

  final ChildQuestionnaireRemoteRepository remoteRepository;

  UpdateChildQuestionnaireUseCase(this.remoteRepository);

  @override
  Future<Either<Failure, void>> call(UpdateChildQuestionnaireUseCaseParams params) async {
    await remoteRepository.updateChildQuestionnaire(params.childQuestionnaire);
    return right(null);
  }
}

class UpdateChildQuestionnaireUseCaseParams extends Equatable {

  final ChildQuestionnaireModel childQuestionnaire;

  const UpdateChildQuestionnaireUseCaseParams({
    required this.childQuestionnaire,
  });

  @override
  List<Object> get props => [
    childQuestionnaire,
  ];
}
