import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import '../../../core/error/failure.dart';
import '../../../core/use_case.dart';
import '../repositories/family_remote_repository.dart';

class DeleteFamilyUseCase implements UseCase<void, DeleteFamilyUseCaseParams> {

  final FamilyRemoteRepository remoteRepository;

  DeleteFamilyUseCase(this.remoteRepository);

  @override
  Future<Either<Failure, void>> call(DeleteFamilyUseCaseParams params) async {
    await remoteRepository.deleteFamily(params.id);
    return right(null);
  }
}

class DeleteFamilyUseCaseParams extends Equatable {

  final String id;

  const DeleteFamilyUseCaseParams({
    required this.id,
  });

  @override
  List<Object> get props => [
    id,
  ];
}
