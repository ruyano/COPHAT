import 'package:auto_size_text/auto_size_text.dart';
import 'package:cophat/core/nav.dart';
import 'package:cophat/child_questionnaire/data/models/child_questionnaire_model.dart';
import 'package:flutter/material.dart';

import '../../../../core/question_type.dart';
import '../../../../core/ui_components/button_cophat.dart';
import '../../../../core/ui_components/cophat_dropdown_menu.dart';
import '../../../domain/entities/child_questionnaire_entity.dart';

class ChildQuestionnaireCreateOrUpdateQuestion extends StatelessWidget {

  final ChildQuestionnaireEntity? childQuestionnaireModel;
  final void Function(ChildQuestionnaireModel guardianQuestionModel) onPressed;
  final void Function(String? questionId)? onDeletePressed;

  ChildQuestionnaireCreateOrUpdateQuestion({
    super.key,
    this.childQuestionnaireModel,
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
        'Questão',
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
    return Column(
      children: [
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(
                      left: 15.0, right: 15.0, top: 15, bottom: 0),
                  child: TextField(
                    controller: _questionTextEditingController..text = childQuestionnaireModel?.question ?? '',
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Questão',
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 15.0, right: 15.0, top: 15, bottom: 0),
                  child: TextField(
                    controller: _answer1TextEditingController..text = _getAnswer(0),
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Resposta 1',
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 15.0, right: 15.0, top: 15, bottom: 0),
                  child: TextField(
                    controller: _answer2TextEditingController..text = _getAnswer(1),
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Resposta 2',
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 15.0, right: 15.0, top: 15, bottom: 0),
                  child: TextField(
                    controller: _answer3TextEditingController..text = _getAnswer(2),
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Resposta 3',
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 15.0, right: 15.0, top: 15, bottom: 0),
                  child: TextField(
                    controller: _answer4TextEditingController..text = _getAnswer(3),
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Resposta 4',
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 15.0, right: 15.0, top: 15, bottom: 0),
                  child: TextField(
                    controller: _answer5TextEditingController..text = _getAnswer(4),
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Resposta 5',
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 15.0, right: 15.0, top: 15, bottom: 0),
                  child: CophatDropdownMenu(
                    labelText: 'Tipo da questão',
                    items: QuestionType.values.map((e) => e.label).toList(),
                    controller: _dropdownController..value = childQuestionnaireModel?.questionType ?? '',
                  ),
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 15, bottom: 15),
          child: ButtonCophat(
            text: childQuestionnaireModel == null ? 'Criar' : 'Atualizar',
            onPressed: () {
              onPressed(ChildQuestionnaireModel(
                id: childQuestionnaireModel?.id,
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
        childQuestionnaireModel == null ? Container() : Padding(
          padding: const EdgeInsets.only(bottom: 15),
          child: ButtonCophat(
            text: 'Deletar',
            onPressed: () {
              if(onDeletePressed != null) {
                onDeletePressed!(childQuestionnaireModel?.id ?? '');
              }
              Nav.pop(context);
            },
          ),
        ),
      ],
    );
  }

  _getAnswer(int position) {
    int? length = childQuestionnaireModel?.answers?.length;

    if(length != null && length > position) {
      return childQuestionnaireModel?.answers?[position] ?? '';
    }

    return '';
  }

}