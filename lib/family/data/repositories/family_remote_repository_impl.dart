import 'package:dartz/dartz.dart';

import '../../../core/error/exceptions.dart';
import '../../../core/error/failure.dart';
import '../../domain/repositories/family_remote_repository.dart';
import '../datasources/family_remote_data_source.dart';
import '../models/family_model.dart';
import '../../domain/entities/family_entity.dart';

class FamilyRemoteRepositoryImpl implements FamilyRemoteRepository {
  
  final FamilyRemoteDataSource remoteDataSource;

  FamilyRemoteRepositoryImpl({
    required this.remoteDataSource
  });

  @override
  Future<Either<ServerFailure, void>> createFamily(
    FamilyModel family,
    ) async {
      try {
        await remoteDataSource.createFamily(family);
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
  Future<Either<ServerFailure, List<FamilyEntity>>> readFamilys() async {
    try {
      final result = await remoteDataSource.readFamilys();
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
  Future<Either<ServerFailure, void>> updateFamily(
    FamilyModel family,
    ) async {
      try {
        await remoteDataSource.updateFamily(family);
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
  Future<Either<ServerFailure, void>> deleteFamily(
    String id,
    ) async {
      try {
        await remoteDataSource.deleteFamily(id);
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
