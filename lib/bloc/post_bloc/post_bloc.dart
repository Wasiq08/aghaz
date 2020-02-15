import 'dart:async';
import 'package:aghaz/services/UserRepository.dart';
import 'package:aghaz/services/firebase_store/FirebaseStore.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import './bloc.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  final FirebaseStore store;
  UserRepository userRepository = UserRepository();

  PostBloc({@required this.store});

  @override
  PostState get initialState => InitialPostState();

  @override
  Stream<PostState> mapEventToState(PostEvent event) async* {

    if (event is UploadPost) {
      String email = await userRepository.getUser();
      store.sendPost(
          imagePath: event.imageUrl,
          title: event.title,
          detail: event.detail,
          date: DateTime.now().toString(),
          email: email);
    }
  }
}
