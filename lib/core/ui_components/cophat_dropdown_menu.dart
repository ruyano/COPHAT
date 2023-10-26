import 'package:cophat/core/question_type.dart';
import 'package:flutter/material.dart';

class CophatDropdownMenu extends StatefulWidget {

  final String labelText;
  final List<String> items;
  final ValueNotifier<String?>? controller;

  const CophatDropdownMenu({
    required this.labelText,
    required this.items,
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
            width: constraints.maxWidth * .9,
            child: DropdownButtonFormField(
              decoration: InputDecoration(
                border: const OutlineInputBorder(),
                labelText: widget.labelText,
              ),
              value: dropdownValue,
              onChanged: (String? texto) {
                // This is called when the user selects an item.
                setState(() {
                  widget.controller?.value = texto;
                  dropdownValue = texto!;
                });
              },
              items: widget.items.map<DropdownMenuItem<String>>((String value) {
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
