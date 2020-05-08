import 'package:flutter/material.dart';
import 'package:widgets_guide/models/choice.dart';
import 'package:widgets_guide/shared/constants.dart';

class ListViewsHome extends StatelessWidget {
  const ListViewsHome({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<Choice> _choices = List.of(listviewChoices);

    return Scaffold(
      appBar: AppBar(
        title: Text('List Views'),
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(10.0),
        itemCount: _choices.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.of(context).pushNamed(_choices[index].routeName);
            },
            child: Padding(
              padding: EdgeInsets.all(0.0),
              child: Card(
                child: ListTile(
                  trailing: Icon(Icons.arrow_forward_ios),
                  title: Text(
                    _choices[index].title,
                    style: TextStyle(fontSize: 16.0),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
