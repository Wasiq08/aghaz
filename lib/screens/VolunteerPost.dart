import 'package:aghaz/helper/ScreenSize.dart';
import 'package:aghaz/screens/VolunteerDetail.dart';
import 'package:aghaz/screens/VolunteerPicture.dart';
import 'package:aghaz/screens/VolunteerPostSend.dart';
import 'package:flutter/material.dart';

class VolunteerPost extends StatefulWidget {
  @override
  _VolunteerPostState createState() => _VolunteerPostState();
}

class _VolunteerPostState extends State<VolunteerPost>
    with SingleTickerProviderStateMixin {
  PageController _controller;

  @override
  void initState() {
    _controller = PageController(initialPage: 0);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ScreenSize().init(context);
    Size size = Size(ScreenSize.blockSizeHorizontal * 100,
        ScreenSize.blockSizeHorizontal * 30);

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: Text("Create Post"),),
        body: PageView(
          controller: _controller,
          physics: NeverScrollableScrollPhysics(),
          children: [
            VolunteerDetail(_controller),
            VolunteerPicture(controller: _controller,),
            VolunteerPostSend()
          ],
        ),
      ),
    );
  }
}
