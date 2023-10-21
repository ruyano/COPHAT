import 'package:cophat/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import '../../../core/use_case.dart';
import '../../data/models/user_model.dart';
import '../repositories/user_remote_repository.dart';

class CreateUserUseCase implements UseCase<void, CreateUserUseCaseParams> {

  final UserRemoteRepository remoteRepository;

  CreateUserUseCase(this.remoteRepository);

  @override
  Future<Either<Failure, void>> call(CreateUserUseCaseParams params) async {
    return await remoteRepository.createUser(params.user);
  }
}

class CreateUserUseCaseParams extends Equatable {

  final UserModel user;

  const CreateUserUseCaseParams({
    required this.user,
  });

  @override
  List<Object> get props => [
    user,
  ];
}
