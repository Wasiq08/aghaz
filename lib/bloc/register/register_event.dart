import 'package:aghaz/model/user.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

abstract class RegisterEvent extends Equatable {
  const RegisterEvent();

  @override
  List<Object> get props => [];
}

class EmailChanged extends RegisterEvent {
  final String email;

  const EmailChanged({@required this.email});

  @override
  List<Object> get props => [email];

  @override
  String toString() => 'EmailChanged { email :$email }';
}

class PasswordChanged extends RegisterEvent {
  final String password;

  const PasswordChanged({@required this.password});

  @override
  List<Object> get props => [password];

  @override
  String toString() => 'PasswordChanged { password: $password }';
}

class Submitted extends RegisterEvent {
  final String email;
  final String password;

  const Submitted({
    @required this.email,
    @required this.password,
  });

  @override
  List<Object> get props => [email, password];

  @override
  String toString() {
    return 'Submitted { email: $email, password: $password }';
  }
}

class SendData extends RegisterEvent {
  final String name;
  final String email;
  final String password;
  final String address;
  final String gender;
  final String dob;

  SendData(
      {this.name,
      this.email,
      this.password,
      this.address,
      this.gender,
      this.dob});
}

class SendPost extends RegisterEvent{
final String title;
final String detail;
final String imageUrl;
final String date;

SendPost(this.title, this.detail, this.imageUrl, this.date);

}
