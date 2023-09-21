import 'package:dartz/dartz.dart';

import 'package:pubbank/new_pubbank/core/error/failures.dart';
import 'package:pubbank/new_pubbank/core/error/exceptions.dart';

import '../../domain/repositories/{{bloc.snakeCase()}}_remote_repository.dart';
import '../datasources/{{bloc.snakeCase()}}_remote_data_source.dart';
import '../models/{{bloc.snakeCase()}}_model.dart';

class {{bloc.pascalCase()}}RemoteRepositoryImpl implements {{bloc.pascalCase()}}RemoteRepository {
  final {{bloc.pascalCase()}}RemoteDataSource remoteDataSource;

  {{bloc.pascalCase()}}RemoteRepositoryImpl({
    required this.remoteDataSource
  });

  @override
  Future<Either<Failure, {{bloc.pascalCase()}}Model>> get{{bloc.pascalCase()}}({
    required String tokenType,
    required String token,
  }) async {
    try {
      final result = await remoteDataSource.get{{bloc.pascalCase()}}(
        tokenType: tokenType,
        token: token,
      );
      return Right(result);
    } catch(error) {
      if(error is ServerException) {
        return Left(ServerFailure(error.code));
      } else if (error is ServerExceptionWithMessage) {
        return Left(ServerFailureWithMessage(error.code, error.message));
      } else {
        return Left(LocalMessageFailure('Houve um erro no processamento, tente novamente.'));
      }
    }
  }
}
