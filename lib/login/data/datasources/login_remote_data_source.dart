import 'package:firebase_auth/firebase_auth.dart';
import '../../../core/error/exceptions.dart';

abstract class LoginRemoteDataSource {

  Future<UserCredential> doLogin({
    required String email,
    required String password,
  });
}

class LoginRemoteDataSourceImpl implements LoginRemoteDataSource {

  final FirebaseAuth authInstance;

  LoginRemoteDataSourceImpl({
    required this.authInstance
  });

  @override
  Future<UserCredential> doLogin({
    required String email,
    required String password,
  }) async {
    try {
      UserCredential userCredential = await authInstance.signInWithEmailAndPassword(email: email, password: password);
      return userCredential;
    } catch (e) {
      if(e is FirebaseAuthException && e.code == 'INVALID_LOGIN_CREDENTIALS') {
        throw const ServerException(message: 'Email ou senha incorretos');
      } else {
        rethrow;
      }
    }
  }
}
