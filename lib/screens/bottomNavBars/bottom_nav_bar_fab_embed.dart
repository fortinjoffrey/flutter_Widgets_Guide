import 'package:flutter/material.dart';

// final firstkey = GlobalKey();
// final secondkey = GlobalKey();

class JosKeys {
  static final josKeys1 = GlobalKey();
  static final josKeys2 = GlobalKey();
}

class BottomNavBarFabEmbed extends StatefulWidget {
  BottomNavBarFabEmbed({Key key}) : super(key: key);

  @override
  _BottomNavBarFabEmbedState createState() => _BottomNavBarFabEmbedState();
}

class _BottomNavBarFabEmbedState extends State<BottomNavBarFabEmbed> {
  int _currentIndex = 0;

  List<Widget> _children = [
    PlaceholderWidget(color: Colors.red, key: JosKeys.josKeys1),
    PlaceholderWidget(color: Colors.green, key: JosKeys.josKeys2),
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
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add),
      ),
    );
  }

  void _handleOnTap(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}

class PlaceholderWidget extends StatelessWidget {
  const PlaceholderWidget({Key key, this.color}) : super(key: key);

  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: color,
      child: Center(
        child: Container(
          color: Colors.white,
          padding: EdgeInsets.all(16.0),
          child: Text(
            'Bottom navigation bar with two bar items. FloatingActionButton embedded',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),
          ),
        ),
      ),
    );
  }
}
