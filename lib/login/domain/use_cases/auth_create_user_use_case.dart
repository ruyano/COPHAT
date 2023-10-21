import 'package:cophat/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../core/use_case.dart';
import '../repositories/login_remote_repository.dart';

class AuthCreateUserUseCase implements UseCase<UserCredential, AuthCreateUserUseCaseParams> {

  final LoginRemoteRepository remoteRepository;

  AuthCreateUserUseCase(this.remoteRepository);

  @override
  Future<Either<ServerFailure, UserCredential>> call(
      AuthCreateUserUseCaseParams params,
  ) async {
    return await remoteRepository.createUser(
      email: params.email,
      password: params.password,
    );
  }
}

class AuthCreateUserUseCaseParams extends Equatable {
  final String email;
  final String password;

  const AuthCreateUserUseCaseParams({
    required this.email,
    required this.password,
  });

  @override
  List<Object?> get props => [
    email,
    password,
  ];
}
