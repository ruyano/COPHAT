import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/{{bloc.snakeCase()}}_bloc.dart';
import '{{bloc.snakeCase()}}_injection_container.dart' as di;

class {{bloc.pascalCase()}}Page extends StatelessWidget {

  const {{bloc.pascalCase()}}Page({super.key});

  @override
  Widget build(BuildContext context) {
    di.init();

    return BlocProvider<{{bloc.pascalCase()}}Bloc>(
      create: (_) => di.sl<{{bloc.pascalCase()}}Bloc>()..add(
        const {{bloc.pascalCase()}}Loading() as {{bloc.pascalCase()}}Event,
      ),
      child: BlocBuilder<{{bloc.pascalCase()}}Bloc, {{bloc.pascalCase()}}State>(
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
        '{{bloc.pascalCase()}}',
        maxFontSize: 16.0,
        textScaleFactor: 1.0,
      ),
      actions: <Widget>[
        IconButton(
          icon: const Icon(Icons.close),
          onPressed: () => Navigator.of(context).pop(null),
        ),
      ],
      leading: new Container(),
    );
  }

  _setupBody(BuildContext context, {{bloc.pascalCase()}}State state) {
    {{#states}}
    if(state is {{bloc.pascalCase()}}{{name.pascalCase()}}) {
      //TODO - exibir tela para o estado de {{name.pascalCase()}}
      return Container();
    }
    {{/states}}
    return Container();
  }
}
