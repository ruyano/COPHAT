import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../../core/error/failure.dart';

abstract class LoginRemoteRepository {

  Future<Either<ServerFailure, UserCredential>> doLogin({
    required String email,
    required String password,
  });

}
