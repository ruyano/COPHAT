import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../../core/error/failure.dart';
import '../entities/login_entity.dart';

abstract class LoginRemoteRepository {

  Future<Either<ServerFailure, LoginEntity>> doLogin({
    required String email,
    required String password,
  });

  Future<Either<ServerFailure, UserCredential>> createUser({
    required String email,
    required String password,
  });

}
