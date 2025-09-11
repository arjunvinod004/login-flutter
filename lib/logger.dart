/// # Logger Class Documentation
///
/// A comprehensive logging utility for Flutter applications that provides both debug
/// and production logging capabilities with visual formatting and detailed output.
///
/// ## Features
/// - Debug and Production mode logging
/// - Colored output with icons
/// - Box-style message formatting
/// - Timestamp inclusion
/// - Source file and line number tracking (Debug mode)
/// - Additional data object support (Debug mode)
///
/// ## Log Levels
/// The logger supports the following log levels:
/// - info    💡 Blue    - General information messages
/// - warning ⚠  Yellow  - Warning messages
/// - error   ❌ Red     - Error messages
/// - debug   🔍 Gray    - Debug information
/// - wtf     💥 Purple  - Unexpected errors
/// - success ✅ Green   - Success messages
/// - fail    ❌ Red     - Failure messages
/// - todo    📝 Pink    - TODO reminders
///
/// ## Usage Examples
///
/// ### Debug Mode Logging
/// ```dart
///  Basic debug logging
/// Logger.dinfo('User logged in successfully');
///
///  Debug logging with source information and data
/// Logger.derror(
///   'Failed to load user data',
///   sourcePath: 'user_service.dart',
///   lineNumber: 42,
///   data: {
///     'userId': '123',
///     'error': 'Network timeout'
///   }
/// );
/// ```
///
/// ### Production Mode Logging
/// ```dart
///  Basic production logging
/// Logger.pinfo('Application started');
/// Logger.perror('Failed to connect to server');
/// ```
///
/// ### Custom Logging
/// ```dart
///  Custom debug logging
/// Logger.dcustom(
///   level: 'Custom',
///   message: 'Custom debug message',
///   color: '\x1B[36m', // Cyan color
///   icon: '🚀',
///   sourcePath: 'custom_service.dart',
///   lineNumber: 100,
///   data: {'custom': 'data'}
/// );
///
///  Custom production logging
/// Logger.pcustom(
///   level: 'Custom',
///   message: 'Custom production message',
///   color: '\x1B[36m',
///   icon: '🚀'
/// );
/// ```
///
/// ## Debug Mode Methods
/// All debug mode methods (`d` prefix) accept the following parameters:
/// - message: String (required) - The log message
/// - sourcePath: String? (optional) - Source file path
/// - lineNumber: int? (optional) - Line number in source file
/// - data: Map<String, dynamic>? (optional) - Additional data to log
///
/// Available methods:
/// ```dart
/// dinfo()    // Information messages
/// dwarning() // Warning messages
/// derror()   // Error messages
/// ddebug()   // Debug messages
/// dwtf()     // Unexpected error messages
/// dsuccess() // Success messages
/// dfail()    // Failure messages
/// dtodo()    // TODO messages
/// ```
///
/// ## Production Mode Methods
/// All production mode methods (`p` prefix) accept only the message parameter:
/// - message: String (required) - The log message
///
/// Available methods:
/// ```dart
/// pinfo()    // Information messages
/// pwarning() // Warning messages
/// perror()   // Error messages
/// pdebug()   // Debug messages
/// pwtf()     // Unexpected error messages
/// psuccess() // Success messages
/// pfail()    // Failure messages
/// ptodo()    // TODO messages
/// ```
///
/// ## Output Format
/// The logger outputs messages in a box format with the following structure:
/// ```
/// ┌────────────────────────────────────────────────────────────┐
/// │ 12:34:56.789 PM
/// │ 💡 Info message
/// ├────────────────────────────────────────────────────────────┤
/// │ #42  source_file.dart
/// │ 💡 This is the actual log message
/// │ {
/// │   "key": "value"
/// │ }
/// └────────────────────────────────────────────────────────────┘
/// ```
///
/// ## Note
/// Debug mode logging only works when `kDebugMode` is true (i.e., during development).
/// Production mode logging works in all environments but provides less detailed output.

