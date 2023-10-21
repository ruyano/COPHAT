import 'package:cophat/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import '../../../core/use_case.dart';
import '../../data/models/patient_model.dart';
import '../repositories/patient_remote_repository.dart';

class UpdatePatientUseCase implements UseCase<void, UpdatePatientUseCaseParams> {

  final PatientRemoteRepository remoteRepository;

  UpdatePatientUseCase(this.remoteRepository);

  @override
  Future<Either<Failure, void>> call(UpdatePatientUseCaseParams params) async {
    return await remoteRepository.updatePatient(params.patient);
  }
}

class UpdatePatientUseCaseParams extends Equatable {

  final PatientModel patient;

  const UpdatePatientUseCaseParams({
    required this.patient,
  });

  @override
  List<Object> get props => [
    patient,
  ];
}
