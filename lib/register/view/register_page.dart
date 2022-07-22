import 'package:authentication_repository/authentication_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_demo/register/register.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  static Route<void> route() =>
      MaterialPageRoute(builder: (_) => const RegisterPage());

  @override
  Widget build(BuildContext context) {
    final authRepository = context.read<AuthenticationRepository>();
    return BlocProvider(
      create: (_) => RegisterCubit(authRepository),
      child: const RegisterView(),
    );
  }
}
