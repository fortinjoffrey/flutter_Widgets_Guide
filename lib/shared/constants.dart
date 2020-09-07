import 'package:widgets_guide/models/choice.dart';
import 'package:widgets_guide/models/planet.dart';
import 'package:widgets_guide/models/routes_name.dart';

const List<Choice> mainChoices = [
  Choice('List Views', RoutesName.listviews),
  Choice('SliverList (coming next)', RoutesName.sliverlists),
  Choice('Bottom Navigation Bar', RoutesName.bottomNavigationBar),
  Choice('Tab Bar', RoutesName.tabBar),
  Choice('Page View', RoutesName.pageView),
];

const List<Choice> listviewChoices = [
  Choice('Simple', RoutesName.listviewSimple),
  Choice('Dismissible', RoutesName.listviewDismissible),
  Choice('Slidable', RoutesName.listviewSlidable),
  Choice('Reordable', RoutesName.listviewReordable),
  Choice('Filterable', RoutesName.listviewFilterable),
  Choice('Animated', RoutesName.listviewAnimated),
  Choice('Builder no cache', RoutesName.listviewBuilderNoCache),
  Choice('Builder cache', RoutesName.listviewBuilderCache),
];

const List<Choice> bottomNavBarChoices = [
  Choice('Bottom Nav Bar + FAB', RoutesName.bottomNavBarFAB,
      subtitle: 'FloatingButtonAction above bar'),
  Choice('Bottom Nav Bar + FAB embedded', RoutesName.bottomNavBarFabEmbed,
      subtitle: 'FloatingButtonAction inside bar'),
  Choice('Bottom Nav Bar + Shared state', RoutesName.bottomNavBarSameState,
      subtitle:
          'State: shared\nInitialisation: 1 initState call\nSwitching: only build calls'),
  Choice(
    'Bottom Nav Bar + Multiple states',
    RoutesName.bottomNavBarDifferentState,
    subtitle:
        'Initialisation: 1 initState call\nSwitching: init and build calls',
    solution: SolutionType.Worst,
  ),
  Choice(
    'Bottom Nav Bar Keep Alive',
    RoutesName.bottomNavBarKeepAlive,
    subtitle: 'Initialisation: 3 initState calls\nSwitching: no calls',
    solution: SolutionType.Medium,
  ),
  Choice(
    'Bottom Nav Bar Keep Alive Optimised',
    RoutesName.bottomNavBarKeepAliveOptimised,
    subtitle:
        'Initialisation: 1 initState call\nSwitching: initState and build if tab was never displayed',
    solution: SolutionType.Best,
  ),
];

const List<Choice> tabBarChoices = [
  Choice('Tab bar no keep alive', RoutesName.tabBarNoKeepAlive),
  Choice('Tab bar keep alive', RoutesName.tabBarKeepAlive),
];

const List<Choice> pageViewChoices = [
  Choice('Page View Simple', RoutesName.pageViewSimple),
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