// Basic Debug Mode Examples - More detailed logging for development
// void debugModeExamples() {
//    Basic info log
//   Logger.dinfo(
//     'User logged in',
//     sourcePath: 'login_screen.dart',
//     lineNumber: 42
//   );

//    Warning with data
//   Logger.dwarning(
//     'Low memory warning',
//     sourcePath: 'app.dart',
//     lineNumber: 23,
//     data: {
//       'availableMemory': '50MB',
//       'threshold': '100MB'
//     }
//   );

//    Error with exception details
//   Logger.derror(
//     'Failed to load data',
//     sourcePath: 'api_service.dart',
//     lineNumber: 89,
//     data: {
//       'error': 'Network timeout',
//       'statusCode': 408
//     }
//   );

//    Debug information
//   Logger.ddebug(
//     'API Response received',
//     data: {'responseTime': '200ms'}
//   );

//    Success message
//   Logger.dsuccess('Data saved successfully');

//    Failure message
//   Logger.dfail('Operation failed');

//  Logger.dtodo('Implement error handling');
// }

//  Production Mode Examples - Simpler logging for production
// void productionModeExamples() {
//    Basic info log
//   Logger.pinfo('Application started');

//    Warning message
//   Logger.pwarning('Server response slow');

//    Error message
//   Logger.perror('Failed to connect to server');

//   Success message
//   Logger.psuccess('Transaction completed');

//   Debug message
//   Logger.pdebug('Cache cleared');
// }

//  Custom Logging Examples
// void customLoggingExamples() {
//    Custom debug log
//   Logger.dcustom(
//     level: 'NETWORK',
//     message: 'Socket connected',
//     color: '\x1B[36m', // Cyan
//     icon: '🌐',
//     data: {'socketId': 'sock_123'}
//   );

//    Custom production log
//   Logger.pcustom(
//     level: 'METRICS',
//     message: 'Daily users: 1000',
//     color: '\x1B[36m',
//     icon: '📊'
//   );
// }

import 'package:flutter/foundation.dart';

enum LogLevel { info, warning, error, debug, wtf, success, fail, todo }

class Logger {
  static const String _reset = '\x1B[0m';
  static const String _bold = '\x1B[1m';

  // Colors
  static const String _blue = '\x1B[34m';
  static const String _yellow = '\x1B[33m';
  static const String _red = '\x1B[31m';
  static const String _gray = '\x1B[90m';
  static const String _green = '\x1B[32m';
  static const String _purple = '\x1B[35m';
  static const String _pink = '\x1B[38;5;205m';

  // Box drawing characters
  static const String _topLeft = '┌';
  static const String _topRight = '┐';
  static const String _bottomLeft = '└';
  static const String _bottomRight = '┘';
  static const String _horizontal = '─';
  static const String _vertical = '│';

  // Time formatting
  static String _getFormattedTime() {
    final now = DateTime.now();
    final hour =
        now.hour % 12 == 0 ? 12 : now.hour % 12; // Convert to 12-hour format
    final period = now.hour >= 12 ? 'PM' : 'AM'; // Determine AM or PM

    return '${hour.toString().padLeft(2, '0')}:${now.minute.toString().padLeft(2, '0')}:${now.second.toString().padLeft(2, '0')}.${now.millisecond.toString().padLeft(3, '0')} $period';
  }

  static String _createBorder(String color, {bool isTop = true}) {
    final leftCorner = isTop ? _topLeft : _bottomLeft;
    final rightCorner = isTop ? _topRight : _bottomRight;
    return '$color$_bold$leftCorner${_horizontal * 60}$rightCorner$_reset';
  }

