import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TextFieldCophat extends StatelessWidget {

  final String labelText;
  final TextEditingController? controller;
  final ValueChanged<String>? onChanged;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputFormatters;

  const TextFieldCophat({
    super.key,
    required this.labelText,
    this.controller,
    this.onChanged,
    this.keyboardType,
    this.inputFormatters,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (context, constraints) {
          return SizedBox(
            width: constraints.maxWidth * .9,
            child: TextField(
              keyboardType: keyboardType,
              inputFormatters: inputFormatters,
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