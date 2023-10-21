import 'package:cloud_firestore/cloud_firestore.dart';
import '../../../core/error/exceptions.dart';
import '../models/patient_model.dart';

abstract class PatientRemoteDataSource {
  //CRUD
  Future createPatient(PatientModel model);
  Future<List<PatientModel>> readPatients();
  Future updatePatient(PatientModel model);
  Future deletePatient(String id);
}

class PatientRemoteDataSourceImpl implements PatientRemoteDataSource {

  final String _collectionName = 'Patient';

  final FirebaseFirestore firestoreInstance;

  PatientRemoteDataSourceImpl({
    required this.firestoreInstance
  });

  @override
  Future createPatient(PatientModel question) async {
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
  Future<List<PatientModel>> readPatients() async {
    try {
      var result = await firestoreInstance.collection(_collectionName).get();
      var list = result.docs.map((e) => PatientModel.fromJson(e.data())).toList();
      return list;
    } catch (e) {
      if(e is FirebaseException) {
        throw ServerException(message: e.message ?? '-');
      }
      rethrow;
    }
  }

  @override
  Future updatePatient(PatientModel model) async {
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
    Future deletePatient(String id) async {
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
