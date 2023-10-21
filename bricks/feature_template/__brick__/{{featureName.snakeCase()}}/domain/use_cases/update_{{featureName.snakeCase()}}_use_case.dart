import 'package:cophat/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import '../../../core/use_case.dart';
import '../../data/models/{{featureName.snakeCase()}}_model.dart';
import '../repositories/{{featureName.snakeCase()}}_remote_repository.dart';

class Update{{featureName.pascalCase()}}UseCase implements UseCase<void, Update{{featureName.pascalCase()}}UseCaseParams> {

  final {{featureName.pascalCase()}}RemoteRepository remoteRepository;

  Update{{featureName.pascalCase()}}UseCase(this.remoteRepository);

  @override
  Future<Either<Failure, void>> call(Update{{featureName.pascalCase()}}UseCaseParams params) async {
    return await remoteRepository.update{{featureName.pascalCase()}}(params.{{featureName.camelCase()}});
  }
}

class Update{{featureName.pascalCase()}}UseCaseParams extends Equatable {

  final {{featureName.pascalCase()}}Model {{featureName.camelCase()}};

  const Update{{featureName.pascalCase()}}UseCaseParams({
    required this.{{featureName.camelCase()}},
  });

  @override
  List<Object> get props => [
    {{featureName.camelCase()}},
  ];
}
