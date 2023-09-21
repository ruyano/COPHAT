import 'package:flutter/material.dart';

import '../../../data/models/guardian_question_model.dart';

class QuestionWidget extends StatelessWidget {

  final GuardianQuestionModel? questionEntity;

  const QuestionWidget({
    super.key,
    this.questionEntity,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      color: Colors.green,
    );
  }

}