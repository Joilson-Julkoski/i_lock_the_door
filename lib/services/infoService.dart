import 'package:i_lock_the_door/models/infos.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

Future<InfosDTO> getInfosFromSection() async {
  final prefs = await SharedPreferences.getInstance();

  final bool locked = prefs.getBool("locked") ?? false;
  List<DateTime> history = [];

  final String? historyJson = prefs.getString("history");

  if (historyJson != null) {
    for (var e in jsonDecode(historyJson)) {
      history.add(DateTime.fromMillisecondsSinceEpoch(e));
    }
  }

  return InfosDTO(locked: locked, history: history);
}

Future<void> saveData(InfosDTO infos) async {
  final prefs = await SharedPreferences.getInstance();

  await prefs.setBool("locked", infos.locked);

  final String historyJson =
      jsonEncode(infos.history.map((e) => e.millisecondsSinceEpoch).toList());

  await prefs.setString("history", historyJson);
}
