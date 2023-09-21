import 'package:cophat/core/ui_components/text_field_cophat.dart';
import 'package:flutter/material.dart';

import '../../../../core/ui_components/button_cophat.dart';

class LoginInitialPageMobile extends StatelessWidget {

  final void Function(String, String) onLoginPressed;
  final VoidCallback onForgotPasswordPressed;
  final VoidCallback onCreateAccountPressed;

  LoginInitialPageMobile({
    super.key,
    required this.onLoginPressed,
    required this.onForgotPasswordPressed,
    required this.onCreateAccountPressed,
  });

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context , constraints) {
        var isMobile = constraints.maxWidth < 600;
        if(isMobile) {
          return Column(
            children: [
              Container(
                height: constraints.maxHeight * .4,
                color: Colors.purple,
              ),
              _form(),
            ],
          );
        } else {
          return Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: constraints.maxHeight,
                width: constraints.maxWidth * .6,
                color: Colors.purple,
              ),
              _form(),
            ],
          );
        }
      },
    );
  }

  _form() {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          TextFieldCophat(
            labelText: 'Email',
            controller: _emailController..text = 'ruyano@gmail.com',
          ),
          Container(height: 15,),
          TextFieldCophat(
            labelText: 'Senha',
            controller: _passwordController..text = 'Senha@123',
          ),
          Container(height: 15,),
          ButtonCophat(
            text: 'Login',
            onPressed: () {
              onLoginPressed(
                _emailController.text,
                _passwordController.text,
              );
            },
          ),
        ],
      ),
    );
  }
}