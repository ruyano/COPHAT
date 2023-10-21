import 'package:cophat/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../core/use_case.dart';
import '../entities/login_entity.dart';
import '../repositories/login_remote_repository.dart';

class doLoginUseCase implements UseCase<LoginEntity, DoLoginUseCaseParams> {
  final LoginRemoteRepository remoteRepository;

  doLoginUseCase(this.remoteRepository);

  @override
  Future<Either<ServerFailure, LoginEntity>> call(
    DoLoginUseCaseParams params,
  ) async {
    return await remoteRepository.doLogin(
      email: params.email,
      password: params.password,
    );
  }
}

class DoLoginUseCaseParams extends Equatable {
  final String email;
  final String password;

  const DoLoginUseCaseParams({
    required this.email,
    required this.password,
  });

  @override
  List<Object?> get props => [
    email,
    password,
  ];
}
