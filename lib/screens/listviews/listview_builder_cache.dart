import 'package:flutter/material.dart';

class ListViewBuilderCache extends StatefulWidget {
  ListViewBuilderCache({Key key}) : super(key: key);

  @override
  _ListViewBuilderCacheState createState() => _ListViewBuilderCacheState();
}

class _ListViewBuilderCacheState extends State<ListViewBuilderCache> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Builder cache'),
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
                              'Scroll up and down to check\nif the logo redraws itself')
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

class _MyFistItemState extends State<MyFistItem>
    with AutomaticKeepAliveClientMixin {
  @override
  void initState() {
    super.initState();
    print('initState my first item');
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
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

  @override
  bool get wantKeepAlive => true;
}
