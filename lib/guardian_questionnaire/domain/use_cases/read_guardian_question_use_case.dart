import 'package:cophat/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import '../../../core/entities/question_entity.dart';
import '../../../core/use_case.dart';
import '../repositories/guardian_questionnaire_remote_repository.dart';

class ReadGuardianQuestionsUseCase implements UseCase<List<QuestionEntity>, NoParams> {

  final GuardianQuestionnaireRemoteRepository remoteRepository;

  ReadGuardianQuestionsUseCase(this.remoteRepository);

  @override
  Future<Either<ServerFailure, List<QuestionEntity>>> call(NoParams noParams) async {
    return await remoteRepository.readQuestions();
  }
}
