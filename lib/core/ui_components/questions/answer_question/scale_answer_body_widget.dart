import 'package:flutter/material.dart';

class ScaleAnswerBodyWidget extends StatefulWidget {

  final String question;
  final List<String> answers;
  final List<ValueNotifier<int?>> controllers;

  ScaleAnswerBodyWidget({
    super.key,
    required this.question,
    required this.answers,
    required this.controllers,
  });

  @override
  State<StatefulWidget> createState() => _ScaleAnswerBodyWidgetState();

}

class _ScaleAnswerBodyWidgetState extends State<ScaleAnswerBodyWidget> {


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
      widget.controllers.add(ValueNotifier<int?>(0));
      list.add(
          _scaleAnswerBody(
              answers[i],
              widget.controllers[i]
          )
      );
    }
    return list;
  }

  _scaleAnswerBody(String answer, ValueNotifier<int?> controller) {
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
          ScaleWidget(controller: controller,),
        ],
      ),
    );
  }

}

class ScaleWidget extends StatefulWidget {

  final ValueNotifier<int?> controller;

  const ScaleWidget({
    super.key,
    required this.controller,
  });

  @override
  State<StatefulWidget> createState() => _ScaleWidgetState();

}

class _ScaleWidgetState extends State<ScaleWidget> {

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ..._listOfAnswers(),
      ],
    );
  }

  _listOfAnswers() {
    var list = <Widget>[];
    for(int i = 0; i < 5 ; i++) {
      list.add(
        Radio(
          value: i,
          groupValue: widget.controller.value,
          onChanged: (value) {
            setState(() {
              widget.controller.value = value;
            });
          },
        ),
      );
    }
    return list;
  }

}