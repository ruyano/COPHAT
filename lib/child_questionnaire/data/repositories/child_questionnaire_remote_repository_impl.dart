import 'package:dartz/dartz.dart';

import '../../../core/entities/question_entity.dart';
import '../../../core/error/exceptions.dart';
import '../../../core/error/failure.dart';
import '../../../core/models/question_model.dart';
import '../../domain/repositories/child_questionnaire_remote_repository.dart';
import '../datasources/child_questionnaire_remote_data_source.dart';

class ChildQuestionnaireRemoteRepositoryImpl implements ChildQuestionnaireRemoteRepository {
  
  final ChildQuestionnaireRemoteDataSource remoteDataSource;

  ChildQuestionnaireRemoteRepositoryImpl({
    required this.remoteDataSource
  });

  @override
  Future<Either<ServerFailure, void>> createChildQuestionnaire(
    QuestionModel childQuestionnaire,
    ) async {
      try {
        await remoteDataSource.createChildQuestionnaire(childQuestionnaire);
        return const Right(null);
      } catch(error) {
        if(error is ServerException) {
          return Left(ServerFailure(message: error.message));
        } else {
          return const Left(ServerFailure(message: 'Erro ao criar a questão.'));
        }
      }
  }

  @override
  Future<Either<ServerFailure, List<QuestionEntity>>> readChildQuestionnaires() async {
    try {
      final result = await remoteDataSource.readChildQuestionnaires();
      return Right(result);
    } catch(error) {
      if(error is ServerException) {
        return Left(ServerFailure(message: error.message));
      } else {
        return const Left(ServerFailure(message: 'Erro ao ler as questões.'));
      }
    }
  }
  
  @override
  Future<Either<ServerFailure, void>> updateChildQuestionnaire(
    QuestionModel childQuestionnaire,
    ) async {
      try {
        await remoteDataSource.updateChildQuestionnaire(childQuestionnaire);
        return const Right(null);
      } catch(error) {
        if(error is ServerException) {
          return Left(ServerFailure(message: error.message));
        } else {
          return const Left(ServerFailure(message: 'Erro ao atualizar a questão.'));
        }
    }
  }
  
  @override
  Future<Either<ServerFailure, void>> deleteChildQuestionnaire(
    String id,
    ) async {
      try {
        await remoteDataSource.deleteChildQuestionnaire(id);
        return const Right(null);
      } catch(error) {
        if(error is ServerException) {
          return Left(ServerFailure(message: error.message));
        } else {
          return const Left(ServerFailure(message: 'Erro ao deletar a questão.'));
        }
      }
  }
  
}
