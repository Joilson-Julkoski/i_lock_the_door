import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

@deprecated
class CustomCalendar extends StatefulWidget {
  const CustomCalendar({super.key});

  @override
  State<CustomCalendar> createState() => _CustomCalendarState();
}

class _CustomCalendarState extends State<CustomCalendar> {
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Container(
        decoration:
            BoxDecoration(border: Border.all(color: Colors.grey.shade300)),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              color: Theme.of(context).primaryColor,
              padding: EdgeInsets.all(10),
              child: Column(children: [
                Text("SELECIONE A DATA"),
                Row(
                  children: [
                    Text("Sex, Nov 17"),
                    IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.edit,
                          color: Colors.white,
                        ))
                  ],
                )
              ]),
            ),
            Container(
              padding: EdgeInsets.all(10),
              child: TableCalendar(
                focusedDay: DateTime.now(),
                firstDay: DateTime(2000),
                lastDay: DateTime(2100),
                selectedDayPredicate: (day) => isSameDay(DateTime.now(), day),
                onDaySelected: (selectedDay, focusedDay) {
                  setState(() {});
                },
                calendarStyle: CalendarStyle(
                  todayDecoration: BoxDecoration(
                    color: Colors.orange,
                    shape: BoxShape.circle,
                  ),
                  selectedDecoration: BoxDecoration(
                    color: Colors.deepOrange,
                    shape: BoxShape.circle,
                  ),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(onPressed: () {}, child: Text("Cancelar")),
                TextButton(onPressed: () {}, child: Text("Ok"))
              ],
            )
          ],
        ),
      ),
    );
  }
}
