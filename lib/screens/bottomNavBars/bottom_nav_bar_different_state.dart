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
      appBar: AppBar(title: Text('Multiple states')),
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
              icon: Icon(Icons.settings),
              label: 'Settings',
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
            child: Container(
              width: double.infinity,
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
              width: double.infinity,
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
                    'Each widget has its own key, therefore its own state',
                  ),
                  SizedBox(height: 10.0),
                  Text(
                    'Downside',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10.0),
                  Text(
                    'Each gets dispose when switching tabs\nThat\'s a problem if you want to keep the widget state alive',
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
    super.dispose();
    print('dispose called');
  }
}
