
part of 'login_bloc.dart';

abstract class LoginEvent extends Equatable {


  const LoginEvent();

  @override
  List<Object> get props => [];
}

class EmailChanged extends LoginEvent {
  String? email;
  EmailChanged({required this.email});
  @override
  List<Object> get props => [email!];
}

class EmailUnfocused extends LoginEvent {}

class PasswordChanged extends LoginEvent {
  String? pass;
  PasswordChanged({required this.pass});
  @override
  List<Object> get props => [pass!];
}

class PasswordUnfocused extends LoginEvent {}

class LoginApi extends LoginEvent {
  // String? email, password;
  // LoginSubmitted({required this.email, required this.password});
  // @override
  // List<Object> get props => [email!, password!];
}
