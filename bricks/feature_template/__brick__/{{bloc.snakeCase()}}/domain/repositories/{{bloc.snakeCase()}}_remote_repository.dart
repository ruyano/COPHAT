import 'package:dartz/dartz.dart';

import 'package:pubbank/new_pubbank/core/error/failures.dart';
import '../../domain/entities/{{bloc.snakeCase()}}_entity.dart';

abstract class {{bloc.pascalCase()}}RemoteRepository {
  Future<Either<Failure, {{bloc.pascalCase()}}Entity>> get{{bloc.pascalCase()}}({
    required String tokenType,
    required String token,
  });
}
