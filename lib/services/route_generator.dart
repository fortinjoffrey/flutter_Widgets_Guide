import 'package:flutter/material.dart';
import 'package:widgets_guide/models/routes_name.dart';
import 'package:widgets_guide/screens/bottomNavBars/bottom_nav_bar_different_state.dart';
import 'package:widgets_guide/screens/bottomNavBars/bottom_nav_bar_fab.dart';
import 'package:widgets_guide/screens/bottomNavBars/bottom_nav_bar_fab_embedded.dart';
import 'package:widgets_guide/screens/bottomNavBars/bottom_nav_bar_same_state.dart';
import 'package:widgets_guide/screens/bottom_nav_bar_home.dart';
import 'package:widgets_guide/screens/home.dart';
import 'package:widgets_guide/screens/listviews/listview_animated.dart';
import 'package:widgets_guide/screens/listviews/listview_builder_cache.dart';
import 'package:widgets_guide/screens/listviews/listview_builder_no_cache.dart';
import 'package:widgets_guide/screens/listviews/listview_dismissible.dart';
import 'package:widgets_guide/screens/listviews/listview_filterable.dart';
import 'package:widgets_guide/screens/listviews/listview_reordable.dart';
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
      case RoutesName.listviewReordable:
        return MaterialPageRoute(builder: (_) => ListViewReordable());
      case RoutesName.listviewFilterable:
        return MaterialPageRoute(builder: (_) => ListViewFilterable());
      case RoutesName.listviewAnimated:
        return MaterialPageRoute(builder: (_) => ListViewAnimated());
      case RoutesName.listviewBuilderNoCache:
        return MaterialPageRoute(builder: (_) => ListViewBuilderNoCache());
      case RoutesName.listviewBuilderCache:
        return MaterialPageRoute(builder: (_) => ListViewBuilderCache());
      case RoutesName.sliverlists:
        return MaterialPageRoute(builder: (_) => SliverListsHome());
      case RoutesName.bottomNavigationBar:
        return MaterialPageRoute(builder: (_) => BottomNavBarHome());
      case RoutesName.bottomNavBarFAB:
        return MaterialPageRoute(builder: (_) => BottomNavBarFAB());
      case RoutesName.bottomNavBarFabEmbed:
        return MaterialPageRoute(builder: (_) => BottomNavBarFabEmbedded());
      case RoutesName.bottomNavBarSameState:
        return MaterialPageRoute(builder: (_) => BottomNavBarSameState());
      case RoutesName.bottomNavBarDifferentState:
        return MaterialPageRoute(builder: (_) => BottomNavBarDifferentState());
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
