import 'package:cloud_firestore/cloud_firestore.dart';
import '../../../core/models/question_model.dart';

abstract class ChildQuestionnaireRemoteDataSource {
  //CRUD
  Future createChildQuestionnaire(QuestionModel model);
  Future<List<QuestionModel>> readChildQuestionnaires();
  Future updateChildQuestionnaire(QuestionModel model);
  Future deleteChildQuestionnaire(String id);
}

class ChildQuestionnaireRemoteDataSourceImpl implements ChildQuestionnaireRemoteDataSource {

  final String _collectionName = 'ChildQuestionnaire';

  final FirebaseFirestore firestoreInstance;

  ChildQuestionnaireRemoteDataSourceImpl({
    required this.firestoreInstance
  });

  @override
  Future createChildQuestionnaire(QuestionModel question) async {
    try {
      var doc = firestoreInstance.collection(_collectionName).doc();
      question.id = doc.id;
      await doc.set(question.toJson());
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<QuestionModel>> readChildQuestionnaires() async {
    try {
      var result = await firestoreInstance.collection(_collectionName).get();
      var list = result.docs.map((e) => QuestionModel.fromJson(e.data())).toList();
      list.sort((QuestionModel a, QuestionModel b) => a.position?.compareTo(b.position ?? 0) ?? 0);
      return list;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future updateChildQuestionnaire(QuestionModel model) async {
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
