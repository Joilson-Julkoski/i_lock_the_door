import 'package:intl/intl.dart';

String formatDateTime(DateTime dateTime) {
  final DateFormat formatter = DateFormat('hh:mm a'); // Formato 12h com AM/PM
  return formatter
      .format(dateTime); // Converte o DateTime para string formatada
}
