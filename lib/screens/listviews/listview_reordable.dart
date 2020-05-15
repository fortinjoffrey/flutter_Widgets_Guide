import 'package:flutter/material.dart';
import 'package:widgets_guide/models/planet.dart';
import 'package:widgets_guide/shared/constants.dart';

class ListViewReordable extends StatefulWidget {
  ListViewReordable({Key key}) : super(key: key);

  @override
  _ListViewReordableState createState() => _ListViewReordableState();
}

class _ListViewReordableState extends State<ListViewReordable> {
  final List<Planet> planets = List.of(planetsTemplate);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('List View Reordable'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ReorderableListView(
              onReorder: (oldIndex, newIndex) {
                setState(() {
                  if (newIndex > oldIndex) {
                    newIndex -= 1;
                  }
                  final item = planets.removeAt(oldIndex);
                  planets.insert(newIndex, item);
                });
              },
              children: [
                for (var planet in planets)
                  Card(
                    key: UniqueKey(),
                    child: ListTile(
                      title: Text(planet.name),
                    ),
                  )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(bottom: 40.0),
            child: Text(
              'Long press on item to reorder',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),
            ),
          ),
        ],
      ),
    );
  }
}
