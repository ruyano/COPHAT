import 'package:cophat/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import '../../../core/use_case.dart';
import '../repositories/guardian_questionnaire_remote_repository.dart';
import '../entities/guardian_question_entity.dart';

class ReadGuardianQuestionsUseCase implements UseCase<List<GuardianQuestionEntity>, NoParams> {

  final GuardianQuestionnaireRemoteRepository remoteRepository;

  ReadGuardianQuestionsUseCase(this.remoteRepository);

  @override
  Future<Either<ServerFailure, List<GuardianQuestionEntity>>> call(NoParams noParams) async {
    return await remoteRepository.readQuestions();
  }
}
