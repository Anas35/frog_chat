import 'package:chat_app/custom_exception.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:models/models.dart';
import 'package:user_repository/user_repository.dart';

part 'authentication_state.dart';

class AuthenticationCubit extends Cubit<AuthenticationState> {
  final UserRepository _userRepository;

  AuthenticationCubit({
    UserRepository? userRepository,
  })  : _userRepository = userRepository ?? UserRepository(),
        super(const AuthenticationState());

  void onInputChanged(String userName) => emit(
    state.copyWith(user: state.user.copyWith(name: userName)),
  );

  Future<void> logIn() async {
    try {
      final user = await _userRepository.createUser(state.user.name);
      emit(state.copyWith(
        authenticationStatus: AuthenticationStatus.authenticated,
        user: user,
      ));
    } on HttpRequestException catch (e) {
      emit(state.copyWith(errorMessage: e.message));
    } catch (e) {
      print(e);
      emit(state.copyWith(errorMessage: 'Unhandled error'));
    }
  }

  Future<void> logOut() async {
    emit(state.copyWith(authenticationStatus: AuthenticationStatus.unauthenticated));
  }
}
