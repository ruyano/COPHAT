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

  final _questionTextEditingController = TextEditingController();
  final _answer1TextEditingController = TextEditingController();
  final _answer2TextEditingController = TextEditingController();
  final _answer3TextEditingController = TextEditingController();
  final _answer4TextEditingController = TextEditingController();
  final _answer5TextEditingController = TextEditingController();
  final _dropdownController = ValueNotifier<String?>('');

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
        return Container(
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
                            labelText: 'Questão',
                            controller: _questionTextEditingController..text = patientModel?.question ?? '',
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 15.0, right: 15.0, top: 15, bottom: 0),
                          child: TextFieldCophat(
                            labelText: 'Questão 1',
                            controller: _answer1TextEditingController..text = _getAnswer(0),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 15.0, right: 15.0, top: 15, bottom: 0),
                          child: TextFieldCophat(
                            labelText: 'Questão 2',
                            controller: _answer2TextEditingController..text = _getAnswer(1),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 15.0, right: 15.0, top: 15, bottom: 0),
                          child: TextFieldCophat(
                            labelText: 'Questão 3',
                            controller: _answer3TextEditingController..text = _getAnswer(2),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 15.0, right: 15.0, top: 15, bottom: 0),
                          child: TextFieldCophat(
                            labelText: 'Questão 4',
                            controller: _answer4TextEditingController..text = _getAnswer(3),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 15.0, right: 15.0, top: 15, bottom: 0),
                          child: TextFieldCophat(
                            labelText: 'Questão 5',
                            controller: _answer5TextEditingController..text = _getAnswer(4),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 15.0, right: 15.0, top: 15, bottom: 0),
                          child: CophatDropdownMenu(
                            labelText: 'Tipo da questão',
                            items: QuestionType.values.map((e) => e.label).toList(),
                            controller: _dropdownController..value = patientModel?.questionType ?? '',
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
                        question: _questionTextEditingController.text,
                        questionType: _dropdownController.value,
                        answers: [
                          _answer1TextEditingController.text,
                          _answer2TextEditingController.text,
                          _answer3TextEditingController.text,
                          _answer4TextEditingController.text,
                          _answer5TextEditingController.text,
                        ],
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

  _getAnswer(int position) {
    int? length = patientModel?.answers?.length;

    if(length != null && length > position) {
      return patientModel?.answers?[position] ?? '';
    }

    return '';
  }

}