import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cophat/core/models/answers_model.dart';
import '../../../core/error/exceptions.dart';

abstract class PatientQuestionnaireAnswersRemoteDataSource {
  //CRUD
  Future createPatientQuestionnaireAnswers(AnswersModel model);
  Future<List<AnswersModel>> readPatientQuestionnaireAnswerss();
  Future updatePatientQuestionnaireAnswers(AnswersModel model);
  Future deletePatientQuestionnaireAnswers(String id);
}

class PatientQuestionnaireAnswersRemoteDataSourceImpl implements PatientQuestionnaireAnswersRemoteDataSource {

  final String _collectionName = 'PatientQuestionnaireAnswers';

  final FirebaseFirestore firestoreInstance;

  PatientQuestionnaireAnswersRemoteDataSourceImpl({
    required this.firestoreInstance
  });

  @override
  Future createPatientQuestionnaireAnswers(AnswersModel answers) async {
    try {
      var doc = firestoreInstance.collection(_collectionName).doc();
      answers.id = doc.id;
      await doc.set(answers.toJson());
    } catch (e) {
      if(e is FirebaseException) {
        throw ServerException(message: e.message ?? '-');
      }
      rethrow;
    }
  }

  @override
  Future<List<AnswersModel>> readPatientQuestionnaireAnswerss() async {
    try {
      var result = await firestoreInstance.collection(_collectionName).get();
      var list = result.docs.map((e) => AnswersModel.fromJson(e.data())).toList();
      return list;
    } catch (e) {
      if(e is FirebaseException) {
        throw ServerException(message: e.message ?? '-');
      }
      rethrow;
    }
  }

  @override
  Future updatePatientQuestionnaireAnswers(AnswersModel model) async {
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
    Future deletePatientQuestionnaireAnswers(String id) async {
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
