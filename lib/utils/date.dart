import 'package:intl/intl.dart';

String formatTime(DateTime dateTime) {
  final DateFormat formatter = DateFormat('hh:mm a'); // Formato 12h com AM/PM
  return formatter
      .format(dateTime); // Converte o DateTime para string formatada
}

String formatDate(DateTime dateTime) {
  final DateFormat formatter = DateFormat('dd/MM/yyyy'); // Formato dia/mês/ano
  return formatter
      .format(dateTime); // Converte o DateTime para string formatada
}

DateTime updateTime(DateTime date, int hour, int minute) {
  return DateTime(
    date.year,
    date.month,
    date.day,
    hour,
    minute,
    date.second,
    date.millisecond,
    date.microsecond,
  );
}