part of 'authentication_cubit.dart';

enum AuthenticationStatus {unknown, unauthenticated, authenticated}

class AuthenticationState extends Equatable {

  final AuthenticationStatus authenticationStatus;

  final User user;

  final String errorMessage;

  const AuthenticationState({
    this.authenticationStatus = AuthenticationStatus.unknown, 
    this.user = const User(id: '', name: ''), 
    this.errorMessage = '', 
  });

  AuthenticationState copyWith({
    User? user,
    String? errorMessage,
    AuthenticationStatus? authenticationStatus,
  }) {
    return AuthenticationState(
      errorMessage: errorMessage ?? this.errorMessage,
      user: user ?? this.user,
      authenticationStatus: authenticationStatus ?? this.authenticationStatus,
    );
  }
  
  @override
  List<Object?> get props => [errorMessage, user, authenticationStatus];

}
