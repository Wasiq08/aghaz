
import 'package:aghaz/bloc/authentication_bloc/bloc.dart';
import 'package:aghaz/explore.dart';
import 'package:aghaz/model/post_list.dart';
import 'package:aghaz/post_list_view.dart';
import 'package:aghaz/screens/ProjectPage.dart';
import 'package:aghaz/themes/app_theme.dart';
import 'package:aghaz/widgets/AghazCard.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Choice {
  const Choice({this.title});

  final String title;
}

List<PostList> postList = PostList.postList;

const List<Choice> choices = const <Choice>[
  const Choice(title: 'FEED'),
  const Choice(title: 'SOCIAL GOALS'),
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
    child: ProjectPage(),
  );
}

Widget _buildExploreListView() {
  return ExplorePage();
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: choices.length,
      child: Scaffold(
        appBar: AppBar(
          actions: <Widget>[
            IconButton(
              icon: Icon(EvaIcons.logOut),
              onPressed: () {
                BlocProvider.of<AuthenticationBloc>(context).add(
                  LoggedOut(),
                );
              },
            ),
          ],
          automaticallyImplyLeading: false,
          centerTitle: true,
          title: Text('Aghaz'),
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
    );
  }
}
