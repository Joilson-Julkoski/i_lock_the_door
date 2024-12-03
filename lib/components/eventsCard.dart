import 'package:flutter/material.dart';
import 'package:i_lock_the_door/models/event.dart';
import 'package:i_lock_the_door/utils/date.dart';

class EventCard extends StatefulWidget {
  final EventDTO event;
  const EventCard({super.key, required this.event});

  @override
  State<EventCard> createState() => _EventCardState();
}

class _EventCardState extends State<EventCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16), color: Color(0xFFFEF3E7)),
      child: Column(children: [
        Text(widget.event.name,
            style: Theme.of(context)
                .textTheme
                .bodyLarge!
                .copyWith(fontSize: 12, fontWeight: FontWeight.w500)),
        Divider(),
        Row(
          children: [
            Icon(Icons.calendar_month_outlined),
            Text(
              "Todos os dias",
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge!
                  .copyWith(color: Color(0xFF707070)),
            ),
            Icon(Icons.watch),
            Text(
                "${formatTime(widget.event.startTime)} - ${formatTime(widget.event.endTime)}"),
          ],
        ),
        ElevatedButton(
          onPressed: () => {},
          child: Text("Alterar"),
          style: Theme.of(context).elevatedButtonTheme.style,
        )
      ]),
    );
  }
}
