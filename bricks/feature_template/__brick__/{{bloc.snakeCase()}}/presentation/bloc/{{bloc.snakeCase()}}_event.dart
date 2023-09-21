part of '{{bloc.snakeCase()}}_bloc.dart';

abstract class {{bloc.pascalCase()}}Event extends Equatable {
  const {{bloc.pascalCase()}}Event();

  @override
  List<Object?> get props => [];
}

{{#events}}
class {{bloc.pascalCase()}}{{name.pascalCase()}} extends {{bloc.pascalCase()}}Event {
  {{#variables}} final {{{type}}} {{name}}; {{/variables}}

  const {{bloc.pascalCase()}}{{name.pascalCase()}}({{#variables}} this.{{name}}, {{/variables}});

  @override
  List<Object?> get props => [{{#variables}} this.{{name}}, {{/variables}}];
}
{{/events}}
