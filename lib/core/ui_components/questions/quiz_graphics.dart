import 'dart:math';

import 'package:cophat/core/question_type.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../models/answers_model.dart';

class QuizGraphics extends StatelessWidget {

  final String? title;
  final AnswersModel answersModel;

  const QuizGraphics({
    super.key,
    this.title,
    required this.answersModel,
  });

  @override
  Widget build(BuildContext context) {

    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
    ]);

    Random random = Random();
    int compreensaoDoenca = random.nextInt(5) + 1;
    int internacao = random.nextInt(5) + 1;
    int realizacaoEExitoDoTratamento = random.nextInt(5) + 1;
    int efeitosColaterais = random.nextInt(5) + 1;
    int expectativaDoRetornoAEscola = random.nextInt(5) + 1;

    List<QuizChartData> dataSource = [
      QuizChartData(x: 'Compreensão doença', y: compreensaoDoenca, color: Colors.grey),
      QuizChartData(x: 'Internação', y: internacao, color: Colors.purple),
      QuizChartData(x: 'Realização e êxito do tratamento', y: realizacaoEExitoDoTratamento, color: Colors.green),
      QuizChartData(x: 'Efeitos colaterais', y: efeitosColaterais, color: Colors.yellow),
      QuizChartData(x: 'Expectativa do retorno á escola', y: expectativaDoRetornoAEscola, color: Colors.blue),
    ];

    var seriesVertical = <ColumnSeries<QuizChartData, String>>[
      ColumnSeries<QuizChartData, String>(
        dataSource: dataSource,
        xValueMapper: (QuizChartData sales, _) => sales.x,
        yValueMapper: (QuizChartData sales, _) => sales.y,
        pointColorMapper: (QuizChartData data, _) => data.color,
      )
    ];

    var seriesHorizontal = <ChartSeries<QuizChartData, String>>[
      BarSeries<QuizChartData, String>(
        dataSource: dataSource,
        xValueMapper: (QuizChartData data, _) => data.x,
        yValueMapper: (QuizChartData data, _) => data.y,
        pointColorMapper: (QuizChartData data, _) => data.color,
      ),
    ];

    return SfCartesianChart(
      plotAreaBorderWidth: 0,
      title: ChartTitle(
          text: '${title != null ? '$title -' : ''}${answersModel.date != null ? DateFormat.yMd().format(answersModel.date!) : ''}',
      ),
      primaryXAxis: CategoryAxis(
        majorGridLines: const MajorGridLines(width: 0),
      ),
      primaryYAxis: NumericAxis(
          axisLine: const AxisLine(width: 0),
          labelFormat: '{value}',
          majorTickLines: const MajorTickLines(size: 0)),
      series: seriesHorizontal,
      tooltipBehavior: TooltipBehavior(enable: true, header: '', canShowMarker: false),
    );
  }

}

class QuizChartData {
  String x;
  int y;
  Color? color;
  QuizChartData({
    required this.x,
    required this.y,
    this.color = Colors.black,
  });
}