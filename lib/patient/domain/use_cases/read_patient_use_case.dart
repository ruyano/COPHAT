import 'package:cophat/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import '../../../core/use_case.dart';
import '../repositories/patient_remote_repository.dart';
import '../entities/patient_entity.dart';

class ReadPatientsUseCase implements UseCase<List<PatientEntity>, NoParams> {

  final PatientRemoteRepository remoteRepository;

  ReadPatientsUseCase(this.remoteRepository);

  @override
  Future<Either<ServerFailure, List<PatientEntity>>> call(NoParams noParams) async {
    return await remoteRepository.readPatients();
  }
}
