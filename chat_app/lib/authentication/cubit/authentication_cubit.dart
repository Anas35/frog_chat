import 'package:chat_app/authentication/repository/authentication_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:models/models.dart';

part 'authentication_state.dart';

class AuthenticationCubit extends Cubit<AuthenticationState> {
  AuthenticationCubit({
    AuthenticationRepository? authenticationRepository,
  }) : 
    _authenticationRepository = authenticationRepository ?? AuthenticationRepository(),
    super(const AuthenticationState());

  final AuthenticationRepository _authenticationRepository;

  String? get userId => _authenticationRepository.userId;

  Future<void> initialize() async {
    emit(state.copyWith(status: AuthenticationStatus.loading));
    try {
      final user = await _authenticationRepository.getUser();
      if(user != null) {
        emit(state.copyWith(status: AuthenticationStatus.authenticated, user: user));
      } else {
        emit(state.copyWith(status: AuthenticationStatus.unauthenticated));
      }
    } catch (e) {
      emit(state.copyWith(status: AuthenticationStatus.unauthenticated));
      rethrow;
    }
  }

  Future<void> logIn(String userName) async {
    emit(state.copyWith(status: AuthenticationStatus.loading));
    try {
      final user = await _authenticationRepository.addUser(userName);
      emit(state.copyWith(status: AuthenticationStatus.authenticated, user: user));
    } catch (e) {
      print(e);
      emit(state.copyWith(status: AuthenticationStatus.unauthenticated));
    }
  }

  Future<void> logOut() async {
    try {
      _authenticationRepository.removeUser();
      emit(state.copyWith(status: AuthenticationStatus.unauthenticated, user: null));
    } catch (e) {
      rethrow;
    }
  }
}
