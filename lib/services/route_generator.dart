import 'package:flutter/material.dart';
import 'package:widgets_guide/models/routes_name.dart';
import 'package:widgets_guide/screens/home.dart';
import 'package:widgets_guide/screens/listviews/listview_dismissible.dart';
import 'package:widgets_guide/screens/listviews/listview_simple.dart';
import 'package:widgets_guide/screens/listviews/listview_slidable.dart';
import 'package:widgets_guide/screens/listviews_home.dart';
import 'package:widgets_guide/screens/sliverlists_home.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    //final args = settings.arguments;

    String routeName = settings.name;

    switch (routeName) {
      case RoutesName.home:
        return MaterialPageRoute(builder: (_) => Home());
      case RoutesName.listviews:
        return MaterialPageRoute(builder: (_) => ListViewsHome());
      case RoutesName.listviewSimple:
        return MaterialPageRoute(builder: (_) => ListViewSimple());
      case RoutesName.listviewDismissible:
        return MaterialPageRoute(builder: (_) => ListViewDismissible());
      case RoutesName.listviewSlidable:
        return MaterialPageRoute(builder: (_) => ListViewSlidable());
      case RoutesName.sliverlists:
        return MaterialPageRoute(builder: (_) => SliverListsHome());
      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(
      builder: (context) {
        return Scaffold(
          appBar: AppBar(
            title: Text('Error'),
          ),
          body: Center(
            child: Text('ERROR'),
          ),
        );
      },
    );
  }
}
