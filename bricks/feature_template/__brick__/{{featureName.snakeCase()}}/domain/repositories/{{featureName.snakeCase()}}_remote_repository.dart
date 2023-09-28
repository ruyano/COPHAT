import 'package:dartz/dartz.dart';

import '../../../core/error/failure.dart';
import '../../data/models/{{featureName.snakeCase()}}_model.dart';
import '../../domain/entities/{{featureName.snakeCase()}}_entity.dart';

abstract class {{featureName.pascalCase()}}RemoteRepository {
  Future<Either<ServerFailure, void>> create{{featureName.pascalCase()}}({{featureName.pascalCase()}}Model {{featureName.camelCase()}});
  Future<Either<ServerFailure, List<{{featureName.pascalCase()}}Entity>>> read{{featureName.pascalCase()}}s();
  Future<Either<ServerFailure, void>> update{{featureName.pascalCase()}}({{featureName.pascalCase()}}Model {{featureName.camelCase()}});
  Future<Either<ServerFailure, void>> delete{{featureName.pascalCase()}}(String id);
}
