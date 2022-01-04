
import 'package:intl/intl.dart';

String chatDateFormat(
    DateTime dateTime, {
      DateFormat? dateFormat,
      String? dateLocale,
      DateFormat? timeFormat,
    }) {
  final formattedDate = dateFormat != null
      ? dateFormat.format(dateTime)
      : DateFormat.MMMd(dateLocale).format(dateTime);
  final formattedTime = timeFormat != null
      ? timeFormat.format(dateTime)
      : DateFormat.Hm(dateLocale).format(dateTime);
  final localDateTime = dateTime.toLocal();
  final now = DateTime.now();

  if (localDateTime.day == now.day &&
      localDateTime.month == now.month &&
      localDateTime.year == now.year) {
    return formattedTime;
  }

  return '$formattedDate, $formattedTime';
}