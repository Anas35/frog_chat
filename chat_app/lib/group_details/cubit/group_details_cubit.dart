import 'dart:convert';

import 'package:chat_app/groups_creation/group_enum.dart';
import 'package:http/http.dart' as http;
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:models/models.dart';

part 'group_details_state.dart';

class GroupDetailsCubit extends Cubit<GroupDetailsState> {
  GroupDetailsCubit() : super(const GroupDetailsState());

  static const String _url = "http://localhost:8080/group";

  Future<void> fetchGroup(String groupId) async {
    emit(state.copyWith(status: Status.loading));

    try {
      final group = await _fetch(groupId);
      emit(
        state.copyWith(
          status: Status.success,
          group: group,
        ),
      );
    } catch (e) {
      emit(state.copyWith(status: Status.failed));
    }
  }

  Future<Group> _fetch(String groupId) async {
    final response = await http.get(Uri.parse('$_url/$groupId'));

    if (response.statusCode == 201) {
      return Group.fromJson(jsonDecode(response.body));
    } else {
      throw 'failed to fetch group';
    }
  }
}
