import 'package:auto_size_text/auto_size_text.dart';
import 'package:cophat/core/models/sub_question_model.dart';
import 'package:cophat/core/nav.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/ui_components/button_cophat.dart';
import '../../../core/empty_indicator.dart';
import '../../../core/entities/question_entity.dart';
import '../../../core/loading_indicator.dart';
import '../../../core/models/question_model.dart';
import '../../../core/show_error.dart';
import '../../../core/ui_components/question_card.dart';
import '../../../core/ui_components/questions/question_form/request_question_page.dart';
import '../bloc/child_questionnaire_bloc.dart';
import 'child_questionnaire_injection_container.dart' as di;

class ChildQuestionnairePage extends StatelessWidget {

  const ChildQuestionnairePage({super.key});

  @override
  Widget build(BuildContext context) {
    di.init();

    return BlocProvider<ChildQuestionnaireBloc>(
      create: (_) => di.sl<ChildQuestionnaireBloc>()..add(
        const ReadChildQuestionnaireEvent(),
      ),
      child: BlocBuilder<ChildQuestionnaireBloc, ChildQuestionnaireState>(
        builder: (context, state) {
          return SafeArea(
            child: Scaffold(
              appBar: _appBar(context),
              body: _setupBody(context, state),
            ),
          );
        },
      ),
    );
  }

  _appBar(BuildContext context) {
    return AppBar(
      centerTitle: true,
      title: const AutoSizeText(
        'Questinário da criança',
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

  _setupBody(BuildContext context, ChildQuestionnaireState state) {

    if(state is ChildQuestionnaireEmpty) {
      return _body(true, context, null);
    }

    if(state is ChildQuestionnaireLoading) {
      return const Center(child: LoadingIndicator());
    }

    if(state is ChildQuestionnaireSuccess) {
      return _body(false, context, state.questionsList);
    }

    if(state is CreateOrUpdateOrDeleteSuccess) {
      BlocProvider.of<ChildQuestionnaireBloc>(context).add(
          const ReadChildQuestionnaireEvent()
      );
      return Container();
    }

    if(state is ChildQuestionnaireError) {
      showError(context, state.message);
      return Container(
        color: Colors.red,
      );
    }

    return Container();
  }

  _body(bool isEmpty, BuildContext context, List<QuestionEntity>? questionsList) {
    return LayoutBuilder(
      builder: (context , constraints) {
        return SizedBox(
          width: constraints.maxWidth,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: isEmpty ? const EmptyIndicator() : SizedBox(
                  width: constraints.maxWidth * .9,
                  child: ListView.builder(
                      itemCount: questionsList?.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(top: 15),
                          child: QuestionCard(
                            question: questionsList?[index].question ?? '-',
                            answers: questionsList?[index].answers ?? List.empty(),
                            subQuestion: questionsList?[index].subQuestion?.question,
                            subAnswers: questionsList?[index].subQuestion?.answers,
                            onTap: () {
                              Nav.push(context, RequestQuestionPage(
                                questionModel: questionsList?[index] as QuestionModel,
                                onCreateOrUpdate: (questionEntity) {
                                  BlocProvider.of<ChildQuestionnaireBloc>(context).add(
                                      UpdateChildQuestionnaireEvent(questionModel: questionEntity as QuestionModel)
                                  );
                                },
                                onDeletePressed: (questionId) {
                                  BlocProvider.of<ChildQuestionnaireBloc>(context).add(
                                      DeleteChildQuestionnaireEvent(id: questionId ?? '')
                                  );
                                },
                              ));
                            },
                          ),
                        );
                      }),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 15, bottom: 15),
                child: ButtonCophat(
                  text: 'Criar nova pergunta',
                  onPressed: () {
                    Nav.push(context, RequestQuestionPage(
                      onCreateOrUpdate: (questionModel) {
                        BlocProvider.of<ChildQuestionnaireBloc>(context).add(
                            CreateChildQuestionnaireEvent(questionModel: questionModel)
                        );
                      },
                    ));
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
