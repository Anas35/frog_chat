part of 'user_details_cubit.dart';

class UserDetailsState extends Equatable {

  final Status status;

  final User? user;

  const UserDetailsState({this.status = Status.initial, this.user});

  UserDetailsState copyWith({
    Status? status,
    User? user,
  }) {
    return UserDetailsState(
      status: status ?? this.status,
      user: user ?? this.user,
    );
  }

  @override
  List<Object?> get props => [status, user];

}
