import 'package:auto_size_text/auto_size_text.dart';
import 'package:cophat/core/nav.dart';
import 'package:cophat/patient/data/models/patient_model.dart';
import 'package:flutter/material.dart';

import '../../../../../core/question_type.dart';
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
  final _maritalStatusTextEditingController = TextEditingController();
  final _familyReligionTextEditingController = TextEditingController();

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
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 15.0, right: 15.0, top: 15, bottom: 0),
                          child: TextFieldCophat(
                            labelText: 'Nome do paciente:',
                            controller: _patientsNameTextEditingController..text = patientModel?.patientsName ?? '',
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 15.0, right: 15.0, top: 15, bottom: 0),
                          child: TextFieldCophat(
                            labelText: 'Nome da Mãe:',
                            controller: _mothersNameTextEditingController..text = patientModel?.mothersName ?? '',
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 15.0, right: 15.0, top: 15, bottom: 0),
                          child: TextFieldCophat(
                            labelText: 'Profissão da mãe:',
                            controller: _mothersProfessionEditingController..text = patientModel?.mothersProfession ?? '',
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 15.0, right: 15.0, top: 15, bottom: 0),
                          child: TextFieldCophat(
                            labelText: 'Nome do pai',
                            controller: _fathersNameTextEditingController..text = patientModel?.fathersName ?? '',
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 15.0, right: 15.0, top: 15, bottom: 0),
                          child: TextFieldCophat(
                            labelText: 'Profissão do pai:',
                            controller: _fathersProfessionTextEditingController..text = patientModel?.fathersProfession ?? '',
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 15.0, right: 15.0, top: 15, bottom: 0),
                          child: TextFieldCophat(
                            labelText: 'Estado civil dos pais:',
                            controller: _maritalStatusTextEditingController..text = patientModel?.maritalStatus ?? '',
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 15.0, right: 15.0, top: 15, bottom: 0),
                          child: TextFieldCophat(
                            labelText: 'Religião da família:',
                            controller: _familyReligionTextEditingController..text = patientModel?.familyReligion ?? '',
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
                        maritalStatus: _maritalStatusTextEditingController.text,
                        familyReligion: _familyReligionTextEditingController.text,
                        patientsName: _patientsNameTextEditingController.text,
                        patientsBirthDate: DateTime.now(),
                        ageOnTheDayOfTheInterview: 0,
                        patientsGender: '',
                        diagnosis: '',
                        diagnosisTime: '',
                        numberOfDaysHospitalized: 0,
                        howManyHospitalizations: 0,
                        education: '',
                        attendingSchoolDuringHospitalization: true,
                        residentInThisCity: true,
                        housingNeighborhoodCityState: '',
                        monthlyIncome: 0,
                        levelOfEducationOfTheHeadOfTheFamily: '',
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
    });
  }

}