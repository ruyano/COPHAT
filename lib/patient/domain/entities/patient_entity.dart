import 'package:equatable/equatable.dart';

class PatientEntity extends Equatable {

  String? id;
  final String? mothersName;
  final String? mothersProfession;
  final String? fathersName;
  final String? fathersProfession;
  final String? maritalStatus;
  final String? familyReligion;
  final String? patientsName;
  final DateTime? patientsBirthDate;
  final int? ageOnTheDayOfTheInterview;
  final String? patientsGender;
  final String? diagnosis;
  final String? diagnosisTime;
  final int? numberOfDaysHospitalized;
  final int? howManyHospitalizations;
  final String? education;
  final bool? attendingSchoolDuringHospitalization;
  final bool? residentInThisCity;
  final String? housingNeighborhoodCityState;
  final int? monthlyIncome;
  final String? levelOfEducationOfTheHeadOfTheFamily;

  PatientEntity({
    this.id,
    this.mothersName,
    this.mothersProfession,
    this.fathersName,
    this.fathersProfession,
    this.maritalStatus,
    this.familyReligion,
    this.patientsName,
    this.patientsBirthDate,
    this.ageOnTheDayOfTheInterview,
    this.patientsGender,
    this.diagnosis,
    this.diagnosisTime,
    this.numberOfDaysHospitalized,
    this.howManyHospitalizations,
    this.education,
    this.attendingSchoolDuringHospitalization,
    this.residentInThisCity,
    this.housingNeighborhoodCityState,
    this.monthlyIncome,
    this.levelOfEducationOfTheHeadOfTheFamily,
  });

  @override
  List<Object?> get props => [
    id,
    mothersName,
    mothersProfession,
    fathersName,
    fathersProfession,
    maritalStatus,
    familyReligion,
    patientsName,
    patientsBirthDate,
    ageOnTheDayOfTheInterview,
    patientsGender,
    diagnosis,
    diagnosisTime,
    numberOfDaysHospitalized,
    howManyHospitalizations,
    education,
    attendingSchoolDuringHospitalization,
    residentInThisCity,
    housingNeighborhoodCityState,
    monthlyIncome,
    levelOfEducationOfTheHeadOfTheFamily,
  ];
}
