import 'dart:async';
import 'package:aghaz/services/UserRepository.dart';
import 'package:aghaz/services/firebase_storage/StorageFirebase.dart';
import 'package:bloc/bloc.dart';
import 'package:intl/intl.dart';
import './bloc.dart';

class ImageBloc extends Bloc<ImageEvent, ImageState> {
  final StorageFirebase storageFirebase;
  UserRepository userRepository = UserRepository();
  final df = new DateFormat('dd-MM-yyyy hh:mm a');

  ImageBloc({this.storageFirebase});

  @override
  ImageState get initialState => InitialImageState();

  @override
  Stream<ImageState> mapEventToState(ImageEvent event) async* {
    if (event is UploadImage) {
      String email = await userRepository.getUser();
      try {
        storageFirebase.sendImage(
            location: event.location,
            email: email,
            problem: event.problem,
            image: event.image,
            context: event.context,
            title: event.title,
            detail: event.detail);
      } catch (_) {
        yield ErrorImageState();
      }
    }
  }
}
