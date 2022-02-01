import 'package:flutter/foundation.dart';
import 'package:logger/logger.dart';

final _logger = Logger(
  printer: PrettyPrinter(
    methodCount: 0,
    printEmojis: false,
  ),
);

class Print {
  static final Print _print = Print._internal();
  factory Print() {
    return _print;
  }

  Print._internal();

  final debug = kDebugMode;

  void d(dynamic message) {
    if (debug) {
      _logger.d(message);
    }
  }

  void i(dynamic message) {
    if (debug) {
      _logger.i(message);
    }
  }

  void e(dynamic message) {
    if (debug) {
      _logger.e(message);
    }
  }

  void v(dynamic message) {
    if (debug) {
      _logger.v(message);
    }
  }

  void w(dynamic message) {
    if (debug) {
      _logger.w(message);
    }
  }
}
