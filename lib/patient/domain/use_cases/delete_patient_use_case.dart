import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import '../../../core/error/failure.dart';
import '../../../core/use_case.dart';
import '../repositories/patient_remote_repository.dart';

class DeletePatientUseCase implements UseCase<void, DeletePatientUseCaseParams> {

  final PatientRemoteRepository remoteRepository;

  DeletePatientUseCase(this.remoteRepository);

  @override
  Future<Either<Failure, void>> call(DeletePatientUseCaseParams params) async {
    return await remoteRepository.deletePatient(params.id);
  }
}

class DeletePatientUseCaseParams extends Equatable {

  final String id;

  const DeletePatientUseCaseParams({
    required this.id,
  });

  @override
  List<Object> get props => [
    id,
  ];
}
