import 'package:dartz/dartz.dart';

import '../../../core/error/exceptions.dart';
import '../../../core/error/failure.dart';
import '../../domain/repositories/patient_remote_repository.dart';
import '../datasources/patient_remote_data_source.dart';
import '../models/patient_model.dart';
import '../../domain/entities/patient_entity.dart';

class PatientRemoteRepositoryImpl implements PatientRemoteRepository {
  
  final PatientRemoteDataSource remoteDataSource;

  PatientRemoteRepositoryImpl({
    required this.remoteDataSource
  });

  @override
  Future<Either<ServerFailure, void>> createPatient(
    PatientModel patient,
    ) async {
      try {
        await remoteDataSource.createPatient(patient);
        return const Right(null);
      } catch(error) {
        if(error is ServerException) {
          return Left(ServerFailure(message: error.message));
        } else {
          return const Left(ServerFailure(message: 'Erro ao criar Patient.'));
        }
      }
  }

  @override
  Future<Either<ServerFailure, List<PatientEntity>>> readPatients() async {
    try {
      final result = await remoteDataSource.readPatients();
      return Right(result);
    } catch(error) {
      if(error is ServerException) {
        return Left(ServerFailure(message: error.message));
      } else {
        return const Left(ServerFailure(message: 'Erro ao ler Patient.'));
      }
    }
  }
  
  @override
  Future<Either<ServerFailure, void>> updatePatient(
    PatientModel patient,
    ) async {
      try {
        await remoteDataSource.updatePatient(patient);
        return const Right(null);
      } catch(error) {
        if(error is ServerException) {
          return Left(ServerFailure(message: error.message));
        } else {
          return const Left(ServerFailure(message: 'Erro ao atualizar Patient.'));
        }
    }
  }
  
  @override
  Future<Either<ServerFailure, void>> deletePatient(
    String id,
    ) async {
      try {
        await remoteDataSource.deletePatient(id);
        return const Right(null);
      } catch(error) {
        if(error is ServerException) {
          return Left(ServerFailure(message: error.message));
        } else {
          return const Left(ServerFailure(message: 'Erro ao deletar Patient.'));
        }
      }
  }
  
}
