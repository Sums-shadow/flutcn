import 'package:ansicolor/ansicolor.dart';

class Logger {
  static final _errorPen = AnsiPen()..red();
  static final _successPen = AnsiPen()..green();
  static final _infoPen = AnsiPen()..blue();

  static void error(String message) {
    print(_errorPen('ERROR: $message'));
  }

  static void success(String message) {
    print(_successPen('SUCCESS: $message'));
  }

  static void info(String message) {
    print(_infoPen('INFO: $message'));
  }
}