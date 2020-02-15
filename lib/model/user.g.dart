// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) {
  return User(
    uid: json['uid'] as String,
    email: json['email'] as String,
    password: json['password'] as String,
    name: json['name'] as String,
    gender: json['gender'] as String,
    dob: json['dob'] as String,
    profileImage: json['profileImage'] as String,
    address: json['address'] as String,
  );
}

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'uid': instance.uid,
      'email': instance.email,
      'password': instance.password,
      'name': instance.name,
      'gender': instance.gender,
      'dob': instance.dob,
      'profileImage': instance.profileImage,
      'address': instance.address,
    };
