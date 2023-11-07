import 'package:dartz/dartz.dart';
import '../../../core/entities/question_entity.dart';
import '../../../core/error/failure.dart';
import '../../../core/models/question_model.dart';

abstract class GuardianQuestionnaireRemoteRepository {
  Future<Either<ServerFailure, void>> createQuestion(QuestionModel question);
  Future<Either<ServerFailure, List<QuestionEntity>>> readQuestions();
  Future<Either<ServerFailure, void>> updateQuestion(QuestionModel question);
  Future<Either<ServerFailure, void>> deleteQuestion(String id);
}
