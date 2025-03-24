import 'dart:developer' as developer;



class Logger {
 
  static void error(String message) {
    developer.log(message, error: true);
  }

  static void success(String message) {
    developer.log(message);
  }

  static void info(String message) {
    developer.log(message);
  }
}