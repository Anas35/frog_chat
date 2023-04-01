part of 'user_cubit.dart';

class UserState extends Equatable {
  const UserState({
    this.token = '',
    this.userId = ''
  });

  final String token;
  final String userId;

  @override
  List<Object> get props => [token, userId];

  bool isLogged() => token.isNotEmpty;

  UserState copyWith({
    String? token,
    String? userId
  }) {
    return UserState(
      token: token ?? this.token,
      userId: userId ?? this.userId
    );
  }
}