import 'package:flutter/foundation.dart';

class AppLogs{
  static void printLog(String text) {
    if (kDebugMode) {
      debugPrint(text);
    }
  }

  static void printWrapped(dynamic text) {
    if (kDebugMode) {
      final pattern = new RegExp('.{1,800}'); // 800 is the size of each chunk
      pattern.allMatches(text).forEach((match) => debugPrint(match.group(0)));
    }
  }
}