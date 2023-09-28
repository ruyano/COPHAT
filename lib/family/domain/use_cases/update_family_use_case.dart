import 'package:cophat/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import '../../../core/use_case.dart';
import '../../data/models/family_model.dart';
import '../repositories/family_remote_repository.dart';

class UpdateFamilyUseCase implements UseCase<void, UpdateFamilyUseCaseParams> {

  final FamilyRemoteRepository remoteRepository;

  UpdateFamilyUseCase(this.remoteRepository);

  @override
  Future<Either<Failure, void>> call(UpdateFamilyUseCaseParams params) async {
    await remoteRepository.updateFamily(params.family);
    return right(null);
  }
}

class UpdateFamilyUseCaseParams extends Equatable {

  final FamilyModel family;

  const UpdateFamilyUseCaseParams({
    required this.family,
  });

  @override
  List<Object> get props => [
    family,
  ];
}
