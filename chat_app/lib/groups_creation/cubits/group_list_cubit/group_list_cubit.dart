import 'package:chat_app/groups_creation/repository/group_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:chat_app/groups_creation/group_enum.dart';
import 'package:equatable/equatable.dart';

part 'group_list_state.dart';

class GroupListCubit extends Cubit<GroupListState> {

  GroupListCubit({
    GroupRepository? groupRepository
  }) :
    _groupRepository = groupRepository ?? GroupRepository(),
    super(const GroupListState());

  final GroupRepository _groupRepository;
  
  Future<void> getGroupList(String userId) async {
    emit(state.copyWith(status: Status.loading));
    try {
      final groupList = await _groupRepository.getJoinedGroup(userId);
      emit(state.copyWith(status: Status.success, groupList: groupList));
    } catch (e) {
      emit(state.copyWith(status: Status.success, message: e.toString()));
    }
  }
}
