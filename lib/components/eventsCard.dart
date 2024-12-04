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
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16), color: Color(0xFFFEF3E7)),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(widget.event.name,
            style: Theme.of(context)
                .textTheme
                .bodyLarge!
                .copyWith(fontSize: 12, fontWeight: FontWeight.w800)),
        Divider(
          color: Color(0x4AD9D8D8),
        ),
        SizedBox(
          height: 15,
        ),
        Row(
          children: [
            Row(
              children: [
                Icon(Icons.calendar_month_outlined, color: Color(0xFFD6CCC6)),
                SizedBox(
                  width: 5,
                ),
                Text(
                  "Todos os dias",
                  style: Theme.of(context)
                      .textTheme
                      .labelLarge!
                      .copyWith(color: Color(0xFF707070)),
                ),
              ],
            ),
            SizedBox(width: 20),
            Row(
              children: [
                Icon(
                  Icons.watch,
                  color: Color(0xFFD6CCC6),
                ),
                SizedBox(
                  width: 5,
                ),
                Text(
                  "${formatTime(widget.event.startTime)} - ${formatTime(widget.event.endTime)}",
                  style: Theme.of(context)
                      .textTheme
                      .labelLarge!
                      .copyWith(color: Color(0xFF707070)),
                ),
              ],
            )
          ],
        ),
        SizedBox(
          height: 20,
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
