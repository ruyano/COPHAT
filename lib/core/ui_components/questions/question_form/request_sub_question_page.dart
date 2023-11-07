import 'package:auto_size_text/auto_size_text.dart';
import 'package:cophat/core/ui_components/text_field_cophat.dart';
import 'package:flutter/material.dart';

import '../../../answer_type.dart';
import '../../../models/sub_question_model.dart';
import '../../../nav.dart';
import '../../button_cophat.dart';
import '../../cophat_dropdown_menu.dart';

class RequestSubQuestionPage extends StatefulWidget {

  final SubQuestionModel? subQuestionModel;
  final void Function(SubQuestionModel? subQuestionModel) onCreateOrUpdate;
  final void Function()? onDeletePressed;

  const RequestSubQuestionPage({
    super.key,
    this.subQuestionModel,
    required this.onCreateOrUpdate,
    this.onDeletePressed,
  });

  @override
  State<StatefulWidget> createState() => _RequestSubQuestionPageState();

}

class _RequestSubQuestionPageState extends State<RequestSubQuestionPage> {

  final  _answersControllers = <TextEditingController>[];
  final _questionTextEditingController = TextEditingController();
  final _answerTypeDropdownController = ValueNotifier<String?>('');

  String? _question;
  List<String> _answers = <String>[];

  @override
  Widget build(BuildContext context) {

    if(_question == null && widget.subQuestionModel?.question != null) {
      _question = widget.subQuestionModel?.question;
      _questionTextEditingController.text = _question ?? '';
    }

    if(_answers.isEmpty && widget.subQuestionModel?.answers != null && widget.subQuestionModel!.answers!.isNotEmpty) {
      _answers.addAll(widget.subQuestionModel!.answers!);
    }

    if(_answers.isEmpty) {
      _answers =  [
        'Raiva',
        'Medo',
        'Tristeza',
      ];
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
        'Subquestão',
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
                        child: CophatDropdownMenu(
                          labelText: 'Tipo da resposta',
                          items: AnswerType.values.map((e) => e.label).toList(),
                          controller: _answerTypeDropdownController..value = widget.subQuestionModel?.answerType ?? '',
                        ),
                      ),
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
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 15, bottom: 15),
                child: ButtonCophat(
                  text: widget.subQuestionModel == null ? 'Criar' : 'Atualizar',
                  onPressed: () {
                    widget.onCreateOrUpdate(SubQuestionModel(
                      question: _questionTextEditingController.text,
                      answers: _answersControllers.map((e) => e.text).toList(),
                      answerType: _answerTypeDropdownController.value
                    ));
                    Nav.pop(context);
                  },
                ),
              ),
              widget.subQuestionModel == null ? Container() : Padding(
                padding: const EdgeInsets.only(bottom: 15),
                child: ButtonCophat(
                  text: 'Deletar',
                  onPressed: () {
                    if(widget.onDeletePressed != null) {
                      widget.onDeletePressed!();
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
