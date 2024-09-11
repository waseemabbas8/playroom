import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:playroom/core/ui/base/build_context.dart';

import 'bloc/login_bloc.dart';

class LoginPage extends StatelessWidget {
  final LoginBloc loginBloc;

  const LoginPage({super.key, required this.loginBloc});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: BlocProvider(
          create: (context) => loginBloc,
          child: BlocConsumer<LoginBloc, LoginState>(
            listener: (context, state) {
              if (state is LoginError) {
                final snackBar = SnackBar(
                  content: Text(state.message),
                );
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
              }
            },
            builder: (context, state) {
              return Stack(
                children: [
                  _LoginForm(
                    onLoginPressed: (email, password) {
                      context.read<LoginBloc>().add(OnLogin(email, password));
                    },
                  ),
                  if (state is LoginLoading) const Center(child: CircularProgressIndicator()),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}

class _LoginForm extends StatefulWidget {
  final Function(String email, String password) onLoginPressed;

  const _LoginForm({required this.onLoginPressed});

  @override
  State<_LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<_LoginForm> {
  final emailTextController = TextEditingController();
  final passwordTextController = TextEditingController();

  @override
  Widget build(BuildContext context) => Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(
            controller: emailTextController,
            decoration: InputDecoration(
              hintText: context.l10n.email,
            ),
          ),
          const SizedBox(height: 20),
          TextField(
            controller: passwordTextController,
            decoration: InputDecoration(
              hintText: context.l10n.password,
            ),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () =>
                widget.onLoginPressed(emailTextController.text, passwordTextController.text),
            child: Text(context.l10n.login),
          ),
        ],
      );

  @override
  void dispose() {
    emailTextController.dispose();
    passwordTextController.dispose();
    super.dispose();
  }
}
