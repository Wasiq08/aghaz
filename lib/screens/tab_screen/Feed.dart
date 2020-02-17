import 'dart:convert';

import 'package:aghaz/model/post_list.dart';
import 'package:aghaz/post_list_view.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Feed extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    PostList list;
    return StreamBuilder<QuerySnapshot>(
        stream: Firestore.instance
            .collection('Post')
            .orderBy('date', descending: true)
            .snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return ListView.builder(
                itemCount: snapshot.data.documents.length,
                itemBuilder: (context, index) {
                  list = PostList.fromJson(
                    jsonDecode(
                      jsonEncode(snapshot.data.documents[index].data),
                    ),
                  );
                  return PostListView(
                    postData: list,
                  );
                });
          }
        });
  }
}
