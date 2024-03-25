part of 'register_bloc.dart';

sealed class RegisterEvent {}

class UsernameEvent extends RegisterEvent {
  final String username;

  UsernameEvent(this.username);
}

class EmailEvent extends RegisterEvent {
  final String email;

  EmailEvent(this.email);
}

class PasswordEvent extends RegisterEvent {
  final String password;

  PasswordEvent(this.password);
}

class ConfirmPasswordEvent extends RegisterEvent {
  final String confirmPassword;

  ConfirmPasswordEvent(this.confirmPassword);
}