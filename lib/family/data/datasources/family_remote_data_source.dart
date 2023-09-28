import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/family_model.dart';

abstract class FamilyRemoteDataSource {
  //CRUD
  Future createFamily(FamilyModel model);
  Future<List<FamilyModel>> readFamilys();
  Future updateFamily(FamilyModel model);
  Future deleteFamily(String id);
}

class FamilyRemoteDataSourceImpl implements FamilyRemoteDataSource {

  final String _collectionName = 'Family';

  final FirebaseFirestore firestoreInstance;

  FamilyRemoteDataSourceImpl({
    required this.firestoreInstance
  });

  @override
  Future createFamily(FamilyModel question) async {
    try {
      var doc = firestoreInstance.collection(_collectionName).doc();
      question.id = doc.id;
      await doc.set(question.toJson());
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<FamilyModel>> readFamilys() async {
    try {
      var result = await firestoreInstance.collection(_collectionName).get();
      var list = result.docs.map((e) => FamilyModel.fromJson(e.data())).toList();
      return list;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future updateFamily(FamilyModel model) async {
    try {
      var doc = firestoreInstance.collection(_collectionName).doc(model.id);
      await doc.update(model.toJson());
    } catch (e) {
      rethrow;
    }
  }

  @override
    Future deleteFamily(String id) async {
    try {
      var doc = firestoreInstance.collection(_collectionName).doc(id);
      await doc.delete();
    } catch (e) {
      rethrow;
    }
  }

}
