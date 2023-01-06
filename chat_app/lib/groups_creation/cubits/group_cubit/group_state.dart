part of 'group_cubit.dart';

class GroupState extends Equatable {

  final Status status;

  final String? message;

  const GroupState({this.message, this.status = Status.initial});

  GroupState copyWith({
    Status? status,
    String? message,
  }) {
    return GroupState(
      status: status ?? this.status,
      message: message ?? this.message,
    );
  }

  @override
  List<Object?> get props => [status, message];

}
