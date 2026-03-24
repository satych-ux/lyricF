import 'dart:developer' as developer;

/// Logs to the Dart/Flutter debug console (DevTools, `flutter run`). Strips out in release builds.
void debugAiLog(String message, {String name = 'LyricFlow.AI'}) {
  assert(() {
    developer.log(message, name: name);
    return true;
  }());
}
