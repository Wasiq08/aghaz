import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable()
class User {
  final String uid;
  final String email;
  final String password;
  final String name;
  final String gender;
  final String dob;
  @JsonKey(nullable: true)
  final String profileImage;
  final String address;

  User(
      {this.uid,
      this.email,
      this.password,
      this.name,
      this.gender,
      this.dob,
      this.profileImage,
      this.address});

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}
