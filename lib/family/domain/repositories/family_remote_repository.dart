import 'package:dartz/dartz.dart';

import '../../../core/error/failure.dart';
import '../../data/models/family_model.dart';
import '../../domain/entities/family_entity.dart';

abstract class FamilyRemoteRepository {
  Future<Either<ServerFailure, void>> createFamily(FamilyModel family);
  Future<Either<ServerFailure, List<FamilyEntity>>> readFamilys();
  Future<Either<ServerFailure, void>> updateFamily(FamilyModel family);
  Future<Either<ServerFailure, void>> deleteFamily(String id);
}
