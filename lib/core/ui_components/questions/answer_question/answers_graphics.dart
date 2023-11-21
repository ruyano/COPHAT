import 'package:auto_size_text/auto_size_text.dart';
import 'package:cophat/core/ui_components/questions/single_quiz_type_graphics.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../../empty_indicator.dart';
import '../../../models/answers_model.dart';

class AsnswersGraphics extends StatelessWidget {

  final List<AnswersModel>? answers;

  AsnswersGraphics({
    super.key,
    required this.answers,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: _appBar(context),
        body: _body(),
      ),
    );
  }

  _appBar(BuildContext context) {
    return AppBar(
      centerTitle: true,
      title: const AutoSizeText(
        'Gráficos das respostas',
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

  _body() {

    // cada item é referente a um tipo de questionario
    final List<AnswersModel> questionariosDiferentes = [];

    answers?.asMap().forEach((key, value) {
      // adicionar primeiro questionário a lista
      if(questionariosDiferentes.isEmpty) {
        questionariosDiferentes.add(value);
      }
      // comprarar a lista de questões
      bool contains = false;
      questionariosDiferentes.asMap().forEach((key, valueTeste) {
        if(listEquals(valueTeste.questions, value.questions)) {
          contains = true;
          return;
        }
      });
      if(!contains) {
        questionariosDiferentes.add(value);
      }
    });

    // cada lista representa as respostas de um tipo de questionario
    final List<List<AnswersModel>> respostasDeQuestionariosIguais = [];
    for (var element in questionariosDiferentes) {
      respostasDeQuestionariosIguais.add([]);
    }

    questionariosDiferentes.asMap().forEach((quizKey, currentQuizTye) {
      answers?.asMap().forEach((key, currentAnswer) {
        if(listEquals(currentQuizTye.questions, currentAnswer.questions)) {
          respostasDeQuestionariosIguais[quizKey].add(currentAnswer);
        }
      });
    });


    return LayoutBuilder(
      builder: (context , constraints) {
        return SizedBox(
          width: constraints.maxWidth,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: questionariosDiferentes.isEmpty ? const EmptyIndicator() : SizedBox(
                  width: constraints.maxWidth * .9,
                  child: ListView.builder(
                      itemCount: questionariosDiferentes.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(top: 15),
                          child: SingleQuizTypeGraphics(
                            title: "Questionário do tipo ${index + 1}:",
                            answersList: respostasDeQuestionariosIguais[index],
                          )
                        );
                      }),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

}