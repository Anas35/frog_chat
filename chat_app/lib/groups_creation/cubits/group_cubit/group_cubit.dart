import 'package:chat_app/groups_creation/group_enum.dart';
import 'package:chat_app/groups_creation/repository/group_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:models/models.dart';

part 'group_state.dart';

class GroupCubit extends Cubit<GroupState> {

  GroupCubit({
    GroupRepository? groupRepository
  }) :
    _groupRepository = groupRepository ?? GroupRepository(),
    super(const GroupState());

  final GroupRepository _groupRepository;

  Future<void> createAndJoin(Group group, Participants participants) async {
    emit(state.copyWith(status: Status.loading));
    try {
      await _groupRepository.createGroup(group);
      await _groupRepository.joinGroup(participants);
      emit(state.copyWith(status: Status.success));
    } catch (e) {
      emit(state.copyWith(status: Status.success, message: e.toString()));
    }
  }

  Future<void> joinGroup(Participants participant) async {
    emit(state.copyWith(status: Status.loading));
    try {
      await _groupRepository.joinGroup(participant);
      emit(state.copyWith(status: Status.success));
    } catch (e) {
      emit(state.copyWith(status: Status.success, message: e.toString()));
    }
  }

}
