import 'package:flutter/material.dart';

class ButtonCophat extends StatelessWidget {

  final String text;
  final VoidCallback onPressed;

  const ButtonCophat({
    super.key,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (context, constraints) {
          return SizedBox(
            height: 50,
            width: constraints.maxWidth * .9,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              onPressed: onPressed,
              child: Text(
                text,
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 25
                ),
              ),
            ),
          );
        }
    );


  }

}