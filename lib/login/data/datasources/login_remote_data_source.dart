import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cophat/login/domain/entities/login_entity.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../../core/error/exceptions.dart';
import '../../../user/data/models/user_model.dart';

abstract class LoginRemoteDataSource {

  Future<LoginEntity> doLogin({
    required String email,
    required String password,
  });

  Future<UserCredential> createUser({
    required String email,
    required String password,
  });

}

class LoginRemoteDataSourceImpl implements LoginRemoteDataSource {

  final String _collectionName = 'User';

  final FirebaseFirestore firestoreInstance;
  final FirebaseAuth authInstance;

  LoginRemoteDataSourceImpl({
    required this.firestoreInstance,
    required this.authInstance,
  });

  @override
  Future<LoginEntity> doLogin({
    required String email,
    required String password,
  }) async {
    try {
      UserCredential userCredential = await authInstance.signInWithEmailAndPassword(email: email, password: password);
      var query = await firestoreInstance.collection(_collectionName).where('uid', isEqualTo: userCredential.user?.uid).get();
      var userEntity = UserModel.fromJson(query.docs[0].data());
      return LoginEntity(user: userCredential, userEntity: userEntity);
    } catch (e) {
      if(e is FirebaseAuthException && e.code.toLowerCase() == 'INVALID-LOGIN-CREDENTIALS'.toLowerCase()) {
        throw const ServerException(message: 'Email ou senha incorretos');
      } else {
        if(e is FirebaseException) {
          throw ServerException(message: e.message ?? '-');
        }
        rethrow;
      }
    }
  }

  @override
  Future<UserCredential> createUser({
    required String email,
    required String password,
  }) async {
    try {
      UserCredential userCredential = await authInstance.createUserWithEmailAndPassword(email: email, password: password);
      return userCredential;
    } catch (e) {
      if(e is FirebaseAuthException && e.code.toLowerCase() == 'INVALID-LOGIN-CREDENTIALS'.toLowerCase()) {
        throw const ServerException(message: 'Email ou senha incorretos');
      } else {
        rethrow;
      }
    }
  }
}
