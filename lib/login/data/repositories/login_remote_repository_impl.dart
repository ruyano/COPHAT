import 'package:cophat/core/error/exceptions.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../core/error/failure.dart';
import '../../domain/entities/login_entity.dart';
import '../../domain/repositories/login_remote_repository.dart';
import '../datasources/login_remote_data_source.dart';

class LoginRemoteRepositoryImpl implements LoginRemoteRepository {
  final LoginRemoteDataSource remoteDataSource;

  LoginRemoteRepositoryImpl({
    required this.remoteDataSource
  });

  @override
  Future<Either<ServerFailure, LoginEntity>> doLogin({
    required String email,
    required String password,
  }) async {
    try {
      final result = await remoteDataSource.doLogin(
        email: email,
        password: password,
      );
      return Right(result);
    } catch(error) {
      if(error is ServerException) {
        return Left(ServerFailure(message: error.message));
      } else {
        return const Left(ServerFailure(message: 'Erro ao tentar realiar o login.'));
      }

    }
  }

  @override
  Future<Either<ServerFailure, UserCredential>> createUser({
    required String email,
    required String password,
  }) async {
    try {
      final result = await remoteDataSource.createUser(
        email: email,
        password: password,
      );
      return Right(result);
    } catch(error) {
      if(error is ServerException) {
        return Left(ServerFailure(message: error.message));
      } else {
        return const Left(ServerFailure(message: 'Erro ao tentar criar usuário.'));
      }

    }
  }
}
