import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';

@immutable
abstract class ImageEvent {}

class UploadImage extends ImageEvent {
  final File image;
  final BuildContext context;
  final String title;
  final String detail;
  final String problem;
  final String location;
  final String email;

  UploadImage(
      {@required this.image,
      @required this.context,
      @required this.title,
      @required this.detail,
      @required this.problem,
      @required this.location,
      this.email});
}
