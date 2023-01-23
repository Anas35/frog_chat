import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:chat_app/join_group/models/group_id.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';
import 'package:group_repository/group_repository.dart';
import 'package:models/models.dart';
part 'join_group_state.dart';

class JoinGroupCubit extends Cubit<JoinGroupState> {
  JoinGroupCubit() : super(const JoinGroupState());

  void onGroupIdChange(String groupId) {
    final groupCode = GroupId.dirty(groupId: groupId);
    emit(
      state.copyWith(
        groupId: groupCode,
      ),
    );
  }

  void resetStatus() {
    emit(state.copyWith(status: FormzStatus.pure));
  }

  Future<void> joinGroup(String userId) async {
    emit(state.copyWith(
      status: Formz.validate([state.groupId]),
    ));
    if (!state.status.isValidated) return;

    final groupRepository = GroupRepository();
    final participant = Participants(groupId: state.groupId.value, userId: userId);

    try {
      final joinedGroup = await groupRepository.joinGroup(participant);
      emit(state.copyWith(
        joinedGroup: joinedGroup,
        status: FormzStatus.submissionSuccess,
      ));

    } on GroupException catch (e, stack) {
      print(e.message + stack.toString());
      emit(state.copyWith(status: FormzStatus.submissionFailure));
    }

  }
}
