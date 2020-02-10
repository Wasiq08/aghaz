import 'package:aghaz/app_theme.dart';
import 'package:aghaz/explore.dart';
import 'package:aghaz/model/post_list.dart';
import 'package:aghaz/post_list_view.dart';
import 'package:aghaz/screens/ProjectPage.dart';
import 'package:flutter/material.dart';

import 'widgets/AghazCard.dart';

class Choice {
  const Choice({this.title});
  final String title;
}

List<PostList> postList = PostList.postList;

const List<Choice> choices = const <Choice>[
  const Choice(title: 'FEED'),
  const Choice(title: 'PROJECT'),
  const Choice(title: 'EXPLORE')
];

Widget _buildListView() {
  return Container(
    color: AppTheme.buildLightTheme().backgroundColor,
      child: ListView.builder(
    itemCount: postList.length,
    padding: const EdgeInsets.only(top: 10),
    itemBuilder: (BuildContext context, int index) {
      return PostListView(
        postData: postList[index],
      );
    },
  ));
}

Widget _buildProjectListView() {
  return Container(
    child: ProjectCard()
  );
}

Widget _buildExploreListView() {
  return Container(
    child: ExplorePage()
  );
}



class HomePage extends StatefulWidget {

  @override
  _HomePageState createState() => _HomePageState();
  
}

class _HomePageState extends State<HomePage> {


  @override
  Widget build(BuildContext context) {
    

  @override
  void initState() {
    super.initState();
  }

    return MaterialApp(
      home: DefaultTabController(
        length: choices.length,
        child: Scaffold(
          appBar: AppBar(
            title: Center(child: Text('Aghaz')),
            bottom: TabBar(
              isScrollable: true,
              tabs: choices.map((Choice choice) {
                return Tab(
                  text: choice.title,
                );
              }).toList(),
            ),
          ),
          body: TabBarView(
            children: <Widget>[
              _buildListView(),
              _buildProjectListView(),
              _buildExploreListView()
            ],
          ),
        ),
      ),
    );
  }
}

