import 'package:cophat/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import '../../../core/use_case.dart';
import '../repositories/user_remote_repository.dart';
import '../entities/user_entity.dart';

class ReadUsersUseCase implements UseCase<List<UserEntity>, NoParams> {

  final UserRemoteRepository remoteRepository;

  ReadUsersUseCase(this.remoteRepository);

  @override
  Future<Either<ServerFailure, List<UserEntity>>> call(NoParams noParams) async {
    return await remoteRepository.readUsers();
  }
}