  // Debug-mode base logging function
  static void _debugLog({
    required String level,
    required String message,
    required String color,
    String? icon,
    String? sourcePath,
    int? lineNumber,
    Map<String, dynamic>? data,
  }) {
    if (kDebugMode) {
      // Create top border
      print(_createBorder(color, isTop: true));
      // Print timestamp with level and icon
      print(
          '$color$_bold$_vertical$_reset $_gray${_getFormattedTime()}$_reset');
      if (icon != null) {
        print('$color$_bold$_vertical$_reset $color$icon $level$_reset');
      }
      print(_createBorder(color, isTop: true));
      // Print source information if provided
      if (sourcePath != null && lineNumber != null) {
        print(
            '$color$_bold$_vertical$_reset $_gray#$lineNumber$_reset  $_bold$sourcePath$_reset');
      }
      // Print message with icon
      print('$color$_bold$_vertical$_reset $color$icon $message$_reset');

      // Enhanced data printing
      if (data != null && data.isNotEmpty) {
        print('$color$_bold$_vertical$_reset $_gray{');

        // Get the longest key for proper alignment
        final int maxKeyLength = data.keys
            .map((key) => key.length)
            .reduce((max, length) => length > max ? length : max);

        // Sort keys alphabetically for consistent output
        final sortedKeys = data.keys.toList()..sort();

        for (final key in sortedKeys) {
          final value = data[key];
          final padding = ' ' * (maxKeyLength - key.length);

          if (value == null) {
            print('$color$_bold$_vertical$_reset   "$key":$padding null');
          } else if (value is String) {
            print('$color$_bold$_vertical$_reset   "$key":$padding "$value"');
          } else if (value is num || value is bool) {
            print('$color$_bold$_vertical$_reset   "$key":$padding $value');
          } else if (value is List) {
            print('$color$_bold$_vertical$_reset   "$key":$padding [');
            for (var i = 0; i < value.length; i++) {
              final item = value[i];
              final isLast = i == value.length - 1;
              final comma = isLast ? '' : ',';
              if (item is String) {
                print('$color$_bold$_vertical$_reset     "$item"$comma');
              } else {
                print('$color$_bold$_vertical$_reset     $item$comma');
              }
            }
            print('$color$_bold$_vertical$_reset   ]');
          } else if (value is Map) {
            print('$color$_bold$_vertical$_reset   "$key":$padding {');
            value.forEach((mapKey, mapValue) {
              if (mapValue is String) {
                print(
                    '$color$_bold$_vertical$_reset     "$mapKey": "$mapValue"');
              } else {
                print('$color$_bold$_vertical$_reset     "$mapKey": $mapValue');
              }
            });
            print('$color$_bold$_vertical$_reset   }');
          } else {
            print('$color$_bold$_vertical$_reset   "$key":$padding $value');
          }
        }

        print('$color$_bold$_vertical$_reset $_gray}$_reset');
      }

      // Create bottom border
      print(_createBorder(color, isTop: false));
    }
  }

  // Production-mode base logging function
  static void _productionLog({
    required String level,
    required String message,
    required String color,
    required String icon,
  }) {
    // Create top border
    print(_createBorder(color, isTop: true));

    // Print timestamp and level
    print('$color$_bold$_vertical$_reset $_gray${_getFormattedTime()}$_reset');
    print('$color$_bold$_vertical$_reset $color$icon $level$_reset');
    print(_createBorder(color, isTop: true));

    // Print message
    print('$color$_bold$_vertical$_reset $color$icon $message$_reset');

    // Create bottom border
    print(_createBorder(color, isTop: false));
  }

  // Debug-mode logging methods
  static void dinfo(String message,
      {String? sourcePath, int? lineNumber, Map<String, dynamic>? data}) {
    _debugLog(
      level: 'Info message',
      message: message,
      color: _blue,
      icon: '💡',
      sourcePath: sourcePath,
      lineNumber: lineNumber,
      data: data,
    );
  }

  static void dwarning(String message,
      {String? sourcePath, int? lineNumber, Map<String, dynamic>? data}) {
    _debugLog(
      level: 'Just a warning!',
      message: message,
      color: _yellow,
      icon: '⚠',
      sourcePath: sourcePath,
      lineNumber: lineNumber,
      data: data,
    );
  }

