part of 'authentication_cubit.dart';

class AuthenticationState extends Equatable {
  const AuthenticationState({
    this.name = const Name.pure(),
    this.email = const Email.pure(),
    this.password = const Password.pure(),
    this.status =  FormzSubmissionStatus.initial,
    this.token = '',
  });

  final Email email;

  final Password password;

  final Name name;

  final FormzSubmissionStatus status;

  final String token;

  AuthenticationState copyWith({
    Email? email,
    Password? password,
    Name? name,
    FormzSubmissionStatus? status,
    String? token
  }) {
    return AuthenticationState(
      email: email ?? this.email,
      password: password ?? this.password,
      name: name ?? this.name,
      status: status ?? this.status,
      token: token ?? this.token,
    );
  }

  @override
  List<Object?> get props => [email, password, status, name, token];

}
