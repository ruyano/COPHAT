import 'package:auto_size_text/auto_size_text.dart';
import 'package:cophat/core/ui_components/questions/answer_question/answer_question_widget.dart';
import 'package:cophat/core/ui_components/questions/entities/question_entity.dart';
import 'package:flutter/material.dart';

import '../../../../child_questionnaire/domain/entities/child_questionnaire_entity.dart';
import '../../../show_error.dart';
import '../../button_cophat.dart';

class AnswerQuestionPage extends StatefulWidget {

  final List<ChildQuestionnaireEntity> questionsList;
  final void Function(RequestQuestionEntity? questionEntity) onCreateOrUpdate;
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
    return LayoutBuilder(
      builder: (context , constraints) {
        return SizedBox(
          width: constraints.maxWidth,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              AnswerQuestionWidget(
                  question: widget.questionsList[currentQuestion].question!,
                  answers: widget.questionsList[currentQuestion].answers!
              ),
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
                          setState(() {
                            if(widget.questionsList[currentQuestion].subQuestion != null) {
                              showCustomDialog(
                                context,
                                AnswerQuestionWidget(
                                    question: widget.questionsList[currentQuestion].subQuestion!,
                                    answers: widget.questionsList[currentQuestion].subAnswers!
                                ),
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
}
