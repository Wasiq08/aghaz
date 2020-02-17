import 'package:meta/meta.dart';

@immutable
abstract class PostEvent {}

class UploadPost extends PostEvent {
  final String title;
  final String detail;
  final String imageUrl;

  UploadPost(
      {@required this.title, @required this.detail, @required this.imageUrl});
}


