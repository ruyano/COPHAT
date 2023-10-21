import 'package:cophat/core/question_type.dart';
import 'package:flutter/material.dart';

List<String> list = QuestionType.values.map((e) => e.label).toList();

class SwitchCophat extends StatefulWidget {

  final String labelText;
  final ValueNotifier<bool?>? controller;

  const SwitchCophat({
    required this.labelText,
    this.controller,
    super.key
  });

  @override
  State<SwitchCophat> createState() => _SwitchCophatState();
}

class _SwitchCophatState extends State<SwitchCophat> {

  bool? switchValue;

  @override
  Widget build(BuildContext context) {

    if(widget.controller != null &&
        widget.controller?.value != null) {
      switchValue = widget.controller!.value!;
    }

    return LayoutBuilder(
        builder: (context, constraints) {
          return SizedBox(
              width: constraints.maxWidth * .9,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(widget.labelText),
                  Switch(
                      value: switchValue ?? false,
                      onChanged: (value) {
                        setState(() {
                          switchValue = value;
                          widget.controller?.value = value;
                        });
                      }
                  ),
                ],
              )
          );
        }
    );
  }


}
