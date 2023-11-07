import 'package:auto_size_text/auto_size_text.dart';
import 'package:cophat/core/models/question_model.dart';
import 'package:cophat/core/nav.dart';
import 'package:cophat/core/ui_components/questions/answer_question/multiple_answer_body_widget.dart';
import 'package:cophat/core/ui_components/questions/answer_question/scale_answer_body_widget.dart';
import 'package:cophat/core/ui_components/questions/answer_question/single_answer_body_widget.dart';
import 'package:flutter/material.dart';
import 'package:ntp/ntp.dart';

import '../../../answer_type.dart';
import '../../../models/answers_model.dart';
import '../../../models/single_answer_model.dart';
import '../../../show_error.dart';
import '../../button_cophat.dart';

class AnswerQuestionPage extends StatefulWidget {

  final List<QuestionModel> questionsList;
  final void Function(AnswersModel? answersModel) onCreateOrUpdate;
  final void Function(String? questionId)? onDeletePressed;

  const AnswerQuestionPage({
    super.key,
    required this.questionsList,
    required this.onCreateOrUpdate,
    this.onDeletePressed,
  });

  @override
  State<StatefulWidget> createState() => _AnswerQuestionPageState();

}

class _AnswerQuestionPageState extends State<AnswerQuestionPage> {

  int currentQuestion = 0;

  final _answersControllers = <ValueNotifier<SingleAnswerModel>>[] ;

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

    if(_answersControllers.isEmpty) {
      for (int i = 0; i < widget.questionsList.length; i++) {
        _answersControllers.add(ValueNotifier<SingleAnswerModel>(SingleAnswerModel()));
      }
    }

    return LayoutBuilder(
      builder: (context , constraints) {
        return SizedBox(
          width: constraints.maxWidth,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _selectAnswerType(),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  currentQuestion > 0 ? SizedBox(
                    width: constraints.maxWidth/2,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 15, top: 15, bottom: 15, right: 15),
                      child: ButtonCophat(
                        text: 'Anterior',
                        onPressed: () {
                          setState(() {
                            if(currentQuestion > 0) {
                              currentQuestion--;
                            }
                          });
                        },
                      ),
                    ),
                  ) : Container(),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 15, top: 15, bottom: 15, right: 15),
                      child: ButtonCophat(
                        text: currentQuestion < (widget.questionsList.length-1) ? 'Próxima' : 'Finalizar',
                        onPressed: () {
                          if(currentQuestion == (widget.questionsList.length-1)) {
                            List<SingleAnswerModel>? answersList = _answersControllers.map((e) => e.value).toList();
                            widget.onCreateOrUpdate(
                                AnswersModel(
                                  date: DateTime.now(),
                                  answers: answersList,
                                )
                            );
                            Nav.pop(context, screens: 2);
                          } else {
                            setState(() {
                              if (widget.questionsList[currentQuestion]
                                  .subQuestion?.question !=
                                  null) {
                                showCustomDialog(
                                  context,
                                  _selectAnswerType(),
                                  buttonText: 'Responder',
                                  shouldGoBack: false,
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                );
                              } else {
                                if (currentQuestion <
                                    (widget.questionsList.length - 1)) {
                                  currentQuestion++;
                                }
                              }
                            });
                          }
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  StatefulWidget _selectAnswerType() {
    if(widget.questionsList[currentQuestion].answerType == AnswerType.scaled.label) {
      return ScaleAnswerBodyWidget(
        question: widget.questionsList[currentQuestion].question!,
        answers: widget.questionsList[currentQuestion].answers!,
        controllers: [],
      );
    } else if(widget.questionsList[currentQuestion].answerType == AnswerType.multipleOption.label) {
      return MultipleAnswerBodyWidget(
          question: widget.questionsList[currentQuestion].question!,
          answers: widget.questionsList[currentQuestion].answers!
      );
    }
    return SingleAnswerBodyWidget(
      question: widget.questionsList[currentQuestion].question!,
      answers: widget.questionsList[currentQuestion].answers!,
      controller: _answersControllers.length >= currentQuestion ? _answersControllers[currentQuestion] : null,
    );
  }

}
