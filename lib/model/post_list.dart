import 'package:json_annotation/json_annotation.dart';

part 'post_list.g.dart';

@JsonSerializable()
class PostList {
  final String imagePath;

  final String description;

  @JsonKey(nullable: true)
  final String location;

  @JsonKey(nullable: true)
  final bool isFavourite;
  final String category;
  final String date;
  final String email;

  PostList(
      {this.imagePath,
      this.description,
      this.location,
      this.isFavourite,
      this.category,
      this.date,
      this.email});

  factory PostList.fromJson(Map<String, dynamic> json) =>
      _$PostListFromJson(json);

  Map<String, dynamic> toJson() => _$PostListToJson(this);
}
