import 'package:dartz/dartz.dart';

import '../../../core/error/exceptions.dart';
import '../../../core/error/failure.dart';
import '../../../core/models/answers_model.dart';
import '../../domain/repositories/patient_questionnaire_answers_remote_repository.dart';
import '../datasources/patient_questionnaire_answers_remote_data_source.dart';

class PatientQuestionnaireAnswersRemoteRepositoryImpl implements PatientQuestionnaireAnswersRemoteRepository {
  
  final PatientQuestionnaireAnswersRemoteDataSource remoteDataSource;

  PatientQuestionnaireAnswersRemoteRepositoryImpl({
    required this.remoteDataSource
  });

  @override
  Future<Either<ServerFailure, void>> createPatientQuestionnaireAnswers(
    AnswersModel patientQuestionnaireAnswers,
    ) async {
      try {
        await remoteDataSource.createPatientQuestionnaireAnswers(patientQuestionnaireAnswers);
        return const Right(null);
      } catch(error) {
        if(error is ServerException) {
          return Left(ServerFailure(message: error.message));
        } else {
          return const Left(ServerFailure(message: 'Erro ao criar PatientQuestionnaireAnswers.'));
        }
      }
  }

  @override
  Future<Either<ServerFailure, List<AnswersModel>>> readPatientQuestionnaireAnswerss() async {
    try {
      final result = await remoteDataSource.readPatientQuestionnaireAnswerss();
      return Right(result);
    } catch(error) {
      if(error is ServerException) {
        return Left(ServerFailure(message: error.message));
      } else {
        return const Left(ServerFailure(message: 'Erro ao ler PatientQuestionnaireAnswers.'));
      }
    }
  }
  
  @override
  Future<Either<ServerFailure, void>> updatePatientQuestionnaireAnswers(
    AnswersModel patientQuestionnaireAnswers,
    ) async {
      try {
        await remoteDataSource.updatePatientQuestionnaireAnswers(patientQuestionnaireAnswers);
        return const Right(null);
      } catch(error) {
        if(error is ServerException) {
          return Left(ServerFailure(message: error.message));
        } else {
          return const Left(ServerFailure(message: 'Erro ao atualizar PatientQuestionnaireAnswers.'));
        }
    }
  }
  
  @override
  Future<Either<ServerFailure, void>> deletePatientQuestionnaireAnswers(
    String id,
    ) async {
      try {
        await remoteDataSource.deletePatientQuestionnaireAnswers(id);
        return const Right(null);
      } catch(error) {
        if(error is ServerException) {
          return Left(ServerFailure(message: error.message));
        } else {
          return const Left(ServerFailure(message: 'Erro ao deletar PatientQuestionnaireAnswers.'));
        }
      }
  }
  
}
