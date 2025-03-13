extension DateTimeExtension on DateTime {
  bool isSameDay(DateTime otherDate) {
    DateTime today = DateTime.now();
    return otherDate.day == today.day &&
        otherDate.month == today.month &&
        otherDate.year == today.year;
  }

  bool isToday() {
    DateTime today = DateTime.now();
    return day == today.day && month == today.month && year == today.year;
  }

  bool isAfterToday() {
    DateTime today = DateTime(
        DateTime.now().year, DateTime.now().month, DateTime.now().day, 23, 59);
    return isAfter(today);
  }

  bool isBeforeToday() {
    DateTime today = DateTime(
        DateTime.now().year, DateTime.now().month, DateTime.now().day, 00, 00);
    return isBefore(today);
  }
}
