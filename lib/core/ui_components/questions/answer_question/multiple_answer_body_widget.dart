import 'package:flutter/material.dart';

import '../../../models/single_answer_model.dart';

class MultipleAnswerBodyWidget extends StatefulWidget {

  final String question;
  final List<String> answers;
  final ValueNotifier<SingleAnswerModel>? controller;

  MultipleAnswerBodyWidget({
    super.key,
    required this.question,
    required this.answers,
    required this.controller,
  });

  @override
  State<StatefulWidget> createState() => _MultipleAnswerBodyWidgetState();

}

class _MultipleAnswerBodyWidgetState extends State<MultipleAnswerBodyWidget> {

  @override
  Widget build(BuildContext context) {

    widget.controller?.value.multipleAnswers ??= [];

    if(widget.controller?.value.multipleAnswers?.isEmpty ?? false) {
      for (int i = 0; i < widget.answers.length; i++) {
        widget.controller?.value.multipleAnswers?.add(false);
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
      list.add(_createCheckbox(answers[i], i));
    }
    return list;
  }

  _createCheckbox(String answer, int position) {
    return Padding(
      padding: const EdgeInsets.only(top: 15),
      child: ListTile(
        title: Text(answer),
        leading: Checkbox(
          value: widget.controller?.value.multipleAnswers?[position] ?? false,
          onChanged: (newValue) {
            setState(() {
              widget.controller?.value.multipleAnswers?[position] = newValue ?? false;
            });
          },
        ),
      ),
    );
  }

}