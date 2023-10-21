import 'package:dartz/dartz.dart';

import '../../../core/error/exceptions.dart';
import '../../../core/error/failure.dart';
import '../../domain/repositories/user_remote_repository.dart';
import '../datasources/user_remote_data_source.dart';
import '../models/user_model.dart';
import '../../domain/entities/user_entity.dart';

class UserRemoteRepositoryImpl implements UserRemoteRepository {
  
  final UserRemoteDataSource remoteDataSource;

  UserRemoteRepositoryImpl({
    required this.remoteDataSource
  });

  @override
  Future<Either<ServerFailure, void>> createUser(
    UserModel user,
    ) async {
      try {
        await remoteDataSource.createUser(user);
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
  Future<Either<ServerFailure, List<UserEntity>>> readUsers() async {
    try {
      final result = await remoteDataSource.readUsers();
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
  Future<Either<ServerFailure, void>> updateUser(
    UserModel user,
    ) async {
      try {
        await remoteDataSource.updateUser(user);
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
  Future<Either<ServerFailure, void>> deleteUser(
    String id,
    ) async {
      try {
        await remoteDataSource.deleteUser(id);
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
