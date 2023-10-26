import 'package:flutter/material.dart';

class TextFieldCophat extends StatelessWidget {

  final String labelText;
  final TextEditingController? controller;
  final ValueChanged<String>? onChanged;

  const TextFieldCophat({
    super.key,
    required this.labelText,
    this.controller,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (context, constraints) {
          return SizedBox(
            width: constraints.maxWidth * .9,
            child: TextField(
              onChanged: onChanged,
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