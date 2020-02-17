import 'dart:io';

import 'package:aghaz/screens/volunter_post/VolunteerPostSend.dart';
import 'package:aghaz/services/firebase_store/FirebaseStore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:math';

import 'package:intl/intl.dart';

class StorageFirebase {
  int random = Random().nextInt(100);
  FirebaseStore firebaseStore = FirebaseStore();

  void sendImage(
      {@required File image,
      @required BuildContext context,
      @required String title,
      @required String detail,
      @required String problem,
      @required String email,
      @required String location}) async {
    StorageReference reference =
        FirebaseStorage.instance.ref().child('home').child("image $random");
    StorageUploadTask upload = reference.putFile(image);
    await upload.onComplete;

    DateFormat df = new DateFormat('dd-MM-yyyy hh:mm a');

    reference.getDownloadURL().then((imageUrl) {
      firebaseStore.sendPost(
          location: location,
          imagePath: imageUrl.toString(),
          title: title,
          detail: detail,
          date: df.format(DateTime.now()).toString(),
          problem: problem,
          email: email);
      Navigator.pop(context);
//      Navigator.push(
//        context,
//        MaterialPageRoute(
//          builder: (context) => VolunteerPostSend(
//            imageUrl: imageUrl,
//            title: title,
//            detail: detail,
//          ),
//        ),
//      );
    });
  }
}
