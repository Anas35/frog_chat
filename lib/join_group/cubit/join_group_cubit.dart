import 'package:api_wrapper/api_wrapper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:validator/validator.dart';
part 'join_group_state.dart';

class JoinGroupCubit extends Cubit<JoinGroupState> {
  
  final ApiWrapper _api;

  JoinGroupCubit({
    ApiWrapper? api,
  }) : 
    _api = api ?? ApiWrapper(),
    super(const JoinGroupState());

  void onGroupIdChange(String groupId) {
    final groupCode = GroupId.dirty(groupId: groupId);
    emit(
      state.copyWith(
        groupId: groupCode,
      ),
    );
  }

  void resetStatus() {
    emit(state.copyWith(status: FormzSubmissionStatus.initial));
  }

  Future<void> joinGroup(String userId, String token) async {
    if (!Formz.validate([state.groupId])) {
      emit(state.copyWith(
        status: FormzSubmissionStatus.failure,
      )); 
      return;
    }

    try {
      await _api.joinGroup(userId, state.groupId.value, token);
      emit(state.copyWith(
        status: FormzSubmissionStatus.success,
      ));
    } on ApiException catch (_, __) {
      emit(state.copyWith(status: FormzSubmissionStatus.failure));
    }

  }
}
