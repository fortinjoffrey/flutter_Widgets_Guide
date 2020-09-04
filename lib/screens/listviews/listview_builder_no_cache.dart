import 'package:flutter/material.dart';

class ListViewBuilderNoCache extends StatefulWidget {
  ListViewBuilderNoCache({Key key}) : super(key: key);

  @override
  _ListViewBuilderNoCacheState createState() => _ListViewBuilderNoCacheState();
}

class _ListViewBuilderNoCacheState extends State<ListViewBuilderNoCache> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Builder no cache'),
      ),
      body: ListView.builder(
        itemCount: 50,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Container(
                width: 250,
                height: 150,
                color: index == 0
                    ? Colors.transparent
                    : Colors.primaries[index % Colors.primaries.length],
                child: FittedBox(
                  child: index == 0
                      ? MyFistItem()
                      : index == 2
                          ? Text(
                              'Scroll up and down to see the\nlogo redraws itself every time')
                          : Text(index.toString()),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class MyFistItem extends StatefulWidget {
  MyFistItem({Key key}) : super(key: key);

  @override
  _MyFistItemState createState() => _MyFistItemState();
}

class _MyFistItemState extends State<MyFistItem> {
  @override
  void initState() {
    super.initState();
    print('initState my first item');
  }

  @override
  Widget build(BuildContext context) {
    print('build called');
    return TweenAnimationBuilder<double>(
      tween: Tween(begin: 0.0, end: 1.0),
      duration: const Duration(seconds: 2),
      builder: (context, animation, child) {
        return Opacity(
          opacity: animation,
          child: FlutterLogo(),
        );
      },
    );
  }
}
