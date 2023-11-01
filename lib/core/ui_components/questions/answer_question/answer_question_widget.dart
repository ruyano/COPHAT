import 'package:flutter/material.dart';

class AnswerQuestionWidget extends StatefulWidget {

  final String question;
  final List<String> answers;

  const AnswerQuestionWidget({
    super.key,
    required this.question,
    required this.answers,
  });

  @override
  State<StatefulWidget> createState() => _AnswerQuestionWidgetState();

}

class _AnswerQuestionWidgetState extends State<AnswerQuestionWidget> {

  String? currentOption = '';

  @override
  Widget build(BuildContext context) {
    return  Expanded(
      child: SingleChildScrollView(
        child: Column(
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
        Padding(
          padding: const EdgeInsets.only(top: 15),
          child: ListTile(
            title: Text(answers[i] ?? '-'),
            leading: Radio(
              value: answers[i],
              groupValue: currentOption,
              onChanged: (value) {
                setState(() {
                  currentOption = value;
                });
              },
            ),
          ),
        ),
      );
    }
    return list;
  }


}