import 'package:flutter/material.dart';

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
  final _choices = ['List Views', 'SliverList'];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.all(10.0),
      itemCount: _choices.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            // TODO
          },
          child: Padding(
            padding: EdgeInsets.all(0.0),
            child: Card(
              child: ListTile(
                trailing: Icon(Icons.arrow_forward_ios),
                title: Text(
                  '${index + 1}. ' + _choices[index],
                  style: TextStyle(fontSize: 16.0),
                ),
              ),
              // color: Color,
            ),
          ),
        );
      },
    );
  }
}