  static void derror(String message,
      {String? sourcePath, int? lineNumber, Map<String, dynamic>? data}) {
    _debugLog(
      level: 'Test Error',
      message: message,
      color: _red,
      icon: '❌',
      sourcePath: sourcePath,
      lineNumber: lineNumber,
      data: data,
    );
  }

  static void ddebug(String message,
      {String? sourcePath, int? lineNumber, Map<String, dynamic>? data}) {
    _debugLog(
      level: 'Debug',
      message: message,
      color: _gray,
      icon: '🔍',
      sourcePath: sourcePath,
      lineNumber: lineNumber,
      data: data,
    );
  }

  static void dwtf(String message,
      {String? sourcePath, int? lineNumber, Map<String, dynamic>? data}) {
    _debugLog(
      level: 'WTF Error',
      message: message,
      color: _purple,
      icon: '💥',
      sourcePath: sourcePath,
      lineNumber: lineNumber,
      data: data,
    );
  }

  static void dsuccess(String message,
      {String? sourcePath, int? lineNumber, Map<String, dynamic>? data}) {
    _debugLog(
      level: 'Success',
      message: message,
      color: _green,
      icon: '✅',
      sourcePath: sourcePath,
      lineNumber: lineNumber,
      data: data,
    );
  }

  static void dfail(String message,
      {String? sourcePath, int? lineNumber, Map<String, dynamic>? data}) {
    _debugLog(
      level: 'Failure',
      message: message,
      color: _red,
      icon: '❌',
      sourcePath: sourcePath,
      lineNumber: lineNumber,
      data: data,
    );
  }

  static void dtodo(String message,
      {String? sourcePath, int? lineNumber, Map<String, dynamic>? data}) {
    _debugLog(
      level: 'TODO',
      message: message,
      color: _pink,
      icon: '📝',
      sourcePath: sourcePath,
      lineNumber: lineNumber,
      data: data,
    );
  }

  // Production-mode logging methods
  static void pinfo(String message) {
    _productionLog(
      level: 'Info message',
      message: message,
      color: _blue,
      icon: '💡',
    );
  }

  static void pwarning(String message) {
    _productionLog(
      level: 'Warning',
      message: message,
      color: _yellow,
      icon: '⚠',
    );
  }

  static void perror(String message) {
    _productionLog(
      level: 'Error',
      message: message,
      color: _red,
      icon: '❌',
    );
  }

  static void pdebug(String message) {
    _productionLog(
      level: 'Debug',
      message: message,
      color: _gray,
      icon: '🔍',
    );
  }

  static void pwtf(String message) {
    _productionLog(
      level: 'WTF Error',
      message: message,
      color: _purple,
      icon: '💥',
    );
  }

  static void psuccess(String message) {
    _productionLog(
      level: 'Success',
      message: message,
      color: _green,
      icon: '✅',
    );
  }

  static void pfail(String message) {
    _productionLog(
      level: 'Failure',
      message: message,
      color: _red,
      icon: '❌',
    );
  }

  static void ptodo(String message) {
    _productionLog(
      level: 'TODO',
      message: message,
      color: _pink,
      icon: '📝',
    );
  }

  // Custom loggers
  static void dcustom({
    required String level,
    required String message,
    required String color,
    String? icon,
    String? sourcePath,
    int? lineNumber,
    Map<String, dynamic>? data,
  }) {
    _debugLog(
      level: level,
      message: message,
      color: color,
      icon: icon,
      sourcePath: sourcePath,
      lineNumber: lineNumber,
      data: data,
    );
  }

  static void pcustom({
    required String level,
    required String message,
    required String color,
    required String icon,
  }) {
    _productionLog(
      level: level,
      message: message,
      color: color,
      icon: icon,
    );
  }
}
