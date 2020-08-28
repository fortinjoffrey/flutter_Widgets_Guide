import 'package:widgets_guide/models/choice.dart';
import 'package:widgets_guide/models/planet.dart';
import 'package:widgets_guide/models/routes_name.dart';

const List<Choice> mainChoices = [
  Choice('List Views', RoutesName.listviews),
  Choice('SliverList (coming next)', RoutesName.sliverlists),
  Choice('Bottom Navigation Bar', RoutesName.bottomNavigationBar),
];

const List<Choice> listviewChoices = [
  Choice('Simple', RoutesName.listviewSimple),
  Choice('Dismissible', RoutesName.listviewDismissible),
  Choice('Slidable', RoutesName.listviewSlidable),
  Choice('Reordable', RoutesName.listviewReordable),
  Choice('Filterable', RoutesName.listviewFilterable),
  Choice('Animated', RoutesName.listviewAnimated),
];

const List<Planet> planetsTemplate = [
  Planet('Mercury', 4879.4),
  Planet('Venus', 12104),
  Planet('Earth', 12742),
  Planet('Mars', 6779),
  Planet('Jupiter', 139820),
  Planet('Saturn', 116460),
  Planet('Neptune', 49244),
];
