import 'package:dartz/dartz.dart';

import '../../../core/error/failure.dart';
import '../../data/models/patient_model.dart';
import '../../domain/entities/patient_entity.dart';

abstract class PatientRemoteRepository {
  Future<Either<ServerFailure, void>> createPatient(PatientModel patient);
  Future<Either<ServerFailure, List<PatientEntity>>> readPatients();
  Future<Either<ServerFailure, void>> updatePatient(PatientModel patient);
  Future<Either<ServerFailure, void>> deletePatient(String id);
}
