import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_demo/register/register.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Register')),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: const [
              _EmailInput(),
              SizedBox(height: 8),
              _PasswordInput(),
              _RegisterButton()
            ],
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
      keyboardType: TextInputType.emailAddress,
      onChanged: context.read<RegisterCubit>().emailChanged,
      decoration: const InputDecoration(labelText: 'Email'),
    );
  }
}

class _PasswordInput extends StatelessWidget {
  const _PasswordInput();

  @override
  Widget build(BuildContext context) {
    return TextField(
      autocorrect: false,
      onChanged: context.read<RegisterCubit>().passwordChanged,
      obscureText: true,
      decoration: const InputDecoration(labelText: 'Password'),
    );
  }
}

class _RegisterButton extends StatelessWidget {
  const _RegisterButton();

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => context.read<RegisterCubit>().register(),
      child: const Text('Register'),
    );
  }
}
