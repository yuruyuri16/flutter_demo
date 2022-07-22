part of 'register_cubit.dart';

enum RegisterStatus {
  initial,
  submitting,
  success,
  error;

  bool get isSubmitting => this == RegisterStatus.submitting;
}

class RegisterState extends Equatable {
  const RegisterState({
    required this.email,
    required this.password,
    required this.status,
  });

  factory RegisterState.initial() => const RegisterState(
        email: '',
        password: '',
        status: RegisterStatus.initial,
      );

  final String email;
  final String password;
  final RegisterStatus status;

  @override
  List<Object> get props => [email, password, status];

  RegisterState copyWith({
    String? email,
    String? password,
    RegisterStatus? status,
  }) {
    return RegisterState(
      email: email ?? this.email,
      password: password ?? this.password,
      status: status ?? this.status,
    );
  }
}
