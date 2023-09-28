import 'package:equatable/equatable.dart';

class FamilyEntity extends Equatable {

  String? id;
  final String? mothersName;
  final String? mothersProfession;
  final String? fathersName;
  final String? fathersProfession;
  final String? familyReligion;

  FamilyEntity({
    this.id,
    this.mothersName,
    this.mothersProfession,
    this.fathersName,
    this.fathersProfession,
    this.familyReligion,
  });
  
  @override
  List<Object?> get props => [
    id,
    mothersName,
    mothersProfession,
    fathersName,
    fathersProfession,
    familyReligion,
  ];
}
