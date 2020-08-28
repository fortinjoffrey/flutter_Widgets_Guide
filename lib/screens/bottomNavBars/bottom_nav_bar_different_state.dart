import 'package:flutter/material.dart';

class CustomKeys {
  static final todosKey = GlobalKey();
  static final settingsKey = GlobalKey();
}

class BottomNavBarDifferentState extends StatefulWidget {
  BottomNavBarDifferentState({Key key}) : super(key: key);

  @override
  _BottomNavBarDifferentStateState createState() =>
      _BottomNavBarDifferentStateState();
}

class _BottomNavBarDifferentStateState
    extends State<BottomNavBarDifferentState> {
  int _currentIndex = 0;

  List<Widget> _children = [
    PlaceholderWidget(
        color: Colors.red, key: CustomKeys.todosKey, title: 'Todos'),
    PlaceholderWidget(
        color: Colors.green, key: CustomKeys.settingsKey, title: 'Settings'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Bottom navigation bar')),
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
              title: Text("Todos"),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              title: Text("Settings"),
            ),
          ],
        ),
      ),
      body: _children[_currentIndex],
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
    print('initState called');
  }

  @override
  Widget build(BuildContext context) {
    print('build called');
    return Scaffold(
      floatingActionButton: FloatingActionButton(
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
            child: Center(
              child: Text(
                widget.title,
                style: TextStyle(fontSize: 32.0, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Expanded(
            child: Center(
                child: Text(
              'Counter = $_counter',
              style:
                  TextStyle(fontWeight: FontWeight.bold, color: widget.color),
            )),
          ),
          Expanded(
            child: Container(
              color: Colors.white,
              padding: EdgeInsets.all(16.0),
              child: Text(
                'Todos and Settings are \'PlaceholderWidget\' type\nEach widget has its own key, therefore its own state\nEach gets dispose when switching tabs\nThat may be a problem if you want to keep the widget alive',
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    print('dispose called');
  }
}