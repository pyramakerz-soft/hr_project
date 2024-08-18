DateTime getDatenowWithoutHours() {
  final now = DateTime.now();
  return DateTime(now.year, now.month, now.day);
}

DateTime getDatenowWithoutMins() {
  final now = DateTime.now();
  return DateTime(now.year, now.month, now.day, now.hour);
}
