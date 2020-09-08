import 'package:flutter/material.dart';

class BottomNavBarKeepAlive extends StatefulWidget {
  BottomNavBarKeepAlive({Key key}) : super(key: key);

  @override
  _BottomNavBarKeepAliveState createState() => _BottomNavBarKeepAliveState();
}

class _BottomNavBarKeepAliveState extends State<BottomNavBarKeepAlive> {
  int _currentIndex = 0;

  List<Widget> _children = [
    PlaceholderWidget(color: Colors.red, title: 'Todos'),
    PlaceholderWidget(color: Colors.blue, title: 'Profile'),
    PlaceholderWidget(color: Colors.green, title: 'Settings'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Keep states alive')),
      bottomNavigationBar: BottomAppBar(
        notchMargin: 5,
        shape: CircularNotchedRectangle(),
        color: Colors.white,
        child: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: _handleOnTap,
          elevation: 0,
          backgroundColor: Colors.transparent,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.list),
              label: 'Todos',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.face),
              label: 'Profile',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: 'Settings',
            ),
          ],
        ),
      ),
      body: IndexedStack(
        children: [
          _children[0],
          _children[1],
          _children[2],
        ],
        index: _currentIndex,
      ),
    );
  }

  void _handleOnTap(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}

class PlaceholderWidget extends StatefulWidget {
  const PlaceholderWidget({Key key, this.color, this.title}) : super(key: key);
  final Color color;
  final String title;

  @override
  _PlaceholderWidgetState createState() => _PlaceholderWidgetState();
}

class _PlaceholderWidgetState extends State<PlaceholderWidget> {
  int _counter = 0;

  @override
  void initState() {
    super.initState();
    print(widget.title + ' initState called');
  }

  @override
  Widget build(BuildContext context) {
    print('build called');
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        heroTag: null,
        child: Icon(Icons.add),
        onPressed: () {
          setState(() {
            _counter++;
          });
        },
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    widget.title,
                    style:
                        TextStyle(fontSize: 32.0, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'Counter = $_counter',
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: widget.color),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Description',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10.0),
                  Text(
                    'State is persisted even on tab switching',
                  ),
                  SizedBox(height: 10.0),
                  Text(
                    'Solution',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10.0),
                  Text(
                    'IndexedStack',
                  ),
                  SizedBox(height: 10.0),
                  Text(
                    'Downside',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10.0),
                  Text(
                    'All widgets are initiated on BottomNavBarKeepAlive creation',
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    print('dispose called');
    super.dispose();
  }
}
