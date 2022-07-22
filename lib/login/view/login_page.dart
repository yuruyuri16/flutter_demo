import 'package:authentication_repository/authentication_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_demo/login/login.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  static Page<void> page() => const MaterialPage(child: LoginPage());

  @override
  Widget build(BuildContext context) {
    final authenticationRepository = context.read<AuthenticationRepository>();
    return BlocProvider(
      create: (_) => LoginCubit(authenticationRepository),
      child: const LoginView(),
    );
  }
}
