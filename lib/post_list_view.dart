import 'package:aghaz/helper/ScreenSize.dart';
import 'package:aghaz/model/post_list.dart';
import 'package:flutter/material.dart';

class PostListView extends StatelessWidget {
  final PostList postData;

  const PostListView({Key key, this.postData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScreenSize().init(context);

    return Container(
      width: ScreenSize.blockSizeHorizontal * 100,
      height: ScreenSize.blockSizeVertical * 50,
      padding: EdgeInsets.all(2.5),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(
          Radius.circular(5.0),
        ),
      ),
      child: Card(
        margin: EdgeInsets.all(5),
        elevation: 0.5,
        color: Theme.of(context).scaffoldBackgroundColor,
        child: Wrap(
          spacing: 10,
          direction: Axis.vertical,
          children: <Widget>[
            Wrap(
              direction: Axis.horizontal,
              spacing: 15,
              children: <Widget>[
                CircleAvatar(
                  backgroundColor: Colors.redAccent,
                  child: Center(
                    child: Text("AC"),
                  ),
                ),
                Wrap(
                  direction: Axis.vertical,
                  children: <Widget>[
                    Text(
                      'By: Ahmed Ali Khan',
                      style: Theme.of(context).textTheme.caption,
                    ),
                    Text(
                      postData.date,
                      style: Theme.of(context).textTheme.caption,
                    ),
                  ],
                ),
              ],
            ),
            Container(
              width: ScreenSize.blockSizeHorizontal * 100,
              height: ScreenSize.blockSizeVertical * 25,
              child: Image.network(
                postData.imagePath,
                fit: BoxFit.cover,
              ),
            ),
            Text(
              postData.category,
              style: Theme.of(context).textTheme.subhead,
            ),
            Text(
              postData.description,
              style: Theme.of(context).textTheme.caption,
            ),
          ],
        ),
      ),
    );
  }
}
