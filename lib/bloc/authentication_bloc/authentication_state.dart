import 'package:equatable/equatable.dart';

abstract class AuthenticationState extends Equatable {
  @override
  List<Object> get props => null;

  const AuthenticationState();
}

//UnInitialized state when the app started
class Uninitialized extends AuthenticationState {
  @override
  List<Object> get props => null;
}

//when the user is already sign in
class Authenticated extends AuthenticationState {
  final String displayName;

  const Authenticated(this.displayName);

  @override
  List<Object> get props => [displayName];

  @override
  String toString() => 'Authenticated { displayName: $displayName }';
}

//When the sign out
class Unauthenticated extends AuthenticationState {}

class ErrorState extends AuthenticationState {}
