import '../../domain/entities/{{bloc.snakeCase()}}_entity.dart';

class {{bloc.pascalCase()}}Model extends {{bloc.pascalCase()}}Entity {
  {{bloc.pascalCase()}}Model() : super();

  factory {{bloc.pascalCase()}}Model.fromJson(Map<String, dynamic> json) {
    return {{bloc.pascalCase()}}Model();
  }
}
