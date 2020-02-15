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

  UploadImage(
      {@required this.image,
      @required this.context,
      @required this.title,
      @required this.detail});
}
