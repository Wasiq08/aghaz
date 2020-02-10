import 'package:flutter/material.dart';

class ProjectCard extends StatelessWidget {
  const ProjectCard({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Image(
          image: AssetImage('assets/images/tree.jpeg'),
          width: 600,
          height: 220,
          fit: BoxFit.cover,
        ),
        titleSection,
      ],
    );
  }
}

Widget titleSection = Card(
    child: Container(
  padding: const EdgeInsets.all(32),
  child: Row(
    children: [
      Expanded(
        /*1*/
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /*2*/
            Container(
              padding: const EdgeInsets.only(bottom: 8),
              child: Text(
                'Reforestation in Multan',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Text(
              'The trees fall victim to the extraction of tropical timber and construction timber as well as to the land requirements',
              softWrap: true,
              style: TextStyle(
                color: Colors.grey[500],
              ),
            ),
          ],
        ),
      ),
      /*3*/
      Text('Interested'),
      Icon(
        Icons.star,
        color: Colors.red[500],
      ),
      Text('41'),
    ],
  ),
));
