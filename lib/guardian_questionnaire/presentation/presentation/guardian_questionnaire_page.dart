import 'package:auto_size_text/auto_size_text.dart';
import 'package:cophat/core/nav.dart';
import 'package:cophat/guardian_questionnaire/presentation/presentation/widgets/create_or_update_question.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/ui_components/button_cophat.dart';
import '../../../core/loading_indicator.dart';
import '../../../core/show_error.dart';
import '../../domain/entities/guardian_question_entity.dart';
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
        'Questinário',
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
      //TODO - exibir tela para o estado de Empty
      return Container(
        color: Colors.purple,
      );
    }

    if(state is GuardianQuestionnaireLoading) {
      return const Center(child: LoadingIndicator());
    }

    if(state is GuardianQuestionnaireSuccess) {
      return _successBody(context, state.questionsList);
    }

    if(state is CreateOrUpdateOrDeleteSuccess) {
      BlocProvider.of<GuardianQuestionnaireBloc>(context).add(
          const ReadGuardianQuestionnaireEvent()
      );
      return Container();
    }

    if(state is GuardianQuestionnaireError) {
      showError(context, state.message);
      return Container(
        color: Colors.red,
      );
    }

    return Container();
  }

  _successBody(BuildContext context, List<GuardianQuestionEntity>? questionsList) {
    if(questionsList != null) {
      return Column(
          children:[
            Expanded(
              child: ListView.builder(
                  itemCount: questionsList.length,
                  itemBuilder: (context, index) {
                    return Card(
                        child: ListTile(
                          onTap: () {
                            Nav.push(context, CreateOrUpdateQuestion(
                              questionEntity: questionsList[index],
                              onPressed: (questionModel) {
                                BlocProvider.of<GuardianQuestionnaireBloc>(context).add(
                                    UpdateGuardianQuestionEvent(questionModel: questionModel)
                                );
                              },
                              onDeletePressed: (questionId) {
                                BlocProvider.of<GuardianQuestionnaireBloc>(context).add(
                                    DeleteGuardianQuestionEvent(id: questionId ?? '')
                                );
                              },
                            ));
                          },
                          title: Text(questionsList[index].question ?? '-'),
                          subtitle: Text(questionsList[index].answers.toString() ?? '-'),
                        ));
                  }),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15, bottom: 15),
              child: ButtonCophat(
                text: 'Criar nova pergunta',
                onPressed: () {
                  Nav.push(context, CreateOrUpdateQuestion(
                    onPressed: (questionModel) {
                      BlocProvider.of<GuardianQuestionnaireBloc>(context).add(
                          CreateGuardianQuestionEvent(questionModel: questionModel)
                      );
                    },
                  ));
                },
              ),
            ),
          ]);
    } else {
      return Container();
    }
  }
}
