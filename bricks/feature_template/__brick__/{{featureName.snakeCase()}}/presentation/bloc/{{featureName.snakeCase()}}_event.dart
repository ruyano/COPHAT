part of '{{featureName.snakeCase()}}_bloc.dart';

abstract class {{featureName.pascalCase()}}Event extends Equatable {

  const {{featureName.pascalCase()}}Event();

  @override
  List<Object?> get props => [];
}

class Create{{featureName.pascalCase()}}Event extends {{featureName.pascalCase()}}Event {

  final {{featureName.pascalCase()}}Model {{featureName.camelCase()}}Model;

  const Create{{featureName.pascalCase()}}Event({
    required this.{{featureName.camelCase()}}Model,
  });

  @override
  List<Object?> get props => [
      {{featureName.camelCase()}}Model,
  ];
}

class Read{{featureName.pascalCase()}}Event extends {{featureName.pascalCase()}}Event {

  const Read{{featureName.pascalCase()}}Event();

  @override
  List<Object?> get props => [];
}

class Update{{featureName.pascalCase()}}Event extends {{featureName.pascalCase()}}Event {

  final {{featureName.pascalCase()}}Model {{featureName.camelCase()}}Model;

  const Update{{featureName.pascalCase()}}Event({
    required this.{{featureName.camelCase()}}Model,
  });

  @override
  List<Object?> get props => [
      {{featureName.camelCase()}}Model,
  ];
}

class Delete{{featureName.pascalCase()}}Event extends {{featureName.pascalCase()}}Event {

  final String id;

  const Delete{{featureName.pascalCase()}}Event({
    required this.id,
  });

  @override
  List<Object?> get props => [
    id,
  ];
}


