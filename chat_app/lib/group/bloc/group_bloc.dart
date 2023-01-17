import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:group_repository/group_repository.dart';
import 'package:models/models.dart';

part 'group_event.dart';
part 'group_state.dart';

class GroupBloc extends Bloc<GroupEvent, GroupState> {
  GroupBloc() : super(const GroupStateInitial()) {
    on<GroupInputEvent>(_onGroupInputEvent);
    on<CreateGroupEvent>(_onCreateGroupEvent);
    on<JoinGroupEvent>(_onJoinGroupEvent);
  }

  final GroupRepository groupRepository = GroupRepository();

  void _onGroupInputEvent(
    GroupInputEvent event,
    Emitter<GroupState> emit,
  ) {
    emit(GroupStateInitial(groupInput: event.groupInput));
  }

  FutureOr<void> _onCreateGroupEvent(
    CreateGroupEvent event,
    Emitter<GroupState> emit,
  ) async {
    emit(GroupStateLoading());
    try {
      final group = await groupRepository.createGroup(event.groupName, event.userId);
      emit(GroupStateSuccess(group: group));
    } on GroupException catch (e) {
      emit(GroupStateError(message: e.message));
    } catch (e) {
      emit(GroupStateError(message: e.toString()));
    }
  }

  FutureOr<void> _onJoinGroupEvent(
    JoinGroupEvent event,
    Emitter<GroupState> emit,
  ) async {
    emit(GroupStateLoading());
    try {
      final group = await groupRepository.joinGroup(event.participant);
      emit(GroupStateSuccess(group: group));
    } on GroupException catch (e) {
      emit(GroupStateError(message: e.message));
    } catch (e) {
      emit(GroupStateError(message: e.toString()));
    }
  }

}
