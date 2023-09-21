import 'package:flutter/material.dart';

class TextFieldCophat extends StatelessWidget {

  final String labelText;
  final TextEditingController? controller;

  const TextFieldCophat({
    super.key,
    required this.labelText,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (context, constraints) {
          return SizedBox(
            width: constraints.maxWidth * .9,
            child: TextField(
              controller: controller,
              decoration: InputDecoration(
                border: const OutlineInputBorder(),
                labelText: labelText,
              ),
            ),
          );
        }
    );


  }

}