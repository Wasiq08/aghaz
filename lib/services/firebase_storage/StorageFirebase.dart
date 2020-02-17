import 'dart:io';

import 'package:aghaz/screens/volunter_post/VolunteerPostSend.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:math';

class StorageFirebase {
  int random = Random().nextInt(100);

  void sendImage(
      {@required File image,
      @required BuildContext context,
      @required String title,
      @required String detail}) async {
    StorageReference reference =
        FirebaseStorage.instance.ref().child('home').child("image $random");
    StorageUploadTask upload = reference.putFile(image);
    await upload.onComplete;

    reference.getDownloadURL().then((imageUrl) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => VolunteerPostSend(
            imageUrl: imageUrl,
            title: title,
            detail: detail,
          ),
        ),
      );
    });
  }
}
