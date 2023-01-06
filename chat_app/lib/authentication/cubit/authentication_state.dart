part of 'authentication_cubit.dart';

enum AuthenticationStatus {
  unauthenticated,
  authenticated,
  loading
}

class AuthenticationState extends Equatable {

  final AuthenticationStatus status;

  final User? user;

  const AuthenticationState({this.status = AuthenticationStatus.unauthenticated, this.user});

  AuthenticationState copyWith({
    AuthenticationStatus? status,
    User? user
  }) {
    return AuthenticationState(
      status: status ?? this.status,
      user: user ?? this.user,
    );
  }
  
  @override
  List<Object?> get props => [status, user];

}
