import 'package:auto_size_text/auto_size_text.dart';
import 'package:cophat/core/nav.dart';
import 'package:cophat/patient/presentation/patient_list/presentation/widgets/patient_create_or_update.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/empty_indicator.dart';
import '../../../../core/loading_indicator.dart';
import '../../../../core/show_error.dart';
import '../../../../core/ui_components/button_cophat.dart';
import '../../../domain/entities/patient_entity.dart';
import '../bloc/patient_bloc.dart';
import 'patient_injection_container.dart' as di;

class PatientPage extends StatelessWidget {

  const PatientPage({super.key});

  @override
  Widget build(BuildContext context) {
    di.init();

    return BlocProvider<PatientBloc>(
      create: (_) => di.sl<PatientBloc>()..add(
        const ReadPatientEvent(),
      ),
      child: BlocBuilder<PatientBloc, PatientState>(
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
        'Patient',
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

  _setupBody(BuildContext context, PatientState state) {

    if(state is PatientEmpty) {
      return _body(true, context, null);
    }

    if(state is PatientLoading) {
      return const Center(child: LoadingIndicator());
    }

    if(state is PatientSuccess) {
      return _body(false, context, state.patientList);
    }

    if(state is CreateOrUpdateOrDeleteSuccess) {
      BlocProvider.of<PatientBloc>(context).add(
          const ReadPatientEvent()
      );
      return Container();
    }

    if(state is PatientError) {
      showError(context, state.message);
      return Container(
        color: Colors.red,
      );
    }

    return Container();
  }

  _body(bool isEmpty, BuildContext context, List<PatientEntity>? patientsList) {
      return Column(
          children:[
            Expanded(
              child: isEmpty ? const EmptyIndicator() : ListView.builder(
                  itemCount: patientsList?.length,
                  itemBuilder: (context, index) {
                    return Card(
                        child: ListTile(
                          onTap: () {
                            Nav.push(context, PatientCreateOrUpdate(
                              patientModel: patientsList?[index],
                              onPressed: (patientModel) {
                                BlocProvider.of<PatientBloc>(context).add(
                                  UpdatePatientEvent(patientModel: patientModel)
                                );
                              },
                              onDeletePressed: (id) {
                                BlocProvider.of<PatientBloc>(context).add(
                                    DeletePatientEvent(id: id ?? '')
                                );
                              },
                            ));
                          },
                          title: Text(patientsList?[index].question ?? '-'),
                          subtitle: Text(patientsList?[index].answers.toString() ?? '-'),
                        ));
                  }),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15, bottom: 15),
              child: ButtonCophat(
                text: 'Criar novo Patient',
                onPressed: () {
                  Nav.push(context, PatientCreateOrUpdate(
                    onPressed: (patientModel) {
                      BlocProvider.of<PatientBloc>(context).add(
                          CreatePatientEvent(patientModel: patientModel)
                      );
                    },
                  ));
                },
              ),
            ),
          ]);
  }
}
