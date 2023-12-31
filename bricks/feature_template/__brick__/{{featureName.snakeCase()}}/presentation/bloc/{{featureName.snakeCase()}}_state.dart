part of '{{featureName.snakeCase()}}_bloc.dart';

abstract class {{featureName.pascalCase()}}State extends Equatable {
  const {{featureName.pascalCase()}}State();

  @override
  List<Object?> get props => [];
}


class {{featureName.pascalCase()}}Empty extends {{featureName.pascalCase()}}State {

  const {{featureName.pascalCase()}}Empty();

  @override
  List<Object?> get props => [];
}

class {{featureName.pascalCase()}}Loading extends {{featureName.pascalCase()}}State {

  const {{featureName.pascalCase()}}Loading();

  @override
  List<Object?> get props => [];
}

class {{featureName.pascalCase()}}Success extends {{featureName.pascalCase()}}State {

  final List<{{featureName.pascalCase()}}Entity>? {{featureName.camelCase()}}List;

  const {{featureName.pascalCase()}}Success({
    this.{{featureName.camelCase()}}List
  });

  @override
  List<Object?> get props => [
    {{featureName.camelCase()}}List
  ];
}

class CreateOrUpdateOrDeleteSuccess extends {{featureName.pascalCase()}}State {

  const CreateOrUpdateOrDeleteSuccess();

  @override
  List<Object?> get props => [];
}

class {{featureName.pascalCase()}}Error extends {{featureName.pascalCase()}}State {

  final String message;

  const {{featureName.pascalCase()}}Error( this.message, );

  @override
  List<Object?> get props => [
    message,
  ];
}

