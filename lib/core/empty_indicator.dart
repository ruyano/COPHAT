import 'package:flutter/material.dart';

class EmptyIndicator extends StatelessWidget {

  const EmptyIndicator({super.key});

  @override
  Widget build(BuildContext context) => const Center(
        child: Text('Não foi encontrado nenhum registro')
      );
}
