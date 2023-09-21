import 'package:firebase_auth/firebase_auth.dart';
import '../../../core/error/exceptions.dart';
import '../models/{{bloc.snakeCase()}}_model.dart';

abstract class {{bloc.pascalCase()}}RemoteDataSource {
  Future<{{bloc.pascalCase()}}Model> get{{bloc.pascalCase()}}({
    required String email,
    required String password,
  });
}

class {{bloc.pascalCase()}}RemoteDataSourceImpl implements {{bloc.pascalCase()}}RemoteDataSource {
  final FirebaseAuth authInstance;

  {{bloc.pascalCase()}}RemoteDataSourceImpl({
    required this.authInstance
  });

  @override
  Future<{{bloc.pascalCase()}}Model> get{{bloc.pascalCase()}}({
      required String email,
      required String password,
  }) async {
    //TODO - fazer alterações necessárias
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
