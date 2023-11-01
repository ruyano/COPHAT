import 'package:auto_size_text/auto_size_text.dart';
import 'package:cophat/core/nav.dart';
import 'package:cophat/patient/data/models/patient_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

import '../../../../../core/ui_components/button_cophat.dart';
import '../../../../../core/ui_components/cophat_dropdown_menu.dart';
import '../../../../../core/ui_components/text_field_cophat.dart';
import '../../../../domain/entities/patient_entity.dart';

class PatientCreateOrUpdate extends StatelessWidget {

  final PatientEntity? patientModel;
  final void Function(PatientModel guardianpatientModel) onPressed;
  final void Function(String? questionId)? onDeletePressed;

  PatientCreateOrUpdate({
    super.key,
    this.patientModel,
    required this.onPressed,
    this.onDeletePressed,
  });

  final _patientsNameTextEditingController = TextEditingController();
  final _mothersNameTextEditingController = TextEditingController();
  final _mothersProfessionEditingController = TextEditingController();
  final _fathersNameTextEditingController = TextEditingController();
  final _fathersProfessionTextEditingController = TextEditingController();
  final _maritalStatusValueNotifier = ValueNotifier<String?>('');
  final _familyReligionValueNotifier = ValueNotifier<String?>('');
  final _patientsBirthDateTextEditingController = TextEditingController();
  final _ageOnTheDayOfTheInterviewTextEditingController = TextEditingController();
  final _patientsGenderValueNotifier = ValueNotifier<String?>('');
  final _diagnosisTextEditingController = TextEditingController();
  final _diagnosisTimeTextEditingController = TextEditingController();
  final _numberOfDaysHospitalizedTextEditingController = TextEditingController();
  final _howManyHospitalizationsTextEditingController = TextEditingController();
  final _educationValueNotifier = ValueNotifier<String?>('');
  final _attendingSchoolDuringHospitalizationValueNotifier = ValueNotifier<String?>('');
  final _residentInThisCityValueNotifier = ValueNotifier<String?>('');
  final _housingNeighborhoodCityStateTextEditingController = TextEditingController();
  final _monthlyIncomeTextEditingController = TextEditingController();
  final _levelOfEducationOfTheHeadOfTheFamilyValueNotifier = ValueNotifier<String?>('');

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: _appBar(context),
        body: _setupBody(context),
      ),
    );
  }

  _appBar(BuildContext context) {
    return AppBar(
      centerTitle: true,
      title: const AutoSizeText(
        'Paciente',
        maxFontSize: 16.0,
        textScaleFactor: 1.0,
      ),
      actions: <Widget>[
        IconButton(
          icon: const Icon(Icons.close),
          onPressed: () => Navigator.of(context).pop(null),
        ),
      ],
      leading: Container(),
    );
  }

  _setupBody(BuildContext context) {
    return LayoutBuilder(
      builder: (context , constraints) {
        return SizedBox(
          width: constraints.maxWidth,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(top: 15),
                        child: TextFieldCophat(
                          labelText: 'Nome do paciente:',
                          controller: _patientsNameTextEditingController..text = patientModel?.patientsName ?? '',
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 15),
                        child: TextFieldCophat(
                          labelText: 'Nome da Mãe:',
                          controller: _mothersNameTextEditingController..text = patientModel?.mothersName ?? '',
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 15),
                        child: TextFieldCophat(
                          labelText: 'Profissão da mãe:',
                          controller: _mothersProfessionEditingController..text = patientModel?.mothersProfession ?? '',
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 15),
                        child: TextFieldCophat(
                          labelText: 'Nome do pai',
                          controller: _fathersNameTextEditingController..text = patientModel?.fathersName ?? '',
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 15),
                        child: TextFieldCophat(
                          labelText: 'Profissão do pai:',
                          controller: _fathersProfessionTextEditingController..text = patientModel?.fathersProfession ?? '',
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 15),
                        child: CophatDropdownMenu(
                          labelText: 'Estado civil dos pais:',
                          controller: _maritalStatusValueNotifier..value = patientModel?.maritalStatus ?? '',
                          items: const ['Casado', 'Amasiado', 'Divorciado/Separado', 'Solteiro',],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 15),
                        child: CophatDropdownMenu(
                          labelText: 'Religião da família:',
                          controller: _familyReligionValueNotifier..value = patientModel?.familyReligion ?? '',
                          items: const ['Católica', 'Evangélica', 'Espírita', 'Outra:',],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 15),
                        child: TextFieldCophat(
                          labelText: 'Nascimento:',
                          controller: _patientsBirthDateTextEditingController..text =  patientModel?.patientsBirthDate == null ? '' : DateFormat.yMd().format(patientModel!.patientsBirthDate!),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 15),
                        child: TextFieldCophat(
                          labelText: 'Idade no dia da entrevista:',
                          controller: _ageOnTheDayOfTheInterviewTextEditingController..text = patientModel?.ageOnTheDayOfTheInterview?.toString() ?? '',
                          keyboardType: TextInputType.number,
                          inputFormatters: <TextInputFormatter>[
                            FilteringTextInputFormatter.digitsOnly
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 15),
                        child: CophatDropdownMenu(
                          labelText: 'Sexo:',
                          controller: _patientsGenderValueNotifier..value = patientModel?.patientsGender ?? '',
                          items: const ['Masculino', 'Feminino',],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 15),
                        child: TextFieldCophat(
                          labelText: 'Diagnóstico:',
                          controller: _diagnosisTextEditingController..text = patientModel?.diagnosis ?? '',
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 15),
                        child: TextFieldCophat(
                          labelText: 'Tempo de diagnóstico:',
                          controller: _diagnosisTimeTextEditingController..text = patientModel?.diagnosisTime ?? '',
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 15),
                        child: TextFieldCophat(
                          labelText: 'Número de dias internado:',
                          controller: _numberOfDaysHospitalizedTextEditingController..text = patientModel?.numberOfDaysHospitalized?.toString() ?? '',
                          keyboardType: TextInputType.number,
                          inputFormatters: <TextInputFormatter>[
                            FilteringTextInputFormatter.digitsOnly
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 15),
                        child: TextFieldCophat(
                          labelText: 'Quantas internações:',
                          controller: _howManyHospitalizationsTextEditingController..text = patientModel?.howManyHospitalizations.toString() ?? '',
                          keyboardType: TextInputType.number,
                          inputFormatters: <TextInputFormatter>[
                            FilteringTextInputFormatter.digitsOnly
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 15),
                        child: CophatDropdownMenu(
                          labelText: 'Escolaridade:',
                          controller: _educationValueNotifier..value = patientModel?.education?? '',
                          items: const [
                            'Primeiro ano',
                            'Segundo ano',
                            'Terceiro ano',
                            'Quarto ano',
                            'Quinto ano',
                            'Sexto ano',
                            'Sétimo ano',
                            'Oitavo ano',
                            'Nono ano',
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 15),
                        child: CophatDropdownMenu(
                          labelText: 'Está frequentando a escola durante a internação:',
                          controller: _attendingSchoolDuringHospitalizationValueNotifier..value = patientModel?.attendingSchoolDuringHospitalization == null ? '' : (patientModel!.attendingSchoolDuringHospitalization! ? 'Sim' : 'Não'),
                          items: const [
                            'Sim',
                            'Não',
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 15),
                        child: CophatDropdownMenu(
                          labelText: 'Residente nesta cidade:',
                          controller: _residentInThisCityValueNotifier..value = patientModel?.residentInThisCity == null ? '' : (patientModel!.residentInThisCity! ? 'Sim' : 'Não'),
                          items: const [
                            'Sim',
                            'Não',
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 15),
                        child: TextFieldCophat(
                          labelText: 'Moradia (Bairro/Cidade/Estado):',
                          controller: _housingNeighborhoodCityStateTextEditingController..text = patientModel?.housingNeighborhoodCityState ?? '',
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 15),
                        child: TextFieldCophat(
                          labelText: 'Qual é a renda mensal de todos que contribuem com as despesas da casa?',
                          controller: _monthlyIncomeTextEditingController..text = patientModel?.monthlyIncome?.toString() ?? '',
                          keyboardType: TextInputType.number,
                          inputFormatters: <TextInputFormatter>[
                            FilteringTextInputFormatter.digitsOnly
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 15),
                        child: CophatDropdownMenu(
                          labelText: 'Qual é o grau de instrução do chefe da família?',
                          controller: _levelOfEducationOfTheHeadOfTheFamilyValueNotifier..value = patientModel?.levelOfEducationOfTheHeadOfTheFamily ?? '',
                          items: const [
                            'Analfabeto / Fundamental I incompleto',
                            'Fundamental I completo / Fundamental II incompleto',
                            'Fundamental completo/Médio incompleto',
                            'Médio completo/Superior incompleto',
                            'Superior completo',
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 15, bottom: 15),
                child: ButtonCophat(
                  text: patientModel == null ? 'Criar' : 'Atualizar',
                  onPressed: () {
                    onPressed(PatientModel(
                      id: patientModel?.id,
                      mothersName: _mothersNameTextEditingController.text,
                      mothersProfession: _mothersProfessionEditingController.text,
                      fathersName: _fathersNameTextEditingController.text,
                      fathersProfession: _fathersProfessionTextEditingController.text,
                      maritalStatus: _maritalStatusValueNotifier.value,
                      familyReligion: _familyReligionValueNotifier.value,
                      patientsName: _patientsNameTextEditingController.text,
                      patientsBirthDate: _patientsBirthDateTextEditingController.text.isEmpty ? null : DateFormat.yMd().parse(_patientsBirthDateTextEditingController.text),
                      ageOnTheDayOfTheInterview: int.parse(_ageOnTheDayOfTheInterviewTextEditingController.text),
                      patientsGender: _patientsGenderValueNotifier.value,
                      diagnosis: _diagnosisTextEditingController.text,
                      diagnosisTime: _diagnosisTimeTextEditingController.text,
                      numberOfDaysHospitalized: int.parse(_numberOfDaysHospitalizedTextEditingController.text),
                      howManyHospitalizations: int.parse(_howManyHospitalizationsTextEditingController.text),
                      education: _educationValueNotifier.value,
                      attendingSchoolDuringHospitalization: _attendingSchoolDuringHospitalizationValueNotifier.value == null ? null : _attendingSchoolDuringHospitalizationValueNotifier.value == 'Sim',
                      residentInThisCity: _residentInThisCityValueNotifier.value == null ? null : _residentInThisCityValueNotifier.value == 'Sim',
                      housingNeighborhoodCityState: _housingNeighborhoodCityStateTextEditingController.text,
                      monthlyIncome: int.parse(_monthlyIncomeTextEditingController.text),
                      levelOfEducationOfTheHeadOfTheFamily: _levelOfEducationOfTheHeadOfTheFamilyValueNotifier.value,
                    ));
                    Nav.pop(context);
                  },
                ),
              ),
              patientModel == null ? Container() : Padding(
                padding: const EdgeInsets.only(bottom: 15),
                child: ButtonCophat(
                  text: 'Deletar',
                  onPressed: () {
                    if(onDeletePressed != null) {
                      onDeletePressed!(patientModel?.id ?? '');
                    }
                    Nav.pop(context);
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }

}