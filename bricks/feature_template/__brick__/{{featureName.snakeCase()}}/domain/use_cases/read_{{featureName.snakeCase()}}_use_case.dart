import 'package:cophat/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import '../../../core/use_case.dart';
import '../repositories/{{featureName.snakeCase()}}_remote_repository.dart';
import '../entities/{{featureName.snakeCase()}}_entity.dart';

class Read{{featureName.pascalCase()}}sUseCase implements UseCase<List<{{featureName.pascalCase()}}Entity>, NoParams> {

  final {{featureName.pascalCase()}}RemoteRepository remoteRepository;

  Read{{featureName.pascalCase()}}sUseCase(this.remoteRepository);

  @override
  Future<Either<ServerFailure, List<{{featureName.pascalCase()}}Entity>>> call(NoParams noParams) async {
    return await remoteRepository.read{{featureName.pascalCase()}}s();
  }
}
