part of '{{bloc.snakeCase()}}_bloc.dart';

abstract class {{bloc.pascalCase()}}State extends Equatable {
  const {{bloc.pascalCase()}}State();

  @override
  List<Object?> get props => [];
}

{{#states}}
class {{bloc.pascalCase()}}{{name.pascalCase()}} extends {{bloc.pascalCase()}}State {
  {{#variables}} final {{{type}}} {{name}}; {{/variables}}

  const {{bloc.pascalCase()}}{{name.pascalCase()}}({{#variables}} this.{{name}}, {{/variables}});

  @override
  List<Object?> get props => [{{#variables}} this.{{name}}, {{/variables}}];
}
{{/states}}
