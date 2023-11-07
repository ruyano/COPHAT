import '../../domain/entities/patient_entity.dart';

class PatientModel extends PatientEntity {

  PatientModel({
    String? id,
    String? mothersName,
    String? mothersProfession,
    String? fathersName,
    String? fathersProfession,
    String? maritalStatus,
    String? familyReligion,
    String? patientsName,
    DateTime? patientsBirthDate,
    int? ageOnTheDayOfTheInterview,
    String? patientsGender,
    String? diagnosis,
    String? diagnosisTime,
    int? numberOfDaysHospitalized,
    int? howManyHospitalizations,
    String? education,
    bool? attendingSchoolDuringHospitalization,
    bool? residentInThisCity,
    String? housingNeighborhoodCityState,
    int? monthlyIncome,
    String? levelOfEducationOfTheHeadOfTheFamily,
  }) : super(
    id: id,
    mothersName: mothersName,
    mothersProfession: mothersProfession,
    fathersName: fathersName,
    fathersProfession: fathersProfession,
    maritalStatus: maritalStatus,
    familyReligion: familyReligion,
    patientsName: patientsName,
    patientsBirthDate: patientsBirthDate,
    ageOnTheDayOfTheInterview: ageOnTheDayOfTheInterview,
    patientsGender: patientsGender,
    diagnosis: diagnosis,
    diagnosisTime: diagnosisTime,
    numberOfDaysHospitalized: numberOfDaysHospitalized,
    howManyHospitalizations: howManyHospitalizations,
    education: education,
    attendingSchoolDuringHospitalization: attendingSchoolDuringHospitalization,
    residentInThisCity: residentInThisCity,
    housingNeighborhoodCityState: housingNeighborhoodCityState,
    monthlyIncome: monthlyIncome,
    levelOfEducationOfTheHeadOfTheFamily: levelOfEducationOfTheHeadOfTheFamily,
  );

  factory PatientModel.fromJson(Map<String, dynamic> json) {
    return PatientModel(
      id: json['id'],
      mothersName: json['mothersName'],
      mothersProfession: json['mothersProfession'],
      fathersName: json['fathersName'],
      fathersProfession: json['fathersProfession'],
      maritalStatus: json['maritalStatus'],
      familyReligion: json['familyReligion'],
      patientsName: json['patientsName'],
      patientsBirthDate: json['patientsBirthDate']?.toDate(),
      ageOnTheDayOfTheInterview: json['ageOnTheDayOfTheInterview'],
      patientsGender: json['patientsGender'],
      diagnosis: json['diagnosis'],
      diagnosisTime: json['diagnosisTime'],
      numberOfDaysHospitalized: json['numberOfDaysHospitalized'],
      howManyHospitalizations: json['howManyHospitalizations'],
      education: json['education'],
      attendingSchoolDuringHospitalization: json['attendingSchoolDuringHospitalization'],
      residentInThisCity: json['residentInThisCity'],
      housingNeighborhoodCityState: json['housingNeighborhoodCityState'],
      monthlyIncome: json['monthlyIncome'],
      levelOfEducationOfTheHeadOfTheFamily: json['levelOfEducationOfTheHeadOfTheFamily'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['mothersName'] = mothersName;
    data['mothersProfession'] = mothersProfession;
    data['fathersName'] = fathersName;
    data['fathersProfession'] = fathersProfession;
    data['maritalStatus'] = maritalStatus;
    data['familyReligion'] = familyReligion;
    data['patientsName'] = patientsName;
    data['patientsBirthDate'] = patientsBirthDate;
    data['ageOnTheDayOfTheInterview'] = ageOnTheDayOfTheInterview;
    data['patientsGender'] = patientsGender;
    data['diagnosis'] = diagnosis;
    data['diagnosisTime'] = diagnosisTime;
    data['numberOfDaysHospitalized'] = numberOfDaysHospitalized;
    data['howManyHospitalizations'] = howManyHospitalizations;
    data['education'] = education;
    data['attendingSchoolDuringHospitalization'] = attendingSchoolDuringHospitalization;
    data['residentInThisCity'] = residentInThisCity;
    data['housingNeighborhoodCityState'] = housingNeighborhoodCityState;
    data['monthlyIncome'] = monthlyIncome;
    data['levelOfEducationOfTheHeadOfTheFamily'] = levelOfEducationOfTheHeadOfTheFamily;
    return data;
  }

}
