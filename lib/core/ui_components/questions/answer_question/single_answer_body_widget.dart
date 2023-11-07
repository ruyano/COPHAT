import 'package:flutter/material.dart';

import '../../../models/single_answer_model.dart';

class SingleAnswerBodyWidget extends StatefulWidget {

  final String question;
  final List<String> answers;
  final ValueNotifier<SingleAnswerModel>? controller;

  SingleAnswerBodyWidget({
    super.key,
    required this.question,
    required this.answers,
    required this.controller,
  });

  @override
  State<StatefulWidget> createState() => _SingleAnswerBodyWidgetState();

}

class _SingleAnswerBodyWidgetState extends State<SingleAnswerBodyWidget> {

  String? currentOption = '';

  @override
  Widget build(BuildContext context) {

    currentOption = widget.controller?.value.singleAnswer ?? '';

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
      list.add(_singleAnswerBody(answers[i]));
    }
    return list;
  }

  _singleAnswerBody(String answer) {
    return Padding(
      padding: const EdgeInsets.only(top: 15),
      child: ListTile(
        title: Text(answer),
        leading: Radio(
          value: answer,
          groupValue: currentOption,
          onChanged: (value) {
            setState(() {
              widget.controller?.value.singleAnswer = value;
              currentOption = value;
            });
          },
        ),
      ),
    );
  }


}