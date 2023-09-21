import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../domain/use_cases/get_{{bloc.snakeCase()}}_use_case.dart';
import '../../domain/entities/{{bloc.snakeCase()}}_entity.dart';

part '{{bloc.snakeCase()}}_event.dart';
part '{{bloc.snakeCase()}}_state.dart';

class {{bloc.pascalCase()}}Bloc extends Bloc<{{bloc.pascalCase()}}Event, {{bloc.pascalCase()}}State> {
  final Get{{bloc.pascalCase()}}UseCase _get{{bloc.pascalCase()}}UseCase;

  {{bloc.pascalCase()}}Bloc({
    required Get{{bloc.pascalCase()}}UseCase get{{bloc.pascalCase()}}UseCase,
  }) : _get{{bloc.pascalCase()}}UseCase = get{{bloc.pascalCase()}}UseCase,
    super({{bloc.pascalCase()}}Empty()) {
      {{#events}} on<{{bloc.pascalCase()}}{{name.pascalCase()}}>(_on{{bloc.pascalCase()}}{{name.pascalCase()}});
      {{/events}}
    }
  {{#events}}
  _on{{bloc.pascalCase()}}{{name.pascalCase()}}(
    {{bloc.pascalCase()}}{{name.pascalCase()}} event,
    Emitter<{{bloc.pascalCase()}}State> emit,
  ) {
    //TODO - add _on{{bloc.pascalCase()}}{{name.pascalCase()}} logic
  }
  {{/events}}
}
