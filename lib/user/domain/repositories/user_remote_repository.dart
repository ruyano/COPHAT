import 'package:dartz/dartz.dart';

import '../../../core/error/failure.dart';
import '../../data/models/user_model.dart';
import '../../domain/entities/user_entity.dart';

abstract class UserRemoteRepository {
  Future<Either<ServerFailure, void>> createUser(UserModel user);
  Future<Either<ServerFailure, List<UserEntity>>> readUsers();
  Future<Either<ServerFailure, void>> updateUser(UserModel user);
  Future<Either<ServerFailure, void>> deleteUser(String id);
}
