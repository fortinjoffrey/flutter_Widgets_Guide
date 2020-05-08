import 'package:flutter/material.dart';

class ListViewSimple extends StatelessWidget {
  const ListViewSimple({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('List View Simple'),
      ),
      body: Center(
        child: Text('List View Simple'),
      ),
    );
  }
}
