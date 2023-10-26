import 'package:flutter/material.dart';

class QuestionCard extends StatelessWidget {

  final String question;
  final List<String> answers;
  final String? subQuestion;
  final List<String>? subAnswers;
  final GestureTapCallback onTap;

  QuestionCard({
    required this.question,
    required this.answers,
    this.subQuestion,
    this.subAnswers,
    required this.onTap,
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
                    ListTile(
                      onTap: onTap,
                      title: Text(question ?? '-'),
                      subtitle: Text(answers.toString() ?? '-'),
                    ),
                    subQuestion != null ? ListTile(
                      onTap: onTap,
                      title: Text(subQuestion ?? '-'),
                      subtitle: Text(subAnswers.toString() ?? '-'),
                    ) : Container(),
                  ],
                ),
            ),
          );
        }
    );
  }}