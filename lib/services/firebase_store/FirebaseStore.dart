import 'dart:convert';

import 'package:aghaz/model/post_list.dart';
import 'package:aghaz/model/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseStore {
  void sendData(
      {String uid,
      String name,
      String email,
      String password,
      String address,
      String gender,
      String dob}) {
    User user = User(
        uid: uid,
        name: name,
        email: email,
        password: password,
        address: address,
        gender: gender,
        dob: dob);
    Firestore.instance.collection('User').document(uid).setData(
          jsonDecode(
            jsonEncode(user),
          ),
        );
  }

  void sendPost(
      {String imagePath,
      String title,
      String detail,
      String email,
      String date,
      String problem,
      String location}) {
    PostList postList = PostList(
        imagePath: imagePath,
        category: title,
        description: detail,
        email: email,
        date: date,
        location: location,
        problem: problem);
    Firestore.instance.collection('Post').document().setData(
          jsonDecode(
            jsonEncode(postList),
          ),
        );
  }
}
