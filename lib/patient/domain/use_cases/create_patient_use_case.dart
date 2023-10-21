import 'package:cophat/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import '../../../core/use_case.dart';
import '../../data/models/patient_model.dart';
import '../repositories/patient_remote_repository.dart';

class CreatePatientUseCase implements UseCase<void, CreatePatientUseCaseParams> {

  final PatientRemoteRepository remoteRepository;

  CreatePatientUseCase(this.remoteRepository);

  @override
  Future<Either<Failure, void>> call(CreatePatientUseCaseParams params) async {
    return await remoteRepository.createPatient(params.patient);
  }
}

class CreatePatientUseCaseParams extends Equatable {

  final PatientModel patient;

  const CreatePatientUseCaseParams({
    required this.patient,
  });

  @override
  List<Object> get props => [
    patient,
  ];
}
