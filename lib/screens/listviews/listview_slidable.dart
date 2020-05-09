import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:widgets_guide/shared/constants.dart';

class ListViewSlidable extends StatefulWidget {
  ListViewSlidable({Key key}) : super(key: key);

  @override
  _ListViewSlidableState createState() => _ListViewSlidableState();
}

class _ListViewSlidableState extends State<ListViewSlidable> {
  final _planets = List.of(planetsTemplate);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('List View Slidable'),
      ),
      body: Padding(
        padding: EdgeInsets.all(8.0),
        child: ListView.builder(
          itemCount: _planets.length,
          itemBuilder: (context, index) {
            return Slidable(
              actionPane: SlidableDrawerActionPane(),
              child: Card(
                child: ListTile(
                  title: Text(_planets[index].name),
                ),
              ),
              actions: <Widget>[
                IconSlideAction(
                  caption: 'Archive',
                  color: Colors.blue,
                  icon: Icons.archive,
                  onTap: () {},
                ),
                IconSlideAction(
                  caption: 'Share',
                  color: Colors.indigo,
                  icon: Icons.share,
                  onTap: () {},
                ),
              ],
              secondaryActions: <Widget>[
                IconSlideAction(
                  caption: 'More',
                  color: Colors.black45,
                  icon: Icons.more_horiz,
                  onTap: () {},
                ),
                IconSlideAction(
                  caption: 'Delete',
                  color: Colors.red,
                  icon: Icons.delete,
                  onTap: () {},
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
