import 'package:equatable/equatable.dart';

class ChildEntity extends Equatable {

  final String? name;
  final String? birthDate;
  final String? gender;

  const ChildEntity({
    this.name,
    this.birthDate,
    this.gender
  });

  @override
  List<Object?> get props => [
    name,
    birthDate,
    gender,
  ];
}