import 'dart:async';
import 'package:aghaz/services/UserRepository.dart';
import 'package:aghaz/services/firebase_store/FirebaseStore.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import './bloc.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  final FirebaseStore store;
  UserRepository userRepository = UserRepository();
  final df = new DateFormat('dd-MM-yyyy hh:mm a');

  PostBloc({@required this.store});

  @override
  PostState get initialState => InitialPostState();

  @override
  Stream<PostState> mapEventToState(PostEvent event) async* {
    if (event is UploadPost) {
      String email = await userRepository.getUser();
      print(email);
      store.sendPost(
          imagePath: event.imageUrl,
          title: event.title,
          detail: event.detail,
          date: df.format(DateTime.now()),
          email: email);
    }
  }
}
