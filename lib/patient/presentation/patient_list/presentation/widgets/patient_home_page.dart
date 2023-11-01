import 'package:auto_size_text/auto_size_text.dart';
import 'package:cophat/patient/presentation/patient_list/presentation/widgets/patient_create_or_update.dart';
import 'package:flutter/material.dart';
import '../../../../../core/nav.dart';
import '../../../../../core/ui_components/button_cophat.dart';
import '../../../../../patient_questionnaire_answers/presentation/presentation/patient_questionnaire_answers_page.dart';
import '../../../../data/models/patient_model.dart';
import '../../../../domain/entities/patient_entity.dart';

class PatientHomePage extends StatelessWidget {

  final PatientEntity patientModel;
  final void Function(PatientModel guardianpatientModel) onUpdatePatientsRegister;
  final void Function(String? questionId)? onDeletePatientsRegister;

  const PatientHomePage({
    super.key,
    required this.patientModel,
    required this.onUpdatePatientsRegister,
    this.onDeletePatientsRegister,
  });

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
                        child: Text('${patientModel.patientsName}'),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 15),
                        child: ButtonCophat(
                            text: 'Questionário do responsável',
                            onPressed: () {
                            }),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 15),
                        child: ButtonCophat(
                            text: 'Questionário do paciente',
                            onPressed: () {
                              Nav.push(context, PatientQuestionnaireAnswersPage());
                            }),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 15),
                        child: ButtonCophat(
                            text: 'Editar cadastro do paciente',
                            onPressed: () {
                              Nav.push(context, PatientCreateOrUpdate(
                                patientModel: patientModel,
                                onPressed: onUpdatePatientsRegister,
                                onDeletePressed: onDeletePatientsRegister,
                              ));
                            }),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }


}