import 'package:aghaz/app_theme.dart';
import 'package:aghaz/helper/ScreenSize.dart';
import 'package:aghaz/model/post_list.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
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

//        boxShadow: <BoxShadow>[
//          BoxShadow(
//            color: Colors.grey.withOpacity(0.6),
//            offset: const Offset(1, 1),
//            blurRadius: 0,
//          ),
//        ],
      ),
      child: Card(
        elevation: 0.5,
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
                      'Upload Time: 1:45 PM',
                      style: Theme.of(context).textTheme.caption,
                    ),
                  ],
                ),
              ],
            ),
            Container(
              width: ScreenSize.blockSizeHorizontal * 100,
              height: ScreenSize.blockSizeVertical * 25,
              child: Image.asset(
                postData.imagePath,
                fit: BoxFit.cover,
              ),
            ),
            Text(
              postData.description,
              style: Theme.of(context).textTheme.subhead,
            ),
            Text(
              postData.description,
              style: Theme.of(context).textTheme.caption,
            ),
          ],
        ),
//        child: ClipRRect(
//          borderRadius: const BorderRadius.all(
//            Radius.circular(5.0),
//          ),
//          child: Stack(
//            children: <Widget>[
//              Column(
//                children: <Widget>[
//                  AspectRatio(
//                    aspectRatio: 2,
//                    child: Image.asset(
//                      postData.imagePath,
//                      fit: BoxFit.cover,
//                    ),
//                  ),
//                  Container(
//                    color: AppTheme.buildLightTheme().backgroundColor,
//                    child: Row(
//                      mainAxisAlignment: MainAxisAlignment.center,
//                      crossAxisAlignment: CrossAxisAlignment.start,
//                      children: <Widget>[
//                        Expanded(
//                          child: Container(
//                            child: Padding(
//                              padding: const EdgeInsets.only(
//                                  left: 16, top: 8, bottom: 8),
//                              child: Column(
//                                mainAxisAlignment: MainAxisAlignment.center,
//                                crossAxisAlignment: CrossAxisAlignment.start,
//                                children: <Widget>[
//                                  Text(
//                                    postData.description,
//                                    textAlign: TextAlign.left,
//                                    style: Theme.of(context).textTheme.subhead
//                                  ),
//                                  Row(
//                                    crossAxisAlignment:
//                                        CrossAxisAlignment.center,
//                                    mainAxisAlignment: MainAxisAlignment.start,
//                                    children: <Widget>[
//                                      Text(
//                                        postData.description,
//                                        style: Theme.of(context).textTheme.subtitle,
//                                      ),
//                                      const SizedBox(
//                                        width: 4,
//                                      ),
//                                      Icon(Icons.map,
//                                          size: 12, color: Colors.red),
//                                    ],
//                                  ),
//                                ],
//                              ),
//                            ),
//                          ),
//                        ),
//                      ],
//                    ),
//                  ),
//                ],
//              ),
//              Positioned(
//                top: 8,
//                right: 8,
//                child: Material(
//                  color: Colors.transparent,
//                  child: InkWell(
//                    borderRadius: const BorderRadius.all(
//                      Radius.circular(32.0),
//                    ),
//                    onTap: () {},
//                    child: Padding(
//                      padding: const EdgeInsets.all(8.0),
//                      child: Icon(EvaIcons.heartOutline, color: Colors.green),
//                    ),
//                  ),
//                ),
//              )
//            ],
//          ),
//        ),
      ),
    );
  }
}
