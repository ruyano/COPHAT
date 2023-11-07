import 'package:cloud_firestore/cloud_firestore.dart';
import '../../../core/models/question_model.dart';

abstract class GuardianQuestionnaireRemoteDataSource {
  //CRUD
  Future createQuestion(QuestionModel model);
  Future<List<QuestionModel>> readQuestions();
  Future updateQuestion(QuestionModel model);
  Future deleteQuestion(String id);
}

class GuardianQuestionnaireRemoteDataSourceImpl implements GuardianQuestionnaireRemoteDataSource {

  final String _collectionName = "GuardianQuestionnaire";

  final FirebaseFirestore firestoreInstance;

  GuardianQuestionnaireRemoteDataSourceImpl({
    required this.firestoreInstance
  });

  @override
  Future createQuestion(QuestionModel question) async {
    try {
      var doc = firestoreInstance.collection(_collectionName).doc();
      question.id = doc.id;
      await doc.set(question.toJson());
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<QuestionModel>> readQuestions() async {
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
  Future updateQuestion(QuestionModel model) async {
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
