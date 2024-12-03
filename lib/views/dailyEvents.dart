import 'package:flutter/material.dart';
import 'package:i_lock_the_door/components/eventsCard.dart';
import 'package:i_lock_the_door/components/header.dart';
import 'package:i_lock_the_door/models/event.dart';
import 'package:i_lock_the_door/models/infos.dart';

class DailyEventsView extends StatefulWidget {
  final InfosDTO userInfo;
  const DailyEventsView({super.key, required this.userInfo});

  @override
  State<DailyEventsView> createState() => _DailyEventsViewState();
}

class _DailyEventsViewState extends State<DailyEventsView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Header(
            title: "Agendar seus",
            darkTitle: "Lembretes Diários",
            backCallback: () => Navigator.pop(context),
            text: "Configure horários de saída",
          ),
          Padding(padding: EdgeInsets.all(20)),
          EventCard(
            event: EventDTO(
                days: [],
                endTime: DateTime.now(),
                startTime: DateTime.now(),
                name: "teste"),
          )
        ],
      ),
    );
  }
}
