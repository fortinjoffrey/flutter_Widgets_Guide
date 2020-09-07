import 'package:flutter/material.dart';
import 'package:widgets_guide/models/choice.dart';
import 'package:widgets_guide/shared/constants.dart';

class PageViewHome extends StatelessWidget {
  const PageViewHome({Key key}) : super(key: key);

  Widget build(BuildContext context) {
    final List<Choice> _choices = List.of(pageViewChoices);

    return Scaffold(
      appBar: AppBar(
        title: Text('Bottom Nav Bar'),
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(10.0),
        itemCount: _choices.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.of(context).pushNamed(_choices[index].routeName);
            },
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      _choices[index].title,
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10.0),
                    _choices[index].subtitle.isNotEmpty
                        ? Text(_choices[index].subtitle)
                        : SizedBox(height: 0),
                    SizedBox(height: 10.0),
                    _choices[index].solution != SolutionType.None
                        ? Center(
                            child: Text(
                              _choices[index]
                                      .solution
                                      .toString()
                                      .split('.')
                                      .last +
                                  ' solution',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 14.0,
                                color: getColorForSolutionType(
                                    _choices[index].solution),
                              ),
                            ),
                          )
                        : SizedBox(height: 0)
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  MaterialColor getColorForSolutionType(SolutionType type) {
    switch (type) {
      case SolutionType.Worst:
        return Colors.red;
      case SolutionType.Medium:
        return Colors.blue;
      case SolutionType.Best:
        return Colors.green;
      default:
        return Colors.black;
    }
  }
}
