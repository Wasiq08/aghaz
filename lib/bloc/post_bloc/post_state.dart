import 'package:meta/meta.dart';

@immutable
abstract class PostState {}

class InitialPostState extends PostState {}

class ErrorPostState extends PostState{}