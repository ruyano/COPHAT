import 'package:cloud_firestore/cloud_firestore.dart';
import '../../../core/error/exceptions.dart';
import '../models/patient_questionnaire_answers_model.dart';

abstract class PatientQuestionnaireAnswersRemoteDataSource {
  //CRUD
  Future createPatientQuestionnaireAnswers(PatientQuestionnaireAnswersModel model);
  Future<List<PatientQuestionnaireAnswersModel>> readPatientQuestionnaireAnswerss();
  Future updatePatientQuestionnaireAnswers(PatientQuestionnaireAnswersModel model);
  Future deletePatientQuestionnaireAnswers(String id);
}

class PatientQuestionnaireAnswersRemoteDataSourceImpl implements PatientQuestionnaireAnswersRemoteDataSource {

  final String _collectionName = 'PatientQuestionnaireAnswers';

  final FirebaseFirestore firestoreInstance;

  PatientQuestionnaireAnswersRemoteDataSourceImpl({
    required this.firestoreInstance
  });

  @override
  Future createPatientQuestionnaireAnswers(PatientQuestionnaireAnswersModel question) async {
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
  Future<List<PatientQuestionnaireAnswersModel>> readPatientQuestionnaireAnswerss() async {
    try {
      var result = await firestoreInstance.collection(_collectionName).get();
      var list = result.docs.map((e) => PatientQuestionnaireAnswersModel.fromJson(e.data())).toList();
      return list;
    } catch (e) {
      if(e is FirebaseException) {
        throw ServerException(message: e.message ?? '-');
      }
      rethrow;
    }
  }

  @override
  Future updatePatientQuestionnaireAnswers(PatientQuestionnaireAnswersModel model) async {
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
