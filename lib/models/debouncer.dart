// This class is used to delay searching (might be useful)
import 'dart:async';
import 'dart:ui';

class Debouncer {
  final int milliseconds;
  Timer _timer;

  Debouncer({this.milliseconds});

  run(VoidCallback action) {
    if (_timer != null) {
      _timer.cancel();
    }
    _timer = Timer(Duration(milliseconds: milliseconds), action);
  }
}
