import 'package:flutter/material.dart';

class TabBarNoKeepAlive extends StatelessWidget {
  const TabBarNoKeepAlive({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Tab bar view no keep alive'),
        ),
        body: DefaultTabController(
          length: 3,
          child: Column(
            children: [
              TabBar(
                tabs: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('Page 1'),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('Page 2'),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('Page 3'),
                  ),
                ],
              ),
              Expanded(
                child: TabBarView(
                  children: [
                    PageTab(title: 'Page 1', color: Colors.red),
                    PageTab(title: 'Page 2', color: Colors.white70),
                    PageTab(title: 'Page 3', color: Colors.cyan),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class PageTab extends StatefulWidget {
  PageTab({Key key, this.title, this.color}) : super(key: key);

  final String title;
  final Color color;

  @override
  _PageTabState createState() => _PageTabState();
}

class _PageTabState extends State<PageTab> {
  bool loading = true;

  void loadData() async {
    await Future.delayed(const Duration(seconds: 2));
    if (this.mounted) {
      setState(() {
        loading = false;
      });
    }
  }

  @override
  void initState() {
    loadData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: widget.color,
      child: Center(
          child: loading
              ? CircularProgressIndicator()
              : Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      widget.title,
                      style: Theme.of(context).textTheme.headline4,
                    ),
                    Text('The page reinit state each time')
                  ],
                )),
    );
  }
}
