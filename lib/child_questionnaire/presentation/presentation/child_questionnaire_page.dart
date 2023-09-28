import 'package:auto_size_text/auto_size_text.dart';
import 'package:cophat/core/nav.dart';
import 'package:cophat/child_questionnaire/presentation/presentation/widgets/child_questionnaire_create_or_update_question.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/ui_components/button_cophat.dart';
import '../../../core/loading_indicator.dart';
import '../../../core/show_error.dart';
import '../../domain/entities/child_questionnaire_entity.dart';
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
      //TODO - exibir tela para o estado de Empty
      return Container(
        color: Colors.purple,
      );
    }

    if(state is ChildQuestionnaireLoading) {
      return const Center(child: LoadingIndicator());
    }

    if(state is ChildQuestionnaireSuccess) {
      return _successBody(context, state.questionsList);
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

  _successBody(BuildContext context, List<ChildQuestionnaireEntity>? questionsList) {
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
                            Nav.push(context, ChildQuestionnaireCreateOrUpdateQuestion(
                              childQuestionnaireModel: questionsList[index],
                              onPressed: (questionModel) {
                                BlocProvider.of<ChildQuestionnaireBloc>(context).add(
                                  UpdateChildQuestionnaireEvent(questionModel: questionModel)
                                );
                              },
                              onDeletePressed: (questionId) {
                                BlocProvider.of<ChildQuestionnaireBloc>(context).add(
                                    DeleteChildQuestionnaireEvent(id: questionId ?? '')
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
                  Nav.push(context, ChildQuestionnaireCreateOrUpdateQuestion(
                    onPressed: (questionModel) {
                      BlocProvider.of<ChildQuestionnaireBloc>(context).add(
                          CreateChildQuestionnaireEvent(questionModel: questionModel)
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
