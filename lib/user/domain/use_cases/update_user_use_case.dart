import 'package:cophat/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import '../../../core/use_case.dart';
import '../../data/models/user_model.dart';
import '../repositories/user_remote_repository.dart';

class UpdateUserUseCase implements UseCase<void, UpdateUserUseCaseParams> {

  final UserRemoteRepository remoteRepository;

  UpdateUserUseCase(this.remoteRepository);

  @override
  Future<Either<Failure, void>> call(UpdateUserUseCaseParams params) async {
    await remoteRepository.updateUser(params.user);
    return right(null);
  }
}

class UpdateUserUseCaseParams extends Equatable {

  final UserModel user;

  const UpdateUserUseCaseParams({
    required this.user,
  });

  @override
  List<Object> get props => [
    user,
  ];
}
