import 'dart:collection';

import 'package:cophat/core/answer_type.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../models/answers_model.dart';
import '../../models/question_model.dart';
import '../../models/single_answer_model.dart';

class SingleQuizTypeGraphics extends StatelessWidget {

  final String title;
  final List<AnswersModel> answersList;

  SingleQuizTypeGraphics({
    required this.title,
    required this.answersList,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (context, constraints) {
          return SizedBox(
            width: constraints.maxWidth * .9,
            child: Card(
              child: Column(
                children: [
                  Text(title),
                  ..._listOfQuestion()
                ],
              ),
            ),
          );
        }
    );
  }

  _listOfQuestion() {
    if(answersList.first.questions != null) {
      List<Widget> questionsItems = [];
      answersList.first.questions?.asMap().forEach((key, question) {
        var possibleAnswers = HashMap();

        // inicializando o hasmap de possiveis respostas.
        question.answers?.forEach((element) {
          if(question.answerType == AnswerType.scaled.label) {
            possibleAnswers[element] = {
              0: 3,
              1: 3,
              2: 3,
              3: 3,
              4: 3,
            };
          } else {
            possibleAnswers[element] = 0;
          }
        });

        // separando as repostas por tipo.
        List<SingleAnswerModel>? singleAnswerList = [];
        List<SingleAnswerModel>? scaledAnswersList = [];
        List<SingleAnswerModel>? multipleAnswersList = [];
        answersList.asMap().forEach((key, value) {
          value.answers?.asMap().forEach((key, value) {
            if(value.singleAnswer != null) {
              singleAnswerList.add(value);
            }
            if(value.scaledAnswers != null){
              scaledAnswersList.add(value);
            }
            if(value.multipleAnswers != null) {
              multipleAnswersList.add(value);
            }
          });
        });

        // de acordo com o tipo da resposta, calculando valor do hasmap.
        if(question.answerType == AnswerType.singleOption.label) {
          singleAnswerList.asMap().forEach((key, answer) {
            possibleAnswers[answer.singleAnswer]++;
          });
        }
        if(question.answerType == AnswerType.scaled.label) {
        }
        if(question.answerType == AnswerType.multipleOption.label) {
          multipleAnswersList.asMap().forEach((key, answer) {
            answer.multipleAnswers?.asMap().forEach((index, value) {
              var key = possibleAnswers.keys.elementAt(index);
              if(value) {
                possibleAnswers[key]++;
              }
            });
          });
        }

        questionsItems.add(_questionCard(question, possibleAnswers));
      });
      return questionsItems;
    }
    return Container();
  }

  _questionCard(QuestionModel questionModel, HashMap repostas) {
    return LayoutBuilder(
        builder: (context, constraints) {
          return SizedBox(
            width: constraints.maxWidth * .9,
            child: Card(
              child: Column(
                children: [
                  _chooseChartType(questionModel, repostas),
                ],
              ),
            ),
          );
        }
    );
  }

  _chooseChartType(QuestionModel questionModel, HashMap repostas) {
    if(questionModel.answerType == AnswerType.scaled.label) {
      return _scaleAnswersChartList(questionModel, repostas);
    } else {
      return _singleAndMultipleAnswersChart(questionModel, repostas);
    }
  }

  _singleAndMultipleAnswersChart(QuestionModel questionModel, HashMap repostas) {
    return SfCartesianChart(
      plotAreaBorderWidth: 0,
      title: ChartTitle(
          text: 'Questão: ${questionModel.question} - do tipo: ${questionModel.answerType}'
      ),
      primaryXAxis: CategoryAxis(
        majorGridLines: const MajorGridLines(width: 0),
      ),
      primaryYAxis: NumericAxis(
          axisLine: const AxisLine(width: 0),
          labelFormat: '{value}',
          majorTickLines: const MajorTickLines(size: 0)),
      series: _getDefaultColumnSeries(repostas),
      tooltipBehavior: TooltipBehavior(enable: true, header: '', canShowMarker: false),
    );
  }

  _scaleAnswersChartList(QuestionModel questionModel, HashMap repostas) {
    List<Widget> graficos = [];
    repostas.forEach((key, value) {
      graficos.add(_scaleAnswersChart(key, value));
    });

    return Column(
      children: [
        Text('Questão: ${questionModel.question} - do tipo: ${questionModel.answerType}'),
        ...graficos,
      ],
    );
  }

  _scaleAnswersChart(String title, HashMap repostas) {
    return SfCartesianChart(
      plotAreaBorderWidth: 0,
      title: ChartTitle(
          text: title
      ),
      primaryXAxis: CategoryAxis(
        majorGridLines: const MajorGridLines(width: 0),
      ),
      primaryYAxis: NumericAxis(
          axisLine: const AxisLine(width: 0),
          labelFormat: '{value}',
          majorTickLines: const MajorTickLines(size: 0)),
      series: _getDefaultColumnSeries(repostas),
      tooltipBehavior: TooltipBehavior(enable: true, header: '', canShowMarker: false),
    );
  }

  List<ColumnSeries<ChartSampleData, String>> _getDefaultColumnSeries(HashMap repostas) {

    List<ChartSampleData> dataSource = [];

    repostas.forEach((key, value) {
      dataSource.add(ChartSampleData(x: key.toString(), y: value));
    });

    return <ColumnSeries<ChartSampleData, String>>[
      ColumnSeries<ChartSampleData, String>(
        dataSource: dataSource,
        xValueMapper: (ChartSampleData sales, _) => sales.x as String,
        yValueMapper: (ChartSampleData sales, _) => sales.y,
        dataLabelSettings: const DataLabelSettings(
            isVisible: true, textStyle: TextStyle(fontSize: 10)),
      )
    ];
  }

}

class ChartSampleData {
  String x;
  double y;
  ChartSampleData({
    required this.x,
    required this.y,
  });
}

