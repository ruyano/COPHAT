import 'package:cophat/core/use_case.dart';
import 'package:cophat/{{featureName.snakeCase()}}/data/models/{{featureName.snakeCase()}}_model.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../{{featureName.snakeCase()}}/domain/use_cases/create_{{featureName.snakeCase()}}_use_case.dart';
import '../../../{{featureName.snakeCase()}}/domain/use_cases/delete_{{featureName.snakeCase()}}_use_case.dart';
import '../../../{{featureName.snakeCase()}}/domain/use_cases/read_{{featureName.snakeCase()}}_use_case.dart';
import '../../../{{featureName.snakeCase()}}/domain/use_cases/update_{{featureName.snakeCase()}}_use_case.dart';
import '../../domain/entities/{{featureName.snakeCase()}}_entity.dart';

part '{{featureName.snakeCase()}}_event.dart';
part '{{featureName.snakeCase()}}_state.dart';

class {{featureName.pascalCase()}}Bloc extends Bloc<{{featureName.pascalCase()}}Event, {{featureName.pascalCase()}}State> {

  final Create{{featureName.pascalCase()}}UseCase _create{{featureName.pascalCase()}}UseCase;
  final Read{{featureName.pascalCase()}}sUseCase _read{{featureName.pascalCase()}}sUseCase;
  final Update{{featureName.pascalCase()}}UseCase _update{{featureName.pascalCase()}}UseCase;
  final Delete{{featureName.pascalCase()}}UseCase _delete{{featureName.pascalCase()}}UseCase;

  {{featureName.pascalCase()}}Bloc({
    required Create{{featureName.pascalCase()}}UseCase create{{featureName.pascalCase()}}UseCase,
    required Read{{featureName.pascalCase()}}sUseCase read{{featureName.pascalCase()}}sUseCase,
    required Update{{featureName.pascalCase()}}UseCase update{{featureName.pascalCase()}}UseCase,
    required Delete{{featureName.pascalCase()}}UseCase delete{{featureName.pascalCase()}}UseCase,
  }) : _create{{featureName.pascalCase()}}UseCase = create{{featureName.pascalCase()}}UseCase,
        _read{{featureName.pascalCase()}}sUseCase = read{{featureName.pascalCase()}}sUseCase,
        _update{{featureName.pascalCase()}}UseCase = update{{featureName.pascalCase()}}UseCase,
        _delete{{featureName.pascalCase()}}UseCase = delete{{featureName.pascalCase()}}UseCase,
        super(const {{featureName.pascalCase()}}Empty()) {
    on<Create{{featureName.pascalCase()}}Event>(_onCreate{{featureName.pascalCase()}});
    on<Read{{featureName.pascalCase()}}Event>(_onRead{{featureName.pascalCase()}});
    on<Update{{featureName.pascalCase()}}Event>(_onUpdate{{featureName.pascalCase()}});
    on<Delete{{featureName.pascalCase()}}Event>(_onDeleteGuardianQuestion);
  }

  _onCreate{{featureName.pascalCase()}}(
      Create{{featureName.pascalCase()}}Event event,
      Emitter<{{featureName.pascalCase()}}State> emit,
      ) async {

    emit(const {{featureName.pascalCase()}}Loading());

    final result = await _create{{featureName.pascalCase()}}UseCase(Create{{featureName.pascalCase()}}UseCaseParams(
      {{featureName.camelCase()}}: event.{{featureName.camelCase()}}Model
    ));

    result.fold(
          (failure) {
        emit({{featureName.pascalCase()}}Error(failure.message));
      },
          (content) async {
        emit(const CreateOrUpdateOrDeleteSuccess());
      },
    );
  }

  _onRead{{featureName.pascalCase()}}(
      {{featureName.pascalCase()}}Event event,
      Emitter<{{featureName.pascalCase()}}State> emit,
      ) async {

    emit(const {{featureName.pascalCase()}}Loading());

    final {{featureName.pascalCase()}} = await _read{{featureName.pascalCase()}}sUseCase(NoParams());

    {{featureName.pascalCase()}}.fold(
          (failure) {
        emit({{featureName.pascalCase()}}Error(failure.message));
      },
          (content) async {
            if(content.isEmpty) {
              emit(const {{featureName.pascalCase()}}Empty());
            } else {
              emit({{featureName.pascalCase()}}Success({{featureName.camelCase()}}List: content));
            }
      },
    );
  }

  _onUpdate{{featureName.pascalCase()}}(
      Update{{featureName.pascalCase()}}Event event,
      Emitter<{{featureName.pascalCase()}}State> emit,
      ) async {
    emit(const {{featureName.pascalCase()}}Loading());

    final result = await _update{{featureName.pascalCase()}}UseCase(Update{{featureName.pascalCase()}}UseCaseParams(
      {{featureName.camelCase()}}: event.{{featureName.camelCase()}}Model
    ));

    result.fold(
          (failure) {
        emit({{featureName.pascalCase()}}Error(failure.message));
      },
          (content) async {
        emit(const CreateOrUpdateOrDeleteSuccess());
      },
    );
  }

  _onDeleteGuardianQuestion(
      Delete{{featureName.pascalCase()}}Event event,
      Emitter<{{featureName.pascalCase()}}State> emit,
      ) async {
    emit(const {{featureName.pascalCase()}}Loading());

    final result = await _delete{{featureName.pascalCase()}}UseCase(Delete{{featureName.pascalCase()}}UseCaseParams(
        id: event.id
    ));

    result.fold(
          (failure) {
        emit({{featureName.pascalCase()}}Error(failure.message));
      },
          (content) async {
        emit(const CreateOrUpdateOrDeleteSuccess());
      },
    );
  }

}
