import 'package:aghaz/helper/ScreenSize.dart';
import 'package:aghaz/model/post_list.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class PostListView extends StatelessWidget {
  final PostList postData;

  const PostListView({Key key, this.postData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScreenSize().init(context);

    return Padding(
      padding: const EdgeInsets.only(top: 8, bottom: 8, right: 4, left: 4),
      child: Container(
        width: ScreenSize.blockSizeHorizontal * 100,
        //height: ScreenSize.blockSizeVertical * 50,
        padding: EdgeInsets.all(2.5),
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(
            Radius.circular(5.0),
          ),
        ),
        child: Card(
          margin: EdgeInsets.all(5),
          elevation: 0,
          color: Theme.of(context).scaffoldBackgroundColor,
          child: Wrap(
            spacing: 10,
            direction: Axis.vertical,
            alignment: WrapAlignment.center,
            children: <Widget>[
              Wrap(
                direction: Axis.horizontal,
                crossAxisAlignment: WrapCrossAlignment.center,
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
                        'By: ' + postData.email,
                        style: Theme.of(context).textTheme.caption,
                      ),
                      Text(
                        postData.date,
                        style: Theme.of(context).textTheme.caption,
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 16),
                    child: Text(
                      postData.problem == null ? "Clean" : postData.problem,
                      style: Theme.of(context)
                          .textTheme
                          .caption
                          .copyWith(color: Theme.of(context).accentColor),
                    ),
                  )
                ],
              ),
              Container(
                width: ScreenSize.blockSizeHorizontal * 100,
                //height: ScreenSize.blockSizeVertical * 25,
                child: CachedNetworkImage(
                  imageUrl: postData.imagePath,
                  placeholder: (context, url) {
                    return Container(
                      width: ScreenSize.blockSizeHorizontal * 100,
                      height: ScreenSize.blockSizeVertical * 30,
                      child: Center(
                        child: CircularProgressIndicator(),
                      ),
                    );
                  },
                  imageBuilder: (context, image) {
                    return Container(
                      width: ScreenSize.blockSizeHorizontal * 100,
                      height: ScreenSize.blockSizeVertical * 30,
                      decoration: BoxDecoration(
                        image: DecorationImage(image: image, fit: BoxFit.fill),
                      ),
                    );
                  },
                ),
              ),
              Container(
                width: ScreenSize.blockSizeHorizontal * 100,
                child: Text(
                  postData.location == null
                      ? "Karachi,Sindh,Pakistan"
                      : postData.location,
                  style: Theme.of(context).textTheme.caption,
                ),
              ),
              Text(
                postData.category,
                style: Theme.of(context).textTheme.subhead.copyWith(
                    color: Theme.of(context).accentColor,
                    fontWeight: FontWeight.w600),
              ),
              Container(
                width: ScreenSize.blockSizeHorizontal * 100,
                child: Text(
                  postData.description,
                  style: Theme.of(context).textTheme.subtitle,
                ),
              ),
              Divider(
                color: Colors.black,
                thickness: 4,
                height: 2,
              )
            ],
          ),
        ),
      ),
    );
  }
}
