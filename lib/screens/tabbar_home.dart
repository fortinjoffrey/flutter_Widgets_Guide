import 'package:flutter/material.dart';
import 'package:widgets_guide/models/choice.dart';
import 'package:widgets_guide/shared/constants.dart';

class TabBarHome extends StatelessWidget {
  const TabBarHome({Key key}) : super(key: key);

  Widget build(BuildContext context) {
    final List<Choice> _choices = List.of(tabBarChoices);

    return Scaffold(
      appBar: AppBar(
        title: Text('Tab Bar'),
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
              padding: EdgeInsets.all(8.0),
              child: Card(
                child: ListTile(
                  trailing: Icon(Icons.arrow_forward_ios),
                  title: Text(
                    _choices[index].title + '\n',
                    style: TextStyle(fontSize: 16.0),
                  ),
                  subtitle: _choices[index].subtitle.isNotEmpty
                      ? Text(
                          _choices[index].subtitle,
                        )
                      : SizedBox(height: 0),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
