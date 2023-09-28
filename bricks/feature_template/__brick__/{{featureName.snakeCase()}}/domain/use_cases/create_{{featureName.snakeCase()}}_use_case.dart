import 'package:cophat/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import '../../../core/use_case.dart';
import '../../data/models/{{featureName.snakeCase()}}_model.dart';
import '../repositories/{{featureName.snakeCase()}}_remote_repository.dart';

class Create{{featureName.pascalCase()}}UseCase implements UseCase<void, Create{{featureName.pascalCase()}}UseCaseParams> {

  final {{featureName.pascalCase()}}RemoteRepository remoteRepository;

  Create{{featureName.pascalCase()}}UseCase(this.remoteRepository);

  @override
  Future<Either<Failure, void>> call(Create{{featureName.pascalCase()}}UseCaseParams params) async {
    await remoteRepository.create{{featureName.pascalCase()}}(params.{{featureName.camelCase()}});
    return right(null);
  }
}

class Create{{featureName.pascalCase()}}UseCaseParams extends Equatable {

  final {{featureName.pascalCase()}}Model {{featureName.camelCase()}};

  const Create{{featureName.pascalCase()}}UseCaseParams({
    required this.{{featureName.camelCase()}},
  });

  @override
  List<Object> get props => [
    {{featureName.camelCase()}},
  ];
}
