import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:pubbank/new_pubbank/core/error/failures.dart';
import 'package:pubbank/new_pubbank/core/usecases/use_case.dart';

import '../repositories/{{bloc.snakeCase()}}_remote_repository.dart';
import '../entities/{{bloc.snakeCase()}}_entity.dart';

class Get{{bloc.pascalCase()}}UseCase implements UseCase<{{bloc.pascalCase()}}Entity, Get{{bloc.pascalCase()}}UseCaseParams> {
  final {{bloc.pascalCase()}}RemoteRepository remoteRepository;

  Get{{bloc.pascalCase()}}UseCase(this.remoteRepository);

  @override
  Future<Either<Failure, {{bloc.pascalCase()}}Entity>> call(
    Get{{bloc.pascalCase()}}UseCaseParams params,
  ) async {
    return await remoteRepository.get{{bloc.pascalCase()}}(
      tokenType: params.tokenType,
      token: params.token,
    );
  }
}

class Get{{bloc.pascalCase()}}UseCaseParams extends Equatable {
  final String tokenType;
  final String token;

  Get{{bloc.pascalCase()}}UseCaseParams({
    required this.tokenType,
    required this.token,
  });

  @override
  List<Object?> get props => [
    tokenType,
    token,
  ];
}
