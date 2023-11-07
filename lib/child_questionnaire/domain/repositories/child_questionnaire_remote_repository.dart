import 'package:dartz/dartz.dart';

import '../../../core/entities/question_entity.dart';
import '../../../core/error/failure.dart';
import '../../../core/models/question_model.dart';


abstract class ChildQuestionnaireRemoteRepository {
  Future<Either<ServerFailure, void>> createChildQuestionnaire(QuestionModel childQuestionnaire);
  Future<Either<ServerFailure, List<QuestionEntity>>> readChildQuestionnaires();
  Future<Either<ServerFailure, void>> updateChildQuestionnaire(QuestionModel childQuestionnaire);
  Future<Either<ServerFailure, void>> deleteChildQuestionnaire(String id);
}
