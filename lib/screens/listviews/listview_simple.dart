import 'package:flutter/material.dart';
import 'package:widgets_guide/models/planet.dart';
import 'package:widgets_guide/shared/constants.dart';
import 'package:widgets_guide/shared/keyboard_helpers.dart';

class ListViewSimple extends StatefulWidget {
  ListViewSimple({Key key}) : super(key: key);

  @override
  _ListViewSimpleState createState() => _ListViewSimpleState();
}

class _ListViewSimpleState extends State<ListViewSimple> {
  final _planets = List.of(planetsTemplate);
  final TextEditingController _nameController = TextEditingController();
  final ScrollController _scrollController = ScrollController();

  void addItemToList() {
    setState(() {
      _planets.insert(0, Planet(_nameController.text, 0));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('List View Simple'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            _buildListView(),
            Divider(),
            _buildAddElementRow(),
            Divider(),
          ],
        ),
      ),
    );
  }

  Expanded _buildListView() {
    return Expanded(
      child: ListView.builder(
        controller: _scrollController,
        itemCount: _planets.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              leading: CircleAvatar(
                radius: 25,
                backgroundColor: Colors.blue[(index + 1) * 100],
              ),
              title: Text(_planets[index].name),
              subtitle: Text(_planets[index].diameter.toString() + ' km'),
            ),
          );
        },
      ),
    );
  }

  Padding _buildAddElementRow() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: _nameController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Planet Name',
              ),
            ),
          ),
          SizedBox(width: 16.0),
          FloatingActionButton(
            child: Icon(Icons.add),
            onPressed: () {
              addItemToList();
              KeyboardHelper.dismissKeyboard(context);
              _scrollController.animateTo(
                0,
                duration: Duration(milliseconds: 500),
                curve: Curves.easeInOut,
              );
            },
          ),
        ],
      ),
    );
  }
}
