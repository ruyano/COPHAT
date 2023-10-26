import 'package:auto_size_text/auto_size_text.dart';
import 'package:cophat/core/ui_components/request_model/request_question_entity.dart';
import 'package:cophat/core/ui_components/request_model/request_sub_question_entity.dart';
import 'package:cophat/core/ui_components/request_model/request_sub_question_page.dart';
import 'package:cophat/core/ui_components/text_field_cophat.dart';
import 'package:flutter/material.dart';
import 'package:numberpicker/numberpicker.dart';

import '../../nav.dart';
import '../../question_type.dart';
import '../button_cophat.dart';
import '../cophat_dropdown_menu.dart';
import '../question_card.dart';

class RequestQuestionPage extends StatefulWidget {

  final String? pageTitle;
  final RequestQuestionEntity? questionEntity;
  final void Function(RequestQuestionEntity? questionEntity) onCreateOrUpdate;
  final void Function(String? questionId)? onDeletePressed;

  const RequestQuestionPage({
    super.key,
    this.pageTitle,
    this.questionEntity,
    required this.onCreateOrUpdate,
    this.onDeletePressed,
  });

  @override
  State<StatefulWidget> createState() => _RequestQuestionPageState();

}

class _RequestQuestionPageState extends State<RequestQuestionPage> {

  final  _answersControllers = <TextEditingController>[];
  final _questionTextEditingController = TextEditingController();
  final _dropdownController = ValueNotifier<String?>('');

  String? _question;
  List<String> _answers = <String>[];
  RequestSubQuestionEntity? _subQuestion;
  int _currentValue = 3;

  @override
  Widget build(BuildContext context) {

    if(_question == null && widget.questionEntity?.question != null) {
      _question = widget.questionEntity?.question;
      _questionTextEditingController.text = _question ?? '';
    }

    if(_answers.isEmpty && widget.questionEntity?.answers != null && widget.questionEntity!.answers!.isNotEmpty) {
      _answers.addAll(widget.questionEntity!.answers!);
    }

    if(_subQuestion == null && widget.questionEntity?.subQuestion != null) {
      _subQuestion = widget.questionEntity?.subQuestion;
    }

    if(_answers.isEmpty) {
      _answers = <String>['', ''];
    }

    for(int i = 0; i < (_answers.length); i++) {
      if(_answersControllers.length <= i) {
        _answersControllers.add(TextEditingController());
      }
      _answersControllers[i].text = _answers[i];
    }

    return SafeArea(
      child: Scaffold(
        appBar: _appBar(context),
        body: _setupBody(context, _answers.length),
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

  _setupBody(BuildContext context, int answersAmount) {
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
                      NumberPicker(
                        value: _currentValue,
                        minValue: 0,
                        maxValue: 100,
                        onChanged: (value) => setState(() => _currentValue = value),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 15),
                        child: TextFieldCophat(
                          labelText: 'Questão',
                          controller: _questionTextEditingController,
                          onChanged: (text) {
                            setState(() {
                              _question = text;
                            });
                          },
                        ),
                      ),
                      ..._listOfAnswers(answersAmount),
                      Padding(
                        padding: const EdgeInsets.only(top: 15),
                        child: ButtonCophat(
                            text: 'Add',
                            onPressed: () {
                              setState(() {
                                _answers.add('');
                              });
                            }),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 15),
                        child: ButtonCophat(
                            text: 'Remove',
                            onPressed: () {
                              setState(() {
                                _answers.removeLast();
                                _answersControllers.removeLast();
                              });
                            }),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 15),
                        child: CophatDropdownMenu(
                          labelText: 'Tipo da questão',
                          items: QuestionType.values.map((e) => e.label).toList(),
                          controller: _dropdownController..value = widget.questionEntity?.questionType ?? '',
                        ),
                      ),
                      const Padding(
                          padding: EdgeInsets.only(top: 15),
                          child: Text('Subquestão:')
                      ),
                      _subQuestion?.question != null ? Padding(
                        padding: const EdgeInsets.only(top: 15),
                        child: QuestionCard(
                          question: _subQuestion?.question ?? '-',
                          answers: _subQuestion?.answers ?? [],
                          onTap: () {
                            _goToSubQuestion(context);
                          },
                        ),
                      ) : Container(),
                      Padding(
                        padding: const EdgeInsets.only(top: 15),
                        child: ButtonCophat(
                            text: '${_subQuestion?.question != null ? 'Editar' : 'Adicionar'} sub questão',
                            onPressed: () {
                              _goToSubQuestion(context);
                            }),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 15, bottom: 15),
                child: ButtonCophat(
                  text: widget.questionEntity == null ? 'Criar' : 'Atualizar',
                  onPressed: () {
                    widget.onCreateOrUpdate(RequestQuestionEntity(
                      id: widget.questionEntity?.id,
                      question: _questionTextEditingController.text,
                      questionType: _dropdownController.value,
                      answers: _answersControllers.map((e) => e.text).toList(),
                      subQuestion: _subQuestion?.question != null ? _subQuestion : null,
                    ));
                    Nav.pop(context);
                  },
                ),
              ),
              widget.questionEntity == null ? Container() : Padding(
                padding: const EdgeInsets.only(bottom: 15),
                child: ButtonCophat(
                  text: 'Deletar',
                  onPressed: () {
                    if(widget.onDeletePressed != null) {
                      widget.onDeletePressed!(widget.questionEntity?.id ?? '');
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

  void _goToSubQuestion(BuildContext context) {
    Nav.push(context, RequestSubQuestionPage(
      subQuestionEntity: _subQuestion,
      onCreateOrUpdate: (subQuestionEntity) {
        setState(() {
          _subQuestion = subQuestionEntity;
        });
      },
      onDeletePressed: () {
        setState(() {
          _subQuestion = RequestSubQuestionEntity();
        });
      },
    ));
  }

  _listOfAnswers(int amount) {
    var list = <Widget>[];
    for(int i = 0; i < amount; i++) {
      list.add(
        Padding(
          padding: const EdgeInsets.only(top: 15),
          child: TextFieldCophat(
            labelText: 'Resposta ${i+1}',
            controller: _answersControllers[i],
            onChanged: (text) {
              _answers[i] = text;
            },
          ),
        ),
      );
    }
    return list;
  }

}
