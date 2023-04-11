import 'package:frog_chat/user/repository/preference.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

typedef UserState = ({String token, String userId});

class UserCubit extends Cubit<UserState> {

  UserCubit({required this.preference}) : super(const (token: '', userId: ''));

  final Preference preference;

  Future<void> updateState(String token) async {
    await preference.setToken(token);
    getState();
  }

  void getState() {
    final token = preference.getToken();
    if (token != null) {
      emit((
        token: token,
        userId: preference.fetchUserId(token),
      ));
    }
  }
}
