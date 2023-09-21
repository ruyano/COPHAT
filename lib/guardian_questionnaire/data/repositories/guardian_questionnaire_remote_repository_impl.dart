import 'package:cophat/guardian_questionnaire/data/models/guardian_question_model.dart';
import 'package:cophat/guardian_questionnaire/domain/entities/guardian_question_entity.dart';
import 'package:dartz/dartz.dart';
import '../../../core/error/exceptions.dart';
import '../../../core/error/failure.dart';
import '../../domain/repositories/guardian_questionnaire_remote_repository.dart';
import '../datasources/guardian_questionnaire_remote_data_source.dart';

class GuardianQuestionnaireRemoteRepositoryImpl implements GuardianQuestionnaireRemoteRepository {

  final GuardianQuestionnaireRemoteDataSource remoteDataSource;

  GuardianQuestionnaireRemoteRepositoryImpl({
    required this.remoteDataSource
  });

  @override
  Future<Either<ServerFailure, List<GuardianQuestionEntity>>> readQuestions() async {
    try {
      final result = await remoteDataSource.readQuestions();
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
  Future<Either<ServerFailure, void>> createQuestion(
      GuardianQuestionModel question,
      ) async {
    try {
      await remoteDataSource.createQuestion(question);
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
  Future<Either<ServerFailure, void>> updateQuestion(
      GuardianQuestionModel question,
      ) async {
    try {
      await remoteDataSource.updateQuestion(question);
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
  Future<Either<ServerFailure, void>> deleteQuestion(
      String id,
      ) async {
    try {
      await remoteDataSource.deleteQuestion(id);
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
