import 'dart:async';
import 'package:aghaz/services/firebase_storage/StorageFirebase.dart';
import 'package:bloc/bloc.dart';
import './bloc.dart';

class ImageBloc extends Bloc<ImageEvent, ImageState> {
  final StorageFirebase storageFirebase;

  ImageBloc({this.storageFirebase});

  @override
  ImageState get initialState => InitialImageState();

  @override
  Stream<ImageState> mapEventToState(ImageEvent event) async* {
    if (event is UploadImage) {
      storageFirebase.sendImage(
          image: event.image,
          context: event.context,
          title: event.title,
          detail: event.detail);
    }
  }
}
