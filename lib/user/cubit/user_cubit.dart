import 'package:frog_chat/user/repository/preference.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit({required this.preference}) : super(const UserState());

  final Preference preference;

  Future<void> updateState(String token) async {
    await preference.setToken(token);
    getState();
  }

  void getState() {
    final token = preference.getToken();
    if (token != null) {
      emit(state.copyWith(
        token: token,
        userId: preference.fetchUserId(token),
      ));
    }
  }
  
}
