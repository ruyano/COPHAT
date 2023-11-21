import 'package:auto_size_text/auto_size_text.dart';
import 'package:cophat/core/ui_components/questions/quiz_graphics.dart';
import 'package:flutter/material.dart';

import '../../models/answers_model.dart';

class ShowSingleGraphic extends StatelessWidget {

  final AnswersModel answersModel;

  const ShowSingleGraphic({
    super.key,
    required this.answersModel,
  });

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
        'Gráfico',
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
              Container(height: 18,),
                SizedBox(
                  width: constraints.maxWidth * .9,
                  child: Card(
                    child: QuizGraphics(answersModel: answersModel),
                  ),
                ),
            ],
          ),
        );
      },
    );
  }

}