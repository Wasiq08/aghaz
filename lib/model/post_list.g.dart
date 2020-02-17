// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PostList _$PostListFromJson(Map<String, dynamic> json) {
  return PostList(
    imagePath: json['imagePath'] as String,
    description: json['description'] as String,
    location: json['location'] as String,
    isFavourite: json['isFavourite'] as bool,
    category: json['category'] as String,
    date: json['date'] as String,
    email: json['email'] as String,
  );
}

Map<String, dynamic> _$PostListToJson(PostList instance) => <String, dynamic>{
      'imagePath': instance.imagePath,
      'description': instance.description,
      'location': instance.location,
      'isFavourite': instance.isFavourite,
      'category': instance.category,
      'date': instance.date,
      'email': instance.email,
    };
