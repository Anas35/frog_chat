import 'dart:convert';

import 'package:chat_app/groups_creation/group_enum.dart';
import 'package:http/http.dart' as http;
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:models/models.dart';

part 'user_details_state.dart';

class UserDetailsCubit extends Cubit<UserDetailsState> {
  UserDetailsCubit() : super(const UserDetailsState());

  static const String _url = "http://localhost:8080/user";

  Future<void> fetchUser(String groupId) async {
    emit(state.copyWith(status: Status.loading));

    try {
      final user = await _fetch(groupId);
      emit(
        state.copyWith(
          status: Status.success,
          user: user,
        ),
      );
    } catch (e) {
      emit(state.copyWith(status: Status.failed));
    }
  }

  Future<User> _fetch(String userId) async {
    final response = await http.get(Uri.parse('$_url/$userId'));

    if (response.statusCode == 200) {
      return User.fromJson(jsonDecode(response.body));
    } else {
      throw 'failed to fetch group';
    }
  }
}
