import 'dart:async';

import 'package:api_wrapper/api_wrapper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:models/models.dart';
import 'package:validator/validator.dart';

import 'package:equatable/equatable.dart';

part 'authentication_state.dart';

class AuthenticationCubit extends Cubit<AuthenticationState> {
  AuthenticationCubit(this.client) : super(const AuthenticationState());

  final ApiWrapper client;

  void onEmailChange(String email) {
    final emailValidator = Email.dirty(value: email);
    emit(
      state.copyWith(
        email: emailValidator,
      ),
    );
  }

  void onPasswordChange(String password) {
    final passwordValidator = Password.dirty(value: password);
    emit(
      state.copyWith(
        password: passwordValidator,
      ),
    );
  }

  void onNameChange(String name) {
    final nameValidator = Name.dirty(value: name);
    emit(
      state.copyWith(
        name: nameValidator,
      ),
    );
  }

  void resetStatus() {
    emit(state.copyWith(status: FormzSubmissionStatus.initial));
  }

  String? get logInErrorMessage {
    if (state.status.isFailure) {
      return state.email.error?.name ?? state.password.error?.name;
    }
    return null;
  }

  
  String? get registerErrorMessage {
    if (state.status.isFailure) {
      return state.email.error?.message ?? state.password.error?.message ?? state.name.error?.message;
    }
    return null;
  }

  FutureOr<void> logIn() async {
    final email = Email.dirty(value: state.email.value);
    final password = Password.dirty(value: state.password.value);

    if (!Formz.validate([email, password])) {
      emit(state.copyWith(
        status: FormzSubmissionStatus.failure,
      ));
      return;
    }
    
    try {
      emit(state.copyWith(status: FormzSubmissionStatus.inProgress));
      final user = User(email: state.email.value, password: state.password.value);
      final token = await client.logIn(user);
      emit(state.copyWith(
        status: FormzSubmissionStatus.success,
        token: token,
      ));
    } on ApiException catch (e, stack) {
      print(e.message + stack.toString());
      emit(state.copyWith(status: FormzSubmissionStatus.failure));
    }
  }

  FutureOr<void> register() async {
    final name = Name.dirty(value: state.name.value);
    final email = Email.dirty(value: state.email.value);
    final password = Password.dirty(value: state.password.value);

    if (!Formz.validate([email, password, name])) {
      emit(state.copyWith(
        status: FormzSubmissionStatus.failure,
      ));
      return;
    }
    
    try {
      emit(state.copyWith(status: FormzSubmissionStatus.inProgress));
      final user = User(email: state.email.value, password: state.password.value, name: state.name.value);
      final token = await client.register(user);
      emit(state.copyWith(
        status: FormzSubmissionStatus.success,
        token: token
      ));
    } on ApiException catch (e, stack) {
      print(e.message + stack.toString());
      emit(state.copyWith(status: FormzSubmissionStatus.failure));
    }
  }
}
