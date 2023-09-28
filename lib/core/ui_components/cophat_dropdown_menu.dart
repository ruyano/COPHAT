import 'package:cophat/core/question_type.dart';
import 'package:flutter/material.dart';

List<String> list = QuestionType.values.map((e) => e.label).toList();

class CophatDropdownMenu extends StatefulWidget {

  final ValueNotifier<String?>? controller;

  const CophatDropdownMenu({
    this.controller,
    super.key
  });

  @override
  State<CophatDropdownMenu> createState() => _CophatDropdownMenuState();
}

class _CophatDropdownMenuState extends State<CophatDropdownMenu> {

  String? dropdownValue;

  @override
  Widget build(BuildContext context) {

    if(widget.controller != null &&
        widget.controller?.value != null &&
        widget.controller!.value!.isNotEmpty) {
      dropdownValue = widget.controller!.value!;
    }

    return LayoutBuilder(
        builder: (context, constraints) {
          return SizedBox(
            width: constraints.maxWidth,
            child: DropdownButtonFormField(
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Tipo da questão'
              ),
              value: dropdownValue,
              onChanged: (String? texto) {
                // This is called when the user selects an item.
                setState(() {
                  widget.controller?.value = texto;
                  dropdownValue = texto!;
                });
              },
              items: list.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value)
                );
              }).toList(),
            ),
          );
        }
    );
  }


}
