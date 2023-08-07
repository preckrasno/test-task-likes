import 'dart:developer' as developer;

// Blue text
void logInfo(
  String? msg, {
  String? file,
  String? className,
  String? method,
}) {
  _logMessage(
    msg,
    color: '34',
    file: file,
    className: className,
    method: method,
  );
}

// Green text
void logSuccess(
  String? msg, {
  String? file,
  String? className,
  String? method,
}) {
  _logMessage(
    msg,
    color: '32',
    file: file,
    className: className,
    method: method,
  );
}

// Yellow text
void logWarning(
  String? msg, {
  String? file,
  String? className,
  String? method,
}) {
  _logMessage(
    msg,
    color: '33',
    file: file,
    className: className,
    method: method,
  );
}

// Red text
void logError(
  String? msg, {
  String? file,
  String? className,
  String? method,
}) {
  _logMessage(
    msg,
    color: '31',
    file: file,
    className: className,
    method: method,
  );
}

void _logMessage(
  String? msg, {
  required String color,
  String? file,
  String? className,
  String? method,
}) {
  String messagePrefix = '\x1B[${color}m';
  String messageSuffix = '\x1B[0m';

  String fileLocal = file != null ? ', File: $file' : '';
  String classNameLocal = className != null ? ', Class: $className' : '';
  String methodLocal = method != null ? ', Method: $method' : '';

  developer.log(
      '$messagePrefix$msg$fileLocal$classNameLocal$methodLocal$messageSuffix');
}
