import 'package:flutter/material.dart';

class MultipleAnswerBodyWidget extends StatefulWidget {

  final String question;
  final List<String> answers;

  MultipleAnswerBodyWidget({
    super.key,
    required this.question,
    required this.answers,
  });

  @override
  State<StatefulWidget> createState() => _MultipleAnswerBodyWidgetState();

}

class _MultipleAnswerBodyWidgetState extends State<MultipleAnswerBodyWidget> {

  @override
  Widget build(BuildContext context) {
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
      list.add(_createCheckbox(answers[i]));
    }
    return list;
  }

  _createCheckbox(String answer) {
    return Padding(
      padding: const EdgeInsets.only(top: 15),
      child: ListTile(
        title: Text(answer),
        leading: MultipleAnswerWidget(),
      ),
    );
  }

}

class MultipleAnswerWidget extends StatefulWidget {

  const MultipleAnswerWidget({
    super.key,
  });

  @override
  State<StatefulWidget> createState() => _MultipleAnswerWidgetState();

}

class _MultipleAnswerWidgetState extends State<MultipleAnswerWidget> {

  bool? currentValue = false;

  @override
  Widget build(BuildContext context) {
    return Checkbox(
      value: currentValue,
      onChanged: (newValue) {
        setState(() {
          currentValue = newValue ?? false;
        });
      },
    );
  }

}