import 'package:meta/meta.dart';

@immutable
abstract class ImageState {}

class InitialImageState extends ImageState {}


class ErrorImageState extends ImageState{}