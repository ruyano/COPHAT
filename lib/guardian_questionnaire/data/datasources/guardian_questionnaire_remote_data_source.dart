import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/guardian_question_model.dart';

abstract class GuardianQuestionnaireRemoteDataSource {
  //CRUD
  Future createQuestion(GuardianQuestionModel model);
  Future<List<GuardianQuestionModel>> readQuestions();
  Future updateQuestion(GuardianQuestionModel model);
  Future deleteQuestion(String id);
}

class GuardianQuestionnaireRemoteDataSourceImpl implements GuardianQuestionnaireRemoteDataSource {

  final String _collectionName = "GuardianQuestionnaire";

  final FirebaseFirestore firestoreInstance;

  GuardianQuestionnaireRemoteDataSourceImpl({
    required this.firestoreInstance
  });

  @override
  Future createQuestion(GuardianQuestionModel question) async {
    try {
      var doc = firestoreInstance.collection(_collectionName).doc();
      question.id = doc.id;
      await doc.set(question.toJson());
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<GuardianQuestionModel>> readQuestions() async {
    try {
      var result = await firestoreInstance.collection(_collectionName).get();
      var list = result.docs.map((e) => GuardianQuestionModel.fromJson(e.data())).toList();
      return list;
    } catch (e) {
        rethrow;
    }
  }

  @override
  Future updateQuestion(GuardianQuestionModel model) async {
    try {
      var doc = firestoreInstance.collection(_collectionName).doc(model.id);
      await doc.update(model.toJson());
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future deleteQuestion(String id) async {
    try {
      var doc = firestoreInstance.collection(_collectionName).doc(id);
      await doc.delete();
    } catch (e) {
      rethrow;
    }
  }


}
