import 'package:authentication_repository/authentication_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit(this._authRepository) : super(RegisterState.initial());

  final AuthenticationRepository _authRepository;

  void emailChanged(String email) {
    emit(state.copyWith(email: email, status: RegisterStatus.initial));
  }

  void passwordChanged(String password) {
    emit(state.copyWith(password: password, status: RegisterStatus.initial));
  }

  Future<void> register() async {
    if (state.status.isSubmitting) return;
    emit(state.copyWith(status: RegisterStatus.submitting));
    try {
      await _authRepository.signUp(
        email: state.email,
        password: state.password,
      );
      emit(state.copyWith(status: RegisterStatus.success));
    } catch (_) {}
  }
}
