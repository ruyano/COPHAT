import 'package:dartz/dartz.dart';
import '../../../core/error/failure.dart';
import '../../data/models/guardian_question_model.dart';
import '../../domain/entities/guardian_question_entity.dart';

abstract class GuardianQuestionnaireRemoteRepository {
  Future<Either<ServerFailure, void>> createQuestion(GuardianQuestionModel question);
  Future<Either<ServerFailure, List<GuardianQuestionEntity>>> readQuestions();
  Future<Either<ServerFailure, void>> updateQuestion(GuardianQuestionModel question);
  Future<Either<ServerFailure, void>> deleteQuestion(String id);
}
