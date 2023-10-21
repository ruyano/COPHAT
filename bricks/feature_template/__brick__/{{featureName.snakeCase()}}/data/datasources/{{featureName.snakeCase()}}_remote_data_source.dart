import 'package:cloud_firestore/cloud_firestore.dart';
import '../../../core/error/exceptions.dart';
import '../models/{{featureName.snakeCase()}}_model.dart';

abstract class {{featureName.pascalCase()}}RemoteDataSource {
  //CRUD
  Future create{{featureName.pascalCase()}}({{featureName.pascalCase()}}Model model);
  Future<List<{{featureName.pascalCase()}}Model>> read{{featureName.pascalCase()}}s();
  Future update{{featureName.pascalCase()}}({{featureName.pascalCase()}}Model model);
  Future delete{{featureName.pascalCase()}}(String id);
}

class {{featureName.pascalCase()}}RemoteDataSourceImpl implements {{featureName.pascalCase()}}RemoteDataSource {

  final String _collectionName = '{{featureName.pascalCase()}}';

  final FirebaseFirestore firestoreInstance;

  {{featureName.pascalCase()}}RemoteDataSourceImpl({
    required this.firestoreInstance
  });

  @override
  Future create{{featureName.pascalCase()}}({{featureName.pascalCase()}}Model question) async {
    try {
      var doc = firestoreInstance.collection(_collectionName).doc();
      question.id = doc.id;
      await doc.set(question.toJson());
    } catch (e) {
      if(e is FirebaseException) {
        throw ServerException(message: e.message ?? '-');
      }
      rethrow;
    }
  }

  @override
  Future<List<{{featureName.pascalCase()}}Model>> read{{featureName.pascalCase()}}s() async {
    try {
      var result = await firestoreInstance.collection(_collectionName).get();
      var list = result.docs.map((e) => {{featureName.pascalCase()}}Model.fromJson(e.data())).toList();
      return list;
    } catch (e) {
      if(e is FirebaseException) {
        throw ServerException(message: e.message ?? '-');
      }
      rethrow;
    }
  }

  @override
  Future update{{featureName.pascalCase()}}({{featureName.pascalCase()}}Model model) async {
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
    Future delete{{featureName.pascalCase()}}(String id) async {
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
