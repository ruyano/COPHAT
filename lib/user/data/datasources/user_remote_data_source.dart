import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../../core/error/exceptions.dart';
import '../models/user_model.dart';

abstract class UserRemoteDataSource {
  //CRUD
  Future createUser(UserModel model);
  Future<List<UserModel>> readUsers();
  Future updateUser(UserModel model);
  Future deleteUser(String id);
}

class UserRemoteDataSourceImpl implements UserRemoteDataSource {

  final String _collectionName = 'User';

  final FirebaseFirestore firestoreInstance;
  final FirebaseAuth authInstance;

  UserRemoteDataSourceImpl({
    required this.firestoreInstance,
    required this.authInstance,
  });

  @override
  Future createUser(UserModel userModel) async {
    try {
      var auth = await authInstance.createUserWithEmailAndPassword(
          email: userModel.email!,
          password: userModel.email!,
      );
      userModel.uid = auth.user?.uid;
      var doc = firestoreInstance.collection(_collectionName).doc();
      userModel.id = doc.id;
      await doc.set(userModel.toJson());
    } catch (e) {
      if(e is FirebaseException) {
        throw ServerException(message: e.message ?? '-');
      }
      rethrow;
    }
  }

  @override
  Future<List<UserModel>> readUsers() async {
    try {
      var result = await firestoreInstance.collection(_collectionName).get();
      var list = result.docs.map((e) => UserModel.fromJson(e.data())).toList();
      return list;
    } catch (e) {
      if(e is FirebaseException) {
        throw ServerException(message: e.message ?? '-');
      }
      rethrow;
    }
  }

  @override
  Future updateUser(UserModel model) async {
    try {
      var doc = firestoreInstance.collection(_collectionName).doc(model.id);
      await doc.update(model.toJson());
    } catch (e) {
      if(e is FirebaseException) {
        throw ServerException(message: e.message ?? '-');
      }
      rethrow;
    }
  }

  @override
    Future deleteUser(String id) async {
    try {
      var doc = firestoreInstance.collection(_collectionName).doc(id);
      await doc.delete();
    } catch (e) {
      if(e is FirebaseException) {
        throw ServerException(message: e.message ?? '-');
      }
      rethrow;
    }
  }

}
