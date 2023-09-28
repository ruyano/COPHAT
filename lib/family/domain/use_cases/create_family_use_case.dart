import 'package:cophat/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import '../../../core/use_case.dart';
import '../../data/models/family_model.dart';
import '../repositories/family_remote_repository.dart';

class CreateFamilyUseCase implements UseCase<void, CreateFamilyUseCaseParams> {

  final FamilyRemoteRepository remoteRepository;

  CreateFamilyUseCase(this.remoteRepository);

  @override
  Future<Either<Failure, void>> call(CreateFamilyUseCaseParams params) async {
    await remoteRepository.createFamily(params.family);
    return right(null);
  }
}

class CreateFamilyUseCaseParams extends Equatable {

  final FamilyModel family;

  const CreateFamilyUseCaseParams({
    required this.family,
  });

  @override
  List<Object> get props => [
    family,
  ];
}
