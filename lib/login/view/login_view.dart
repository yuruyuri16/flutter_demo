import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_demo/login/cubit/login_cubit.dart';
import 'package:flutter_demo/register/register.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: const [
                _EmailInput(),
                SizedBox(height: 8),
                _PasswordInput(),
                SizedBox(height: 16),
                _LogInButton(),
                _RegisterButton()
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _EmailInput extends StatelessWidget {
  const _EmailInput();

  @override
  Widget build(BuildContext context) {
    return TextField(
      autocorrect: false,
      onChanged: context.read<LoginCubit>().emailChanged,
      decoration: const InputDecoration(
        prefixIcon: Icon(Icons.email),
        labelText: 'Email',
      ),
    );
  }
}

class _PasswordInput extends StatelessWidget {
  const _PasswordInput();

  @override
  Widget build(BuildContext context) {
    return TextField(
      autocorrect: false,
      onChanged: context.read<LoginCubit>().passwordChanged,
      decoration: const InputDecoration(
        prefixIcon: Icon(Icons.lock),
        labelText: 'Password',
      ),
    );
  }
}

class _LogInButton extends StatelessWidget {
  const _LogInButton();

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () => context.read<LoginCubit>().logInWithCredentials(),
      child: const Text('Log in'),
    );
  }
}

class _RegisterButton extends StatelessWidget {
  const _RegisterButton();

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () => Navigator.push(context, RegisterPage.route()),
      child: const Text('Register'),
    );
  }
}
