import 'package:cophat/core/use_case.dart';
import 'package:cophat/family/data/models/family_model.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../family/domain/use_cases/create_family_use_case.dart';
import '../../../family/domain/use_cases/delete_family_use_case.dart';
import '../../../family/domain/use_cases/read_family_use_case.dart';
import '../../../family/domain/use_cases/update_family_use_case.dart';
import '../../domain/entities/family_entity.dart';

part 'family_event.dart';
part 'family_state.dart';

class FamilyBloc extends Bloc<FamilyEvent, FamilyState> {

  final CreateFamilyUseCase _createFamilyUseCase;
  final ReadFamilysUseCase _readFamilysUseCase;
  final UpdateFamilyUseCase _updateFamilyUseCase;
  final DeleteFamilyUseCase _deleteFamilyUseCase;

  FamilyBloc({
    required CreateFamilyUseCase createFamilyUseCase,
    required ReadFamilysUseCase readFamilysUseCase,
    required UpdateFamilyUseCase updateFamilyUseCase,
    required DeleteFamilyUseCase deleteFamilyUseCase,
  }) : _createFamilyUseCase = createFamilyUseCase,
        _readFamilysUseCase = readFamilysUseCase,
        _updateFamilyUseCase = updateFamilyUseCase,
        _deleteFamilyUseCase = deleteFamilyUseCase,
        super(const FamilyEmpty()) {
    on<CreateFamilyEvent>(_onCreateFamily);
    on<ReadFamilyEvent>(_onReadFamily);
    on<UpdateFamilyEvent>(_onUpdateFamily);
    on<DeleteFamilyEvent>(_onDeleteGuardianQuestion);
  }

  _onCreateFamily(
      CreateFamilyEvent event,
      Emitter<FamilyState> emit,
      ) async {

    emit(const FamilyLoading());

    final result = await _createFamilyUseCase(CreateFamilyUseCaseParams(
      family: event.questionModel
    ));

    result.fold(
          (failure) {
        emit(FamilyError(failure.message));
      },
          (content) async {
        emit(const CreateOrUpdateOrDeleteSuccess());
      },
    );
  }

  _onReadFamily(
      FamilyEvent event,
      Emitter<FamilyState> emit,
      ) async {

    emit(const FamilyLoading());

    final Family = await _readFamilysUseCase(NoParams());

    Family.fold(
          (failure) {
        emit(FamilyError(failure.message));
      },
          (content) async {
        emit(FamilySuccess(questionsList: content));
      },
    );
  }

  _onUpdateFamily(
      UpdateFamilyEvent event,
      Emitter<FamilyState> emit,
      ) async {
    emit(const FamilyLoading());

    final result = await _updateFamilyUseCase(UpdateFamilyUseCaseParams(
      family: event.questionModel
    ));

    result.fold(
          (failure) {
        emit(FamilyError(failure.message));
      },
          (content) async {
        emit(const CreateOrUpdateOrDeleteSuccess());
      },
    );
  }

  _onDeleteGuardianQuestion(
      DeleteFamilyEvent event,
      Emitter<FamilyState> emit,
      ) async {
    emit(const FamilyLoading());

    final result = await _deleteFamilyUseCase(DeleteFamilyUseCaseParams(
        id: event.id
    ));

    result.fold(
          (failure) {
        emit(FamilyError(failure.message));
      },
          (content) async {
        emit(const CreateOrUpdateOrDeleteSuccess());
      },
    );
  }

}
