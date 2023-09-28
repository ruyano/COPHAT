import 'package:dartz/dartz.dart';

import '../../../core/error/exceptions.dart';
import '../../../core/error/failure.dart';
import '../../domain/repositories/{{featureName.snakeCase()}}_remote_repository.dart';
import '../datasources/{{featureName.snakeCase()}}_remote_data_source.dart';
import '../models/{{featureName.snakeCase()}}_model.dart';
import '../../domain/entities/{{featureName.snakeCase()}}_entity.dart';

class {{featureName.pascalCase()}}RemoteRepositoryImpl implements {{featureName.pascalCase()}}RemoteRepository {
  
  final {{featureName.pascalCase()}}RemoteDataSource remoteDataSource;

  {{featureName.pascalCase()}}RemoteRepositoryImpl({
    required this.remoteDataSource
  });

  @override
  Future<Either<ServerFailure, void>> create{{featureName.pascalCase()}}(
    {{featureName.pascalCase()}}Model {{featureName.camelCase()}},
    ) async {
      try {
        await remoteDataSource.create{{featureName.pascalCase()}}({{featureName.camelCase()}});
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
  Future<Either<ServerFailure, List<{{featureName.pascalCase()}}Entity>>> read{{featureName.pascalCase()}}s() async {
    try {
      final result = await remoteDataSource.read{{featureName.pascalCase()}}s();
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
  Future<Either<ServerFailure, void>> update{{featureName.pascalCase()}}(
    {{featureName.pascalCase()}}Model {{featureName.camelCase()}},
    ) async {
      try {
        await remoteDataSource.update{{featureName.pascalCase()}}({{featureName.camelCase()}});
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
  Future<Either<ServerFailure, void>> delete{{featureName.pascalCase()}}(
    String id,
    ) async {
      try {
        await remoteDataSource.delete{{featureName.pascalCase()}}(id);
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
