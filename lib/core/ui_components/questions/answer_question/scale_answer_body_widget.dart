import 'package:flutter/material.dart';

import '../../../models/single_answer_model.dart';

class ScaleAnswerBodyWidget extends StatefulWidget {

  final String question;
  final List<String> answers;
  final ValueNotifier<SingleAnswerModel>? controller;

  ScaleAnswerBodyWidget({
    super.key,
    required this.question,
    required this.answers,
    required this.controller,
  });

  @override
  State<StatefulWidget> createState() => _ScaleAnswerBodyWidgetState();

}

class _ScaleAnswerBodyWidgetState extends State<ScaleAnswerBodyWidget> {


  @override
  Widget build(BuildContext context) {

    widget.controller?.value.scaledAnswers ??= [];

    if(widget.controller?.value.scaledAnswers?.isEmpty ?? false) {
      for (int i = 0; i < widget.answers.length; i++) {
        widget.controller?.value.scaledAnswers?.add(-1);
      }
    }

    return  Expanded(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 15),
              child: Text(widget.question),
            ),
            ..._listOfAnswers(widget.answers),
          ],
        ),
      ),
    );
  }

  _listOfAnswers(List<String> answers) {
    var list = <Widget>[];
    for(int i = 0; i < answers.length ; i++) {
      list.add(
          _scaleAnswerBody(
            answers[i],
            i,
          )
      );
    }
    return list;
  }

  _scaleAnswerBody(String answer, int position) {
    return Padding(
      padding: const EdgeInsets.only(top: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: 100,
            child: Text(answer),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ..._listOfOptions(position),
            ],
          ),
        ],
      ),
    );
  }

  _listOfOptions(int position) {
    var list = <Widget>[];
    for(int i = 0; i < 5 ; i++) {
      list.add(
        Radio(
          value: i,
          groupValue: widget.controller?.value.scaledAnswers?[position],
          onChanged: (value) {
            setState(() {
              widget.controller?.value.scaledAnswers?[position] = value ?? -1;
            });
          },
        ),
      );
    }
    return list;
  }

}