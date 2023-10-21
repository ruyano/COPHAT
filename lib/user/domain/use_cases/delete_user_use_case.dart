import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import '../../../core/error/failure.dart';
import '../../../core/use_case.dart';
import '../repositories/user_remote_repository.dart';

class DeleteUserUseCase implements UseCase<void, DeleteUserUseCaseParams> {

  final UserRemoteRepository remoteRepository;

  DeleteUserUseCase(this.remoteRepository);

  @override
  Future<Either<Failure, void>> call(DeleteUserUseCaseParams params) async {
    await remoteRepository.deleteUser(params.id);
    return right(null);
  }
}

class DeleteUserUseCaseParams extends Equatable {

  final String id;

  const DeleteUserUseCaseParams({
    required this.id,
  });

  @override
  List<Object> get props => [
    id,
  ];
}
