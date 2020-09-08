import 'package:flutter/material.dart';

class BottomNavBarKeepAliveOptimised extends StatefulWidget {
  BottomNavBarKeepAliveOptimised({Key key}) : super(key: key);

  @override
  _BottomNavBarKeepAliveOptimisedState createState() =>
      _BottomNavBarKeepAliveOptimisedState();
}

class _BottomNavBarKeepAliveOptimisedState
    extends State<BottomNavBarKeepAliveOptimised> {
  PageController _pageController = PageController();
  List<Widget> _pages = [
    PlaceholderWidget(color: Colors.red, title: 'Todos'),
    PlaceholderWidget(color: Colors.blue, title: 'Profile'),
    PlaceholderWidget(color: Colors.green, title: 'Settings'),
  ];

  int _selectedIndex = 0;

  void _onPageChanged(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _onItemTapped(int selectedIndex) {
    _pageController.jumpToPage(selectedIndex);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Keep states alive optimised')),
      bottomNavigationBar: BottomAppBar(
        notchMargin: 5,
        shape: CircularNotchedRectangle(),
        color: Colors.white,
        child: BottomNavigationBar(
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
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
      body: PageView(
        controller: _pageController,
        children: _pages,
        onPageChanged: _onPageChanged,
        physics: NeverScrollableScrollPhysics(),
      ),
    );
  }
}

class PlaceholderWidget extends StatefulWidget {
  const PlaceholderWidget({Key key, this.color, this.title}) : super(key: key);
  final Color color;
  final String title;

  @override
  _PlaceholderWidgetState createState() => _PlaceholderWidgetState();
}

class _PlaceholderWidgetState extends State<PlaceholderWidget>
    with AutomaticKeepAliveClientMixin {
  int _counter = 0;

  @override
  void initState() {
    super.initState();
    print(widget.title + ' initState called');
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
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
                    'State is persisted even on tab switching',
                  ),
                  SizedBox(height: 10.0),
                  Text(
                    'Solution',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10.0),
                  Text(
                    'PageController',
                  ),
                  SizedBox(height: 10.0),
                  Text(
                    'Downside',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10.0),
                  Text(
                    'Widgets are initiated if tapped',
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
    print(widget.title + ' dispose called');
    super.dispose();
  }

  @override
  bool get wantKeepAlive => true;
}
