import 'package:auto_size_text/auto_size_text.dart';
import 'package:cophat/core/nav.dart';
import 'package:cophat/core/ui_components/question_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/ui_components/button_cophat.dart';
import '../../../core/empty_indicator.dart';
import '../../../core/entities/question_entity.dart';
import '../../../core/loading_indicator.dart';
import '../../../core/models/question_model.dart';
import '../../../core/show_error.dart';
import '../../../core/ui_components/questions/question_form/request_question_page.dart';
import '../bloc/guardian_questionnaire_bloc.dart';
import 'guardian_questionnaire_injection_container.dart' as di;

class GuardianQuestionnairePage extends StatelessWidget {

  const GuardianQuestionnairePage({super.key});

  @override
  Widget build(BuildContext context) {
    di.init();

    return BlocProvider<GuardianQuestionnaireBloc>(
      create: (_) => di.sl<GuardianQuestionnaireBloc>()..add(
        const ReadGuardianQuestionnaireEvent(),
      ),
      child: BlocBuilder<GuardianQuestionnaireBloc, GuardianQuestionnaireState>(
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
        'Questinário do responsável',
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

  _setupBody(BuildContext context, GuardianQuestionnaireState state) {

    if(state is GuardianQuestionnaireEmpty) {
      return _body(true, context, null);
    }

    if(state is GuardianQuestionnaireLoading) {
      return const Center(child: LoadingIndicator());
    }

    if(state is GuardianQuestionnaireSuccess) {
      return _body(false, context, state.questionsList);
    }

    if(state is CreateOrUpdateOrDeleteSuccess) {
      BlocProvider.of<GuardianQuestionnaireBloc>(context).add(
          const ReadGuardianQuestionnaireEvent()
      );
      return Container();
    }

    if(state is GuardianQuestionnaireError) {
      showError(context, state.message, shouldGoBack: true);
      return Container();
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
                            question: '${(questionsList?[index].position ?? 0) + 1} - ${questionsList?[index].question}',
                            answers: questionsList?[index].answers ?? List.empty(),
                            subQuestion: questionsList?[index].subQuestion?.question,
                            subAnswers: questionsList?[index].subQuestion?.answers,
                            onTap: () {
                              Nav.push(context, RequestQuestionPage(
                                questionModel: questionsList?[index] as QuestionModel,
                                onCreateOrUpdate: (questionEntity) {
                                  BlocProvider.of<GuardianQuestionnaireBloc>(context).add(
                                      UpdateGuardianQuestionEvent(questionModel: questionsList?[index] as QuestionModel)
                                  );
                                },
                                onDeletePressed: (questionId) {
                                  BlocProvider.of<GuardianQuestionnaireBloc>(context).add(
                                      DeleteGuardianQuestionEvent(id: questionId ?? '')
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
                        BlocProvider.of<GuardianQuestionnaireBloc>(context).add(
                            CreateGuardianQuestionEvent(questionModel: questionModel)
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
