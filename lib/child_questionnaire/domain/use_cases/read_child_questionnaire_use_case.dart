import 'package:cophat/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import '../../../core/entities/question_entity.dart';
import '../../../core/use_case.dart';
import '../repositories/child_questionnaire_remote_repository.dart';

class ReadChildQuestionnairesUseCase implements UseCase<List<QuestionEntity>, NoParams> {

  final ChildQuestionnaireRemoteRepository remoteRepository;

  ReadChildQuestionnairesUseCase(this.remoteRepository);

  @override
  Future<Either<ServerFailure, List<QuestionEntity>>> call(NoParams noParams) async {
    return await remoteRepository.readChildQuestionnaires();
  }
}
