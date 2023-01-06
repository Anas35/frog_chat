import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:chat_app/groups_creation/group_enum.dart';
import 'package:chat_app/groups_creation/repository/group_repository.dart';
import 'package:equatable/equatable.dart';

part 'group_code_state.dart';

class GroupCodeCubit extends Cubit<GroupCodeState> {

  GroupCodeCubit({
    GroupRepository? groupRepository
  }) :
    _groupRepository = groupRepository ?? GroupRepository(),
    super(const GroupCodeState());

  final GroupRepository _groupRepository;

  Future<void> generateGroupCode() async {
    emit(state.copyWith(createStatus: Status.loading));
    try {
      final groupCode = await _groupRepository.fetchGroupCode();
      emit(state.copyWith(createStatus: Status.success, groupCode: groupCode));
    } catch (e) {
      emit(state.copyWith(createStatus: Status.success, message: e.toString()));
    }
  }
}
