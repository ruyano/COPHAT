import 'package:auto_size_text/auto_size_text.dart';
import 'package:cophat/core/nav.dart';
import 'package:cophat/user/data/models/user_model.dart';
import 'package:flutter/material.dart';

import '../../../../core/ui_components/button_cophat.dart';
import '../../../../core/ui_components/switch_cophat.dart';
import '../../../../core/ui_components/text_field_cophat.dart';
import '../../../domain/entities/user_entity.dart';

class UserCreateOrUpdate extends StatelessWidget {

  final UserEntity? userModel;
  final void Function(UserModel guardianQuestionModel) onPressed;
  final void Function(String? questionId)? onDeletePressed;

  UserCreateOrUpdate({
    super.key,
    this.userModel,
    required this.onPressed,
    this.onDeletePressed,
  });

  final _emailTextEditingController = TextEditingController();
  final _passwordTextEditingController = TextEditingController();
  final _switchController = ValueNotifier<bool?>(false);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: _appBar(context),
        body: _setupBody(context),
      ),
    );
  }

  _appBar(BuildContext context) {
    return AppBar(
      centerTitle: true,
      title: const AutoSizeText(
        'Questão',
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

  _setupBody(BuildContext context) {
    return LayoutBuilder(
        builder: (context , constraints) {
          return Container(
              width: constraints.maxWidth,
              child: Column(
                children: [
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 15.0, right: 15.0, top: 15, bottom: 0),
                            child: TextFieldCophat(
                              labelText: 'Email',
                              controller: _emailTextEditingController..text = userModel?.email ?? '',
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 15.0, right: 15.0, top: 15, bottom: 0),
                            child: TextFieldCophat(
                              labelText: 'Senha',
                              controller: _passwordTextEditingController..text = userModel?.password ?? '',
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 15.0, right: 15.0, top: 15, bottom: 0),
                            child: SwitchCophat(
                              labelText: 'Usuário adsministrador',
                              controller: _switchController..value = userModel?.isAdmin ?? false,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 15, bottom: 15),
                    child: ButtonCophat(
                      text: userModel == null ? 'Criar' : 'Atualizar',
                      onPressed: () {
                        onPressed(UserModel(
                          id: userModel?.id,
                          email: _emailTextEditingController.text,
                          password: _passwordTextEditingController.text,
                          isAdmin: _switchController.value,
                        ));
                        Nav.pop(context);
                      },
                    ),
                  ),
                  userModel == null ? Container() : Padding(
                    padding: const EdgeInsets.only(bottom: 15),
                    child: ButtonCophat(
                      text: 'Deletar',
                      onPressed: () {
                        if(onDeletePressed != null) {
                          onDeletePressed!(userModel?.id ?? '');
                        }
                        Nav.pop(context);
                      },
                    ),
                  ),
                ],
              ),
          );
        }
    );
  }

}