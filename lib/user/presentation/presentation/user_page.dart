import 'package:auto_size_text/auto_size_text.dart';
import 'package:cophat/core/empty_indicator.dart';
import 'package:cophat/core/nav.dart';
import 'package:cophat/user/presentation/presentation/widgets/user_create_or_update.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/ui_components/button_cophat.dart';
import '../../../core/loading_indicator.dart';
import '../../../core/show_error.dart';
import '../../domain/entities/user_entity.dart';
import '../bloc/user_bloc.dart';
import 'user_injection_container.dart' as di;

class UserPage extends StatelessWidget {

  const UserPage({super.key});

  @override
  Widget build(BuildContext context) {
    di.init();

    return BlocProvider<UserBloc>(
      create: (_) => di.sl<UserBloc>()..add(
        const ReadUserEvent(),
      ),
      child: BlocBuilder<UserBloc, UserState>(
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
        'Usuários',
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

  _setupBody(BuildContext context, UserState state) {

    if(state is UserEmpty) {
      return _body(true, context, null);
    }

    if(state is UserLoading) {
      return const Center(child: LoadingIndicator());
    }

    if(state is UserSuccess) {
      return _body(false, context, state.questionsList);
    }

    if(state is CreateOrUpdateOrDeleteSuccess) {
      BlocProvider.of<UserBloc>(context).add(
          const ReadUserEvent()
      );
      return Container();
    }

    if(state is UserError) {
      showError(context, state.message);
      return Container();
    }

    return Container();
  }

  _body(bool isEmpty, BuildContext context, List<UserEntity>? questionsList) {
      return Column(
          children:[
            Expanded(
              child: isEmpty ? const EmptyIndicator() : ListView.builder(
                  itemCount: questionsList?.length,
                  itemBuilder: (context, index) {
                    return Card(
                        child: ListTile(
                          onTap: () {
                            Nav.push(context, UserCreateOrUpdate(
                              userModel: questionsList?[index],
                              onPressed: (questionModel) {
                                BlocProvider.of<UserBloc>(context).add(
                                  UpdateUserEvent(userModel: questionModel)
                                );
                              },
                              onDeletePressed: (questionId) {
                                BlocProvider.of<UserBloc>(context).add(
                                    DeleteUserEvent(id: questionId ?? '')
                                );
                              },
                            ));
                          },
                          title: Text(questionsList?[index].email ?? '-'),
                        ));
                  }),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15, bottom: 15),
              child: ButtonCophat(
                text: 'Criar novo usuário',
                onPressed: () {
                  Nav.push(context, UserCreateOrUpdate(
                    onPressed: (questionModel) {
                      BlocProvider.of<UserBloc>(context).add(
                          CreateUserEvent(userModel: questionModel)
                      );
                    },
                  ));
                },
              ),
            ),
          ]);
  }
}
