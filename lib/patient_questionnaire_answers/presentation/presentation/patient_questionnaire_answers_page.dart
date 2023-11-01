import 'package:auto_size_text/auto_size_text.dart';
import 'package:cophat/core/nav.dart';
import 'package:cophat/patient_questionnaire_answers/presentation/presentation/widgets/patient_questionnaire_answers_create_or_update.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/ui_components/button_cophat.dart';
import '../../../core/loading_indicator.dart';
import '../../../core/empty_indicator.dart';
import '../../../core/show_error.dart';
import '../../../core/ui_components/questions/answer_question/answer_question_page.dart';
import '../../../core/ui_components/questions/entities/question_entity.dart';
import '../../domain/entities/patient_questionnaire_answers_entity.dart';
import '../bloc/patient_questionnaire_answers_bloc.dart';
import 'patient_questionnaire_answers_injection_container.dart' as di;

class PatientQuestionnaireAnswersPage extends StatelessWidget {

  const PatientQuestionnaireAnswersPage({super.key});

  @override
  Widget build(BuildContext context) {
    di.init();

    return BlocProvider<PatientQuestionnaireAnswersBloc>(
      create: (_) => di.sl<PatientQuestionnaireAnswersBloc>()..add(
        const ReadPatientQuestionnaireAnswersEvent(),
      ),
      child: BlocBuilder<PatientQuestionnaireAnswersBloc, PatientQuestionnaireAnswersState>(
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
        'Respostas do questionário do paciente',
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

  _setupBody(BuildContext context, PatientQuestionnaireAnswersState state) {

    if(state is PatientQuestionnaireAnswersEmpty) {
      return _body(true, context, null);
    }

    if(state is PatientQuestionnaireAnswersLoading) {
      return const Center(child: LoadingIndicator());
    }

    if(state is PatientQuestionnaireAnswersSuccess) {
      return _body(false, context, state.patientQuestionnaireAnswersList);
    }

    if(state is CreateOrUpdateOrDeleteSuccess) {
      BlocProvider.of<PatientQuestionnaireAnswersBloc>(context).add(
          const ReadPatientQuestionnaireAnswersEvent()
      );
      return Container();
    }

    if(state is PatientQuestionnaireAnswersError) {
      showError(context, state.message);
      return Container(
        color: Colors.red,
      );
    }

    if(state is ChildQuestionnaireSuccess) {
      Nav.push(context, AnswerQuestionPage(
        questionsList: state.questionsList!,
        onCreateOrUpdate: (patientQuestionnaireAnswersModel) {
          // TODO - criar resposta do questionário
        },
      ));
    }

    return Container();
  }

  _body(bool isEmpty, BuildContext context, List<PatientQuestionnaireAnswersEntity>? patientQuestionnaireAnswersList) {
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
                      itemCount: patientQuestionnaireAnswersList?.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(top: 15),
                          child: Card(
                              child: ListTile(
                                onTap: () {
                                  Nav.push(context, PatientQuestionnaireAnswersCreateOrUpdate(
                                    patientQuestionnaireAnswersModel: patientQuestionnaireAnswersList?[index],
                                    onPressed: (patientQuestionnaireAnswersModel) {
                                      BlocProvider.of<PatientQuestionnaireAnswersBloc>(context).add(
                                          UpdatePatientQuestionnaireAnswersEvent(patientQuestionnaireAnswersModel: patientQuestionnaireAnswersModel)
                                      );
                                    },
                                    onDeletePressed: (id) {
                                      BlocProvider.of<PatientQuestionnaireAnswersBloc>(context).add(
                                          DeletePatientQuestionnaireAnswersEvent(id: id ?? '')
                                      );
                                    },
                                  ));
                                },
                                title: Text(patientQuestionnaireAnswersList?[index].question ?? '-'),
                                subtitle: Text(patientQuestionnaireAnswersList?[index].answers.toString() ?? '-'),
                              )),
                        );
                      }),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 15, bottom: 15),
                child: ButtonCophat(
                  text: 'Responder questionário',
                  onPressed: () {
                    BlocProvider.of<PatientQuestionnaireAnswersBloc>(context).add(
                        const ReadChildQuestionnaireEvent()
                    );
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
