import 'package:auto_size_text/auto_size_text.dart';
import 'package:cophat/child_questionnaire/presentation/presentation/child_questionnaire_page.dart';
import 'package:cophat/core/nav.dart';
import 'package:cophat/core/ui_components/button_cophat.dart';
import 'package:cophat/user/presentation/presentation/user_page.dart';
import 'package:flutter/material.dart';

import '../guardian_questionnaire/presentation/presentation/guardian_questionnaire_page.dart';
import '../main.dart';
import '../patient/presentation/patient_list/presentation/patient_page.dart';

class HomePage extends StatelessWidget {

  const HomePage({super.key});

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
        'COPHAT',
        maxFontSize: 16.0,
        textScaleFactor: 1.0,
      ),
    );
  }

  _setupBody(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 15, bottom: 15),
            child: ButtonCophat(
              text: 'Gerenciar usuários',
              onPressed: () {
                Nav.push(context, const UserPage());
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 15),
            child: ButtonCophat(
              text: 'Questionário do responsável',
              onPressed: () {
                Nav.push(context, const GuardianQuestionnairePage());
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 15),
            child: ButtonCophat(
              text: 'Questionário da criança',
              onPressed: () {
                Nav.push(context, const ChildQuestionnairePage());
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 15),
            child: ButtonCophat(
              text: 'Pacientes',
              onPressed: () {
                Nav.push(context, const PatientPage(isAdmin: true));
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 15),
            child: ButtonCophat(
              text: 'Sair',
              onPressed: () {
                Nav.pushReplacement(context, const MyApp());
              },
            ),
          ),
        ],
      ),
    );
  }
}
