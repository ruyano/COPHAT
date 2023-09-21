import 'package:cophat/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../core/use_case.dart';
import '../repositories/login_remote_repository.dart';

class doLoginUseCase implements UseCase<UserCredential, DoLoginUseCaseParams> {
  final LoginRemoteRepository remoteRepository;

  doLoginUseCase(this.remoteRepository);

  @override
  Future<Either<ServerFailure, UserCredential>> call(
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
