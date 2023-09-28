import 'package:cophat/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import '../../../core/use_case.dart';
import '../repositories/child_questionnaire_remote_repository.dart';
import '../entities/child_questionnaire_entity.dart';

class ReadChildQuestionnairesUseCase implements UseCase<List<ChildQuestionnaireEntity>, NoParams> {

  final ChildQuestionnaireRemoteRepository remoteRepository;

  ReadChildQuestionnairesUseCase(this.remoteRepository);

  @override
  Future<Either<ServerFailure, List<ChildQuestionnaireEntity>>> call(NoParams noParams) async {
    return await remoteRepository.readChildQuestionnaires();
  }
}
