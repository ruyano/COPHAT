import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/child_questionnaire_model.dart';

abstract class ChildQuestionnaireRemoteDataSource {
  //CRUD
  Future createChildQuestionnaire(ChildQuestionnaireModel model);
  Future<List<ChildQuestionnaireModel>> readChildQuestionnaires();
  Future updateChildQuestionnaire(ChildQuestionnaireModel model);
  Future deleteChildQuestionnaire(String id);
}

class ChildQuestionnaireRemoteDataSourceImpl implements ChildQuestionnaireRemoteDataSource {

  final String _collectionName = 'ChildQuestionnaire';

  final FirebaseFirestore firestoreInstance;

  ChildQuestionnaireRemoteDataSourceImpl({
    required this.firestoreInstance
  });

  @override
  Future createChildQuestionnaire(ChildQuestionnaireModel question) async {
    try {
      var doc = firestoreInstance.collection(_collectionName).doc();
      question.id = doc.id;
      await doc.set(question.toJson());
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<ChildQuestionnaireModel>> readChildQuestionnaires() async {
    try {
      var result = await firestoreInstance.collection(_collectionName).get();
      var list = result.docs.map((e) => ChildQuestionnaireModel.fromJson(e.data())).toList();
      return list;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future updateChildQuestionnaire(ChildQuestionnaireModel model) async {
    try {
      var doc = firestoreInstance.collection(_collectionName).doc(model.id);
      await doc.update(model.toJson());
    } catch (e) {
      rethrow;
    }
  }

  @override
    Future deleteChildQuestionnaire(String id) async {
    try {
      var doc = firestoreInstance.collection(_collectionName).doc(id);
      await doc.delete();
    } catch (e) {
      rethrow;
    }
  }

}
