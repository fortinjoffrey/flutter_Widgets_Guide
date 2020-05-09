import 'package:flutter/material.dart';
import 'package:widgets_guide/shared/constants.dart';

class ListViewDismissible extends StatefulWidget {
  ListViewDismissible({Key key}) : super(key: key);

  @override
  _ListViewDismissibleState createState() => _ListViewDismissibleState();
}

class _ListViewDismissibleState extends State<ListViewDismissible> {
  final _planets = List.of(planetsTemplate);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('List View Dismissible'),
      ),
      body: Padding(
        padding: EdgeInsets.all(8.0),
        child: ListView.builder(
          itemCount: _planets.length,
          itemBuilder: (context, index) {
            return Dismissible(
              direction: DismissDirection.endToStart,
              background: Container(
                color: Colors.red,
                child: Icon(Icons.delete),
              ),
              key: UniqueKey(),
              child: Card(
                child: ListTile(
                  title: Text(_planets[index].name),
                ),
              ),
              onDismissed: (direction) {
                setState(() {
                  _planets.removeAt(index);
                });
              },
            );
          },
        ),
      ),
    );
  }
}
