import 'package:auto_size_text/auto_size_text.dart';
import 'package:cophat/core/nav.dart';
import 'package:cophat/family/presentation/presentation/widgets/family_create_or_update_question.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/ui_components/button_cophat.dart';
import '../../../core/loading_indicator.dart';
import '../../../core/show_error.dart';
import '../../domain/entities/family_entity.dart';
import '../bloc/family_bloc.dart';
import 'family_injection_container.dart' as di;

class FamilyPage extends StatelessWidget {

  const FamilyPage({super.key});

  @override
  Widget build(BuildContext context) {
    di.init();

    return BlocProvider<FamilyBloc>(
      create: (_) => di.sl<FamilyBloc>()..add(
        const ReadFamilyEvent(),
      ),
      child: BlocBuilder<FamilyBloc, FamilyState>(
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
        'Famílias',
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

  _setupBody(BuildContext context, FamilyState state) {

    if(state is FamilyEmpty) {
      //TODO - exibir tela para o estado de Empty
      return Container(
        color: Colors.purple,
      );
    }

    if(state is FamilyLoading) {
      return const Center(child: LoadingIndicator());
    }

    if(state is FamilySuccess) {
      return _successBody(context, state.questionsList);
    }

    if(state is CreateOrUpdateOrDeleteSuccess) {
      BlocProvider.of<FamilyBloc>(context).add(
          const ReadFamilyEvent()
      );
      return Container();
    }

    if(state is FamilyError) {
      showError(context, state.message);
      return Container(
        color: Colors.red,
      );
    }

    return Container();
  }

  _successBody(BuildContext context, List<FamilyEntity>? questionsList) {
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
                            Nav.push(context, FamilyCreateOrUpdateQuestion(
                              familyModel: questionsList[index],
                              onPressed: (questionModel) {
                                BlocProvider.of<FamilyBloc>(context).add(
                                  UpdateFamilyEvent(questionModel: questionModel)
                                );
                              },
                              onDeletePressed: (questionId) {
                                BlocProvider.of<FamilyBloc>(context).add(
                                    DeleteFamilyEvent(id: questionId ?? '')
                                );
                              },
                            ));
                          },
                          title: Text(questionsList[index].mothersName ?? '-'),
                          subtitle: Text(questionsList[index].fathersName ?? '-'),
                        ));
                  }),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15, bottom: 15),
              child: ButtonCophat(
                text: 'Adicionar nova família',
                onPressed: () {
                  Nav.push(context, FamilyCreateOrUpdateQuestion(
                    onPressed: (questionModel) {
                      BlocProvider.of<FamilyBloc>(context).add(
                          CreateFamilyEvent(questionModel: questionModel)
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
