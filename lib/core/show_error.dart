import 'package:flutter/material.dart';

void showError(BuildContext context, String message, {bool shouldGoBack = true}) {
  WidgetsBinding.instance.addPostFrameCallback((_){
    showDialog(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Erro'),
          content: Text(message),
          actions: <Widget>[
            TextButton(
              child: const Text('OK'),
              onPressed: () {
                int count = 0;
                Navigator.of(context).popUntil((_) => count++ >= (shouldGoBack ? 2 : 1));
              },
            ),
          ],
        );
      },
    );
  });
}