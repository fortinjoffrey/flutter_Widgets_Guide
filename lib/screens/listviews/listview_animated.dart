import 'package:flutter/material.dart';
import 'package:widgets_guide/models/planet.dart';
import 'package:widgets_guide/shared/constants.dart';
import 'package:widgets_guide/shared/keyboard_helpers.dart';

class ListViewAnimated extends StatefulWidget {
  ListViewAnimated({Key key}) : super(key: key);

  @override
  _ListViewAnimatedState createState() => _ListViewAnimatedState();
}

class _ListViewAnimatedState extends State<ListViewAnimated> {
  final List<Planet> _planets = List.of(planetsTemplate);
  final _animatedListKey = GlobalKey<AnimatedListState>();
  final TextEditingController _nameController = TextEditingController();
  final ScrollController _scrollController = ScrollController();

  Tween<Offset> _offsetTween = Tween(
    begin: Offset(1.0, 0.0),
    end: Offset.zero,
  );

  void addItemToList() {
    setState(() {
      _planets.insert(0, Planet(_nameController.text, 0));
      _animatedListKey.currentState.insertItem(0);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('List View Animated'),
      ),
      body: Column(
        children: [
          _buildExpandedAnimatedList(),
          Divider(),
          _buildAddElementRow(context),
          Divider(),
        ],
      ),
    );
  }

  Expanded _buildExpandedAnimatedList() {
    return Expanded(
      child: AnimatedList(
        controller: _scrollController,
        key: _animatedListKey,
        initialItemCount: _planets.length,
        itemBuilder: (context, index, animation) {
          return Card(
            child: FadeTransition(
              opacity: animation,
              child: SlideTransition(
                position: _offsetTween.animate(animation),
                child: ListTile(
                  leading: CircleAvatar(
                    radius: 25,
                    backgroundColor: Colors.blue[(index + 1) * 100],
                  ),
                  title: Text(_planets[index].name),
                  subtitle: Text(_planets[index].diameter.toString() + ' km'),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Padding _buildAddElementRow(BuildContext context) {
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
