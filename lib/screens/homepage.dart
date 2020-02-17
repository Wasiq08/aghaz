import 'package:aghaz/bloc/authentication_bloc/bloc.dart';
import 'package:aghaz/explore.dart';
import 'package:aghaz/screens/MyRewards.dart';
import 'package:aghaz/screens/tab_screen/Feed.dart';
import 'package:aghaz/screens/volunter_post/VolunteerPost.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_fab_dialer/flutter_fab_dialer.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Choice {
  const Choice({this.title});

  final String title;
}

const List<Choice> choices = const <Choice>[
  const Choice(title: 'FEED'),
  const Choice(title: 'SOCIAL GOALS'),
  const Choice(title: 'EXPLORE')
];

Widget _buildProjectListView() {
  return Container(
    child: MyRewards(),
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
        floatingActionButton: FabDialer(

          [
            FabMiniMenuItem.withText(
                Icon(FontAwesomeIcons.broom), Theme.of(context).accentColor, 5, '', () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => VolunteerPost(problem: 'Cleanliness',),
                ),
              );
            }, 'Cleanliness', Theme.of(context).accentColor, Colors.white,
                false),
            FabMiniMenuItem.withText(
                Icon(FontAwesomeIcons.lightbulb),
                Theme.of(context).accentColor,
                5,
                '',
                () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => VolunteerPost(problem: 'Lightning',),
                    ),
                  );
                },
                'Lightning',
                Theme.of(context).accentColor,
                Colors.white,
                true),
            FabMiniMenuItem.withText(
                Icon(FontAwesomeIcons.water),
                Theme.of(context).accentColor,
                5,
                '',
                () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => VolunteerPost(problem: 'Water',),
                    ),
                  );
                },
                'Water',
                Theme.of(context).accentColor,
                Colors.white,
                false),
            FabMiniMenuItem.withText(
                Icon(FontAwesomeIcons.road),
                Theme.of(context).accentColor,
                5,
                '',
                () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => VolunteerPost(problem: 'Roads',),
                    ),
                  );
                },
                'Roads',
                Theme.of(context).accentColor,
                Colors.white,
                true),
            FabMiniMenuItem.withText(
                Icon(FontAwesomeIcons.arrowRight),
                Theme.of(context).accentColor,
                5,
                '',
                () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => VolunteerPost(problem: 'Others',),
                    ),
                  );
                },
                'Other',
                Theme.of(context).accentColor,
                Colors.white,
                true)
          ],
          Theme.of(context).accentColor,
          Icon(EvaIcons.plus),
        ),
//        FloatingActionButton.extended(
//          onPressed: () {
//            Navigator.push(
//              context,
//              MaterialPageRoute(
//                builder: (context) => VolunteerPost(),
//              ),
//            );
//          },
//          label: Text("Post"),
//          icon: Icon(EvaIcons.paperPlaneOutline),
//        ),
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
            Feed(),
            _buildProjectListView(),
            _buildExploreListView()
          ],
        ),
      ),
    );
  }
}
