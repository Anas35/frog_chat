import 'package:api_wrapper/api_wrapper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
part 'create_group_state.dart';

class CreateGroupCubit extends Cubit<CreateGroupState> {
  CreateGroupCubit({ApiWrapper? api}) : 
    _api = api ?? ApiWrapper(),
    super(const CreateGroupInitial());

  final ApiWrapper _api;

  void onGroupNameChanged(String groupName) {
    emit(state.copyWith(groupName: groupName));
  }

  /// A description for yourCustomFunction 
  Future<void> createGroup(String userId, String token) async {
    emit(state.copyWith(status: CreateGroupStatus.loading));
    try {
      await _api.createGroup(userId, state.groupName, token);
      emit(state.copyWith(status: CreateGroupStatus.success));
    } catch (e) {
      emit(state.copyWith(status: CreateGroupStatus.failed));
    }
  }
}
