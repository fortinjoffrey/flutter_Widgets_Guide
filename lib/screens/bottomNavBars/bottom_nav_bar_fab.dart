import 'package:flutter/material.dart';

class BottomNavBarFAB extends StatefulWidget {
  BottomNavBarFAB({Key key}) : super(key: key);

  @override
  _BottomNavBarFABState createState() => _BottomNavBarFABState();
}

class _BottomNavBarFABState extends State<BottomNavBarFAB> {
  int _currentIndex = 0;

  List<Widget> _children = [
    PlaceholderWidget(color: Colors.red),
    PlaceholderWidget(color: Colors.green),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Bottom navigation bar')),
      bottomNavigationBar: BottomAppBar(
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
            'Simple bottom navigation bar with two bar items',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),
          ),
        ),
      ),
    );
  }
}
