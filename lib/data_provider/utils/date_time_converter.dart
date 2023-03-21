extension DateTimeExtension on DateTime {
  int toMillis() {
    return toUtc().millisecondsSinceEpoch;
  }
}

extension MillisecondsExtension on int {
  DateTime toDateTime() {
    return DateTime.fromMillisecondsSinceEpoch(this);
  }
}
