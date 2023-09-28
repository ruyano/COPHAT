import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import '../../../core/error/failure.dart';
import '../../../core/use_case.dart';
import '../repositories/{{featureName.snakeCase()}}_remote_repository.dart';

class Delete{{featureName.pascalCase()}}UseCase implements UseCase<void, Delete{{featureName.pascalCase()}}UseCaseParams> {

  final {{featureName.pascalCase()}}RemoteRepository remoteRepository;

  Delete{{featureName.pascalCase()}}UseCase(this.remoteRepository);

  @override
  Future<Either<Failure, void>> call(Delete{{featureName.pascalCase()}}UseCaseParams params) async {
    await remoteRepository.delete{{featureName.pascalCase()}}(params.id);
    return right(null);
  }
}

class Delete{{featureName.pascalCase()}}UseCaseParams extends Equatable {

  final String id;

  const Delete{{featureName.pascalCase()}}UseCaseParams({
    required this.id,
  });

  @override
  List<Object> get props => [
    id,
  ];
}
