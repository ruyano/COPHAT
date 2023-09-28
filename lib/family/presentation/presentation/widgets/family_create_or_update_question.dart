import 'package:auto_size_text/auto_size_text.dart';
import 'package:cophat/core/nav.dart';
import 'package:cophat/family/data/models/family_model.dart';
import 'package:flutter/material.dart';

import '../../../../core/ui_components/button_cophat.dart';
import '../../../domain/entities/family_entity.dart';

class FamilyCreateOrUpdateQuestion extends StatelessWidget {

  final FamilyEntity? familyModel;
  final void Function(FamilyModel guardianQuestionModel) onPressed;
  final void Function(String? questionId)? onDeletePressed;

  FamilyCreateOrUpdateQuestion({
    super.key,
    this.familyModel,
    required this.onPressed,
    this.onDeletePressed,
  });

  final _mothersNameTextEditingController = TextEditingController();
  final _mothersProfessionTextEditingController = TextEditingController();
  final _fathersNameTextEditingController = TextEditingController();
  final _fathersProfessionTextEditingController = TextEditingController();
  final _familyReligionTextEditingController = TextEditingController();

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
        'Família',
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
    return Column(
      children: [
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(
                      left: 15.0, right: 15.0, top: 15, bottom: 0),
                  child: TextField(
                    controller: _mothersNameTextEditingController..text = familyModel?.mothersName ?? '',
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Nome da mãe',
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 15.0, right: 15.0, top: 15, bottom: 0),
                  child: TextField(
                    controller: _mothersProfessionTextEditingController..text = familyModel?.mothersProfession ?? '',
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Profissão da mãe',
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 15.0, right: 15.0, top: 15, bottom: 0),
                  child: TextField(
                    controller: _fathersNameTextEditingController..text = familyModel?.fathersName ?? '',
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Nome do pai',
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 15.0, right: 15.0, top: 15, bottom: 0),
                  child: TextField(
                    controller: _fathersProfessionTextEditingController..text = familyModel?.fathersProfession ?? '',
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Profissão do pai',
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 15.0, right: 15.0, top: 15, bottom: 0),
                  child: TextField(
                    controller: _familyReligionTextEditingController..text = familyModel?.familyReligion ?? '',
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Religião da família',
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 15, bottom: 15),
          child: ButtonCophat(
            text: familyModel == null ? 'Criar' : 'Atualizar',
            onPressed: () {
              onPressed(FamilyModel(
                id: familyModel?.id,
                mothersName: _mothersNameTextEditingController.text,
                mothersProfession: _mothersProfessionTextEditingController.text,
                fathersName: _fathersNameTextEditingController.text,
                fathersProfession: _fathersProfessionTextEditingController.text,
                familyReligion: _familyReligionTextEditingController.text,
              ));
              Nav.pop(context);
            },
          ),
        ),
        familyModel == null ? Container() : Padding(
          padding: const EdgeInsets.only(bottom: 15),
          child: ButtonCophat(
            text: 'Deletar',
            onPressed: () {
              if(onDeletePressed != null) {
                onDeletePressed!(familyModel?.id ?? '');
              }
              Nav.pop(context);
            },
          ),
        ),
      ],
    );
  }

}