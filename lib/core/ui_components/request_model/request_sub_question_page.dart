import 'package:auto_size_text/auto_size_text.dart';
import 'package:cophat/core/ui_components/request_model/request_question_entity.dart';
import 'package:cophat/core/ui_components/request_model/request_sub_question_entity.dart';
import 'package:cophat/core/ui_components/text_field_cophat.dart';
import 'package:flutter/material.dart';

import '../../nav.dart';
import '../../question_type.dart';
import '../button_cophat.dart';
import '../cophat_dropdown_menu.dart';

class RequestSubQuestionPage extends StatefulWidget {

  final RequestSubQuestionEntity? subQuestionEntity;
  final void Function(RequestSubQuestionEntity? subQuestionEntity) onCreateOrUpdate;
  final void Function()? onDeletePressed;

  const RequestSubQuestionPage({
    super.key,
    this.subQuestionEntity,
    required this.onCreateOrUpdate,
    this.onDeletePressed,
  });

  @override
  State<StatefulWidget> createState() => _RequestSubQuestionPageState();

}

class _RequestSubQuestionPageState extends State<RequestSubQuestionPage> {

  final  _answersControllers = <TextEditingController>[];
  final _questionTextEditingController = TextEditingController();

  String? _question;
  List<String> _answers = <String>[];


  @override
  Widget build(BuildContext context) {

    if(_question == null && widget.subQuestionEntity?.question != null) {
      _question = widget.subQuestionEntity?.question;
      _questionTextEditingController.text = _question ?? '';
    }

    if(_answers.isEmpty && widget.subQuestionEntity?.answers != null && widget.subQuestionEntity!.answers!.isNotEmpty) {
      _answers.addAll(widget.subQuestionEntity!.answers!);
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
                  text: widget.subQuestionEntity == null ? 'Criar' : 'Atualizar',
                  onPressed: () {
                    widget.onCreateOrUpdate(RequestSubQuestionEntity(
                      question: _questionTextEditingController.text,
                      answers: _answersControllers.map((e) => e.text).toList(),
                    ));
                    Nav.pop(context);
                  },
                ),
              ),
              widget.subQuestionEntity == null ? Container() : Padding(
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
