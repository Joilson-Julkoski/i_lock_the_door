import 'package:flutter/material.dart';
import 'package:i_lock_the_door/models/event.dart';
import 'package:i_lock_the_door/models/history.dart';
import 'package:i_lock_the_door/models/infos.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

Future<InfosDTO> getInfosFromSection() async {
  final prefs = await SharedPreferences.getInstance();

  final bool locked = prefs.getBool("locked") ?? false;
  List<HistoryDTO> history = [];

  final String? historyJson = prefs.getString("history");

  if (historyJson != null) {
    for (var e in jsonDecode(historyJson)) {
      history.add(HistoryDTO.fromJson(e));
    }
  }

  List<EventDTO> events = [];

  final String? eventsJson = prefs.getString("events");

  if (eventsJson != null) {
    for (var e in jsonDecode(eventsJson)) {
      events.add(EventDTO.fromJson(e));
    }
  }

  return InfosDTO(locked: locked, history: history, events: events);
}

Future<void> saveData(InfosDTO infos) async {
  final prefs = await SharedPreferences.getInstance();

  await prefs.setBool("locked", infos.locked);

  final String historyJson =
      jsonEncode(infos.history.map((e) => e.toJson()).toList());

  await prefs.setString("history", historyJson);
}

Future<List<EventDTO>> getEvents() async {
  final prefs = await SharedPreferences.getInstance();

  final String? eventsJson = prefs.getString("events");

  List<EventDTO> events = [];

  if (eventsJson != null) {
    for (var e in jsonDecode(eventsJson)) {
      events.add(EventDTO.fromJson(e));
    }
  }
  return events;
}

Future<void> saveEvent(EventDTO event) async {
  final prefs = await SharedPreferences.getInstance();

  List<EventDTO> events = await getEvents();
  events.add(event);

  final String eventsString =
      jsonEncode(events.map((e) => e.toJson()).toList());

  await prefs.setString("events", eventsString);
}
