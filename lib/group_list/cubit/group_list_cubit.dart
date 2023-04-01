import 'package:api_wrapper/api_wrapper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:models/models.dart';
part 'group_list_state.dart';

class GroupListCubit extends Cubit<GroupListState> {
  GroupListCubit({ApiWrapper? api}) : 
    _api = api ?? ApiWrapper(),
    super(const GroupListState());

  final ApiWrapper _api;

  /// A description for yourCustomFunction 
  Future<void> getGroups(String userId, String token) async {
    emit(state.copyWith(status: GroupListStatus.loading));
    try {
      final groups = await _api.getAllGroups(userId, token);

      final temp = Set.from(groups).difference(Set.from(state.groups)).toList().cast<Group>();

      emit(state.copyWith(
        status: GroupListStatus.success,
        groups: List.of(state.groups)..addAll(temp),
      ));
    } on ApiException catch (e) {
      emit(state.copyWith(
        status: GroupListStatus.failed,
        errorMessage: e.message,
      ));
    }
  }
}
