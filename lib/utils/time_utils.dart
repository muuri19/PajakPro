import 'package:flutter/foundation.dart';

class TimeUtils {
  static int measureExecution(Function function) {
    var stopwatch = Stopwatch()..start();
    function();
    stopwatch.stop();
    return stopwatch.elapsedMicroseconds;
  }
}
