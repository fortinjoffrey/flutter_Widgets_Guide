enum SolutionType { None, Worst, Medium, Best }

class Choice {
  final String title;
  final String routeName;
  final String subtitle;
  final SolutionType solution;

  const Choice(
    this.title,
    this.routeName, {
    this.subtitle = '',
    this.solution = SolutionType.None,
  });
}
