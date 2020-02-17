import 'package:equatable/equatable.dart';

abstract class AuthenticationEvent extends Equatable {
  const AuthenticationEvent();

  @override

  List<Object> get props => null;
}

// When app is started
class AppStarted extends AuthenticationEvent {}

// When the user login
class LoggedIn extends AuthenticationEvent {}

//When the user logout
class LoggedOut extends AuthenticationEvent {}

class ErrorEvent extends AuthenticationEvent{}
