import 'package:cophat/core/show_error.dart';
import 'package:cophat/home/home.dart';
import 'package:cophat/login/presentation/presentation/widgets/login_initial_page_mobile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/loading_indicator.dart';
import '../../../patient/presentation/patient_list/presentation/patient_page.dart';
import '../bloc/login_bloc.dart';
import 'login_injection_container.dart' as di;

class LoginPage extends StatelessWidget {

  const LoginPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    di.init();

    return BlocProvider<LoginBloc>(
      create: (_) => di.sl<LoginBloc>(),
      child: BlocBuilder<LoginBloc, LoginState>(
        builder: (context, state) {
          return SafeArea(
            child: Scaffold(
              body: _setupBody(context, state),
            ),
          );
        },
      ),
    );
  }

  _setupBody(BuildContext context, LoginState state) {

    if(state is LoginInitial) {
      return _loginInitialPage(context);
    }

    if(state is LoginLoading) {
      return const Center(child: LoadingIndicator());
    }

    if(state is AdminLoginSuccess) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const HomePage(),
          ),
        );
      });
    }

    if(state is LoginSuccess) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const PatientPage(isAdmin: false),
          ),
        );
      });
    }

    if(state is LoginError) {
      showError(context, state.message, shouldGoBack: false);
      return _loginInitialPage(context);
    }

    return Container();
  }

  LoginInitialPageMobile _loginInitialPage(BuildContext context) {
    return LoginInitialPageMobile(
      //Listen for the click event
      onLoginPressed: (email, password) {
        print('onLoginPressed $email - $password');
        BlocProvider.of<LoginBloc>(context).add(Login(email: email, password: password));
      },
      onForgotPasswordPressed: () {
        print('I am a onForgotPasswordPressed');
      },
      onCreateAccountPressed: () {
        print('I am a onCreateAccountPressed');
      },
    );
  }
}
