import '../../domain/entities/family_entity.dart';

class FamilyModel extends FamilyEntity {

  FamilyModel({
    String? id,
    String? mothersName,
    String? mothersProfession,
    String? fathersName,
    String? fathersProfession,
    String? familyReligion,
  }) : super(
    id: id,
    mothersName: mothersName,
    mothersProfession: mothersProfession,
    fathersName: fathersName,
    fathersProfession: fathersProfession,
    familyReligion: familyReligion,
  );

  factory FamilyModel.fromJson(Map<String, dynamic> json) {
    return FamilyModel(
      id: json['id'],
      mothersName: json['mothersName'],
      mothersProfession: json['mothersProfession'],
      fathersName: json['fathersName'],
      fathersProfession: json['fathersProfession'],
      familyReligion: json['familyReligion'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['mothersName'] = mothersName;
    data['mothersProfession'] = mothersProfession;
    data['fathersName'] = fathersName;
    data['fathersProfession'] = fathersProfession;
    data['familyReligion'] = familyReligion;
    return data;
  }

}
