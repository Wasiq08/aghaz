import 'package:aghaz/helper/ScreenSize.dart';
import 'package:aghaz/screens/VolunteerDetail.dart';
import 'package:aghaz/screens/VolunteerPicture.dart';
import 'package:aghaz/screens/VolunteerPostSend.dart';
import 'package:bubble_tab_indicator/bubble_tab_indicator.dart';
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
      child: DefaultTabController(
        initialIndex: 0,
        length: 3,
        child: Scaffold(
          appBar: PreferredSize(
            preferredSize: size,
            child: Container(
              height: ScreenSize.blockSizeHorizontal * 20,
              child: TabBar(
                labelColor: Colors.white,
                unselectedLabelColor: Colors.grey.withOpacity(0.4),
                indicator: BubbleTabIndicator(
                  indicatorHeight: 35.0,
                  indicatorColor: Colors.blueAccent,
                  tabBarIndicatorSize: TabBarIndicatorSize.tab,
                ),
                tabs: [
                  Tab(
                    child: Text(
                      'Detail',
                    ),
                  ),
                  Tab(
                    child: Text('Picture'),
                  ),
                  Tab(
                    child: Text('Post'),
                  ),
                ],
              ),
            ),
          ),
          body: TabBarView(
            
            physics: NeverScrollableScrollPhysics(),
            children: [
              VolunteerDetail(),
              VolunteerPicture(),
              VolunteerPostSend()
            ],
          ),
        ),
      ),
    );
  }
}
