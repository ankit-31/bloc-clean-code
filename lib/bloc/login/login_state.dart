part of 'login_bloc.dart';

class LoginState extends Equatable {
  final String email, password;
  final String error;

  final LoginStatus status;
  const LoginState({
    this.email = '',
    this.password = '',
    this.status = LoginStatus.inital,
    this.error = '',
  });

  LoginState copyWith({
    String? email,
    String? password,
    LoginStatus? status,
    String? error,
  }) {
    return LoginState(
      email: email ?? this.email,
      password: password ?? this.password,
      status: status ?? this.status,
      error: error ?? this.error,
    );
  }

  @override
  List<Object?> get props => [email, password, status,error];
}
