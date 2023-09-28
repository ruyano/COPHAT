import 'package:auto_size_text/auto_size_text.dart';
import 'package:cophat/core/nav.dart';
import 'package:cophat/{{featureName.snakeCase()}}/presentation/presentation/widgets/{{featureName.snakeCase()}}_create_or_update_question.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/ui_components/button_cophat.dart';
import '../../../core/loading_indicator.dart';
import '../../../core/show_error.dart';
import '../../domain/entities/{{featureName.snakeCase()}}_entity.dart';
import '../bloc/{{featureName.snakeCase()}}_bloc.dart';
import '{{featureName.snakeCase()}}_injection_container.dart' as di;

class {{featureName.pascalCase()}}Page extends StatelessWidget {

  const {{featureName.pascalCase()}}Page({super.key});

  @override
  Widget build(BuildContext context) {
    di.init();

    return BlocProvider<{{featureName.pascalCase()}}Bloc>(
      create: (_) => di.sl<{{featureName.pascalCase()}}Bloc>()..add(
        const Read{{featureName.pascalCase()}}Event(),
      ),
      child: BlocBuilder<{{featureName.pascalCase()}}Bloc, {{featureName.pascalCase()}}State>(
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

  _setupBody(BuildContext context, {{featureName.pascalCase()}}State state) {

    if(state is {{featureName.pascalCase()}}Empty) {
      //TODO - exibir tela para o estado de Empty
      return Container(
        color: Colors.purple,
      );
    }

    if(state is {{featureName.pascalCase()}}Loading) {
      return const Center(child: LoadingIndicator());
    }

    if(state is {{featureName.pascalCase()}}Success) {
      return _successBody(context, state.questionsList);
    }

    if(state is CreateOrUpdateOrDeleteSuccess) {
      BlocProvider.of<{{featureName.pascalCase()}}Bloc>(context).add(
          const Read{{featureName.pascalCase()}}Event()
      );
      return Container();
    }

    if(state is {{featureName.pascalCase()}}Error) {
      showError(context, state.message);
      return Container(
        color: Colors.red,
      );
    }

    return Container();
  }

  _successBody(BuildContext context, List<{{featureName.pascalCase()}}Entity>? questionsList) {
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
                            Nav.push(context, {{featureName.pascalCase()}}CreateOrUpdateQuestion(
                              {{featureName.camelCase()}}Model: questionsList[index],
                              onPressed: (questionModel) {
                                BlocProvider.of<{{featureName.pascalCase()}}Bloc>(context).add(
                                  Update{{featureName.pascalCase()}}Event(questionModel: questionModel)
                                );
                              },
                              onDeletePressed: (questionId) {
                                BlocProvider.of<{{featureName.pascalCase()}}Bloc>(context).add(
                                    Delete{{featureName.pascalCase()}}Event(id: questionId ?? '')
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
                  Nav.push(context, {{featureName.pascalCase()}}CreateOrUpdateQuestion(
                    onPressed: (questionModel) {
                      BlocProvider.of<{{featureName.pascalCase()}}Bloc>(context).add(
                          Create{{featureName.pascalCase()}}Event(questionModel: questionModel)
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
