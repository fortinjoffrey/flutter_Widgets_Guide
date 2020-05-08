import 'package:flutter/material.dart';
import 'package:widgets_guide/shared/constants.dart';

class Home extends StatelessWidget {
  const Home({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Widgets'),
        backgroundColor: Colors.blue,
      ),
      body: HomeList(),
    );
  }
}

class HomeList extends StatelessWidget {
  final _choices = List.of(mainChoices);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
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
                  '${index + 1}. ' + _choices[index].title,
                  style: TextStyle(fontSize: 16.0),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
