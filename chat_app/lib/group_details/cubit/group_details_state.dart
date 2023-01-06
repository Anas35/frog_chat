part of 'group_details_cubit.dart';

class GroupDetailsState extends Equatable {

  final Status status;

  final Group? group;

  const GroupDetailsState({this.status = Status.initial, this.group});

  GroupDetailsState copyWith({
    Status? status,
    Group? group,
  }) {
    return GroupDetailsState(
      status: status ?? this.status,
      group: group ?? this.group,
    );
  }

  @override
  List<Object?> get props => [status, group];

}
