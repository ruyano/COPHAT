import 'package:flutter/material.dart';

class Nav {
  static push(
      BuildContext context,
      Widget screen,
      ) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => screen,
        ),
      );
    });
  }

  static pushReplacement(BuildContext context, Widget screen) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => screen,
      ),
    );
  }

  static pop(BuildContext context, {int screens=0}) {
    if(screens==0){
      Navigator.pop(context);
    }else{
      int count = 0;
      Navigator.of(context).popUntil((_) => count++ >= screens);
    }
  }
}