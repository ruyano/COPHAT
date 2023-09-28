import 'package:cophat/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import '../../../core/use_case.dart';
import '../repositories/family_remote_repository.dart';
import '../entities/family_entity.dart';

class ReadFamilysUseCase implements UseCase<List<FamilyEntity>, NoParams> {

  final FamilyRemoteRepository remoteRepository;

  ReadFamilysUseCase(this.remoteRepository);

  @override
  Future<Either<ServerFailure, List<FamilyEntity>>> call(NoParams noParams) async {
    return await remoteRepository.readFamilys();
  }
}
