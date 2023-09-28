import 'package:dartz/dartz.dart';

import '../../../core/error/failure.dart';
import '../../data/models/child_questionnaire_model.dart';
import '../../domain/entities/child_questionnaire_entity.dart';

abstract class ChildQuestionnaireRemoteRepository {
  Future<Either<ServerFailure, void>> createChildQuestionnaire(ChildQuestionnaireModel childQuestionnaire);
  Future<Either<ServerFailure, List<ChildQuestionnaireEntity>>> readChildQuestionnaires();
  Future<Either<ServerFailure, void>> updateChildQuestionnaire(ChildQuestionnaireModel childQuestionnaire);
  Future<Either<ServerFailure, void>> deleteChildQuestionnaire(String id);
}
